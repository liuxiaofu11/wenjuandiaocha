package com.tduck.cloud.api.men;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

/**
 * @author xfliu
 */

@Component
public class CacheProject {

   private static Map<String, String> hashMap;

    static {
        hashMap = new HashMap<>();
        hashMap.put("1","集团");
        hashMap.put("1199231610226159617","洛阳");
        hashMap.put("1204675502631157761","测试");
        hashMap.put("1207582621089050625","开封");
        hashMap.put("1240527968337539073","盘锦");
        hashMap.put("1245276858244878338","淮安");
        hashMap.put("1252478082446774274","钦州");
        hashMap.put("1262569614281506818","濮阳");
        hashMap.put("1286557531672596482","玉林二期");
        hashMap.put("1296362508213460994","武汉");
        hashMap.put("1303509926273003521","黄石");
        hashMap.put("1315902942707093506","徐州");
        hashMap.put("1315903936211881986","随州");
        hashMap.put("1329342245894344706","玉林一期");
        hashMap.put("1375019265462267905","淮安清江");
        hashMap.put("1475646498299596801","东莞领尚");
        hashMap.put("1501764612808429569","保定联农蔬菜");
        hashMap.put("1501765066669871105","保定联农果品");
        hashMap.put("1744295089060388865","宏进集团（test）");
    }

    // 提供一个公共的静态方法来获取hashMap
    public static String getHashMap(String code) {
        String value = "" ;
        if (StringUtils.isBlank(code)) {
            value=   hashMap.get(code);
        }
        return value;
    }

}
