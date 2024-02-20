package com.tduck.cloud.api.web.interceptor;

import cn.hutool.core.util.StrUtil;
import com.tduck.cloud.account.service.UserTokenService;
import com.tduck.cloud.account.util.JwtUtils;
import com.tduck.cloud.api.annotation.NotLogin;
import com.tduck.cloud.api.exception.AuthorizationException;
import com.tduck.cloud.common.util.CacheUtils;
import com.tduck.cloud.common.util.SecurityUtils;
import io.jsonwebtoken.Claims;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.annotation.security.PermitAll;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author qing
 */
@Component
public class AuthorizationInterceptor extends HandlerInterceptorAdapter {
    public static final String USER_KEY = "userId";


    private final JwtUtils jwtUtils;

    private final UserTokenService userTokenService;

    public AuthorizationInterceptor(JwtUtils jwtUtils, UserTokenService userTokenService) {
        this.jwtUtils = jwtUtils;
        this.userTokenService = userTokenService;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 是否不需要登录
        NotLogin annotation;
        PermitAll permitAll;
        if (handler instanceof HandlerMethod) {
            annotation = ((HandlerMethod) handler).getMethodAnnotation(NotLogin.class);
            permitAll = ((HandlerMethod) handler).getMethodAnnotation(PermitAll.class);
        } else {
            return true;
        }

        if (annotation != null || permitAll != null) {
            return true;
        }

        //获取用户凭证
        String token = request.getHeader(jwtUtils.getHeader());
        if (StrUtil.isBlank(token)) {
            token = request.getParameter(jwtUtils.getHeader());
        }

        //凭证为空
        if (StrUtil.isBlank(token)) {
            throw new AuthorizationException(jwtUtils.getHeader() + "不能为空");
        }

        Claims claims = jwtUtils.getClaimByToken(token);
        if (claims == null || jwtUtils.isTokenExpired(claims.getExpiration())) {
            throw new AuthorizationException(jwtUtils.getHeader() + "失效，请重新登录");
        }
        long userId = Long.parseLong(claims.getSubject());
        // 缓存中是否存在token
        boolean verified = userTokenService.verifyToken(token, userId);
        if (!verified) {
            throw new AuthorizationException(jwtUtils.getHeader() + "失效，请重新登录");
        }
        // 设置userId到request里，后续根据userId，获取用户信息
        request.setAttribute(USER_KEY, userId);
        // 不允许访问
        if (StrUtil.containsAny(request.getRequestURI(), "/mange/", "/system/env/")) {
            if (!SecurityUtils.isAdmin(userId)) {
                throw new AuthorizationException("无权限访问");
            }
        }
        return true;
    }
}
