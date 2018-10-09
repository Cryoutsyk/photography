/*package net.artron.cms.cache;


import net.artron.cms.cache.PropertiesUtil;
import net.artron.cms.cache.SsmUtil;

import java.util.HashMap;
import java.util.Properties;

*//**
 * redis连接池 Map对象
 *//*
public class RedisUtil {

    *//**
     * redis连接池Map
     * 可以有多个连接池对象
     *//*
    private static HashMap<String, RedisPool> redisPoolMap = new HashMap<>();


    private final static String REDIS_PROFILE = "conf.properties";

    *//**
     * 获取连接池对象
     *
     * @param poolName 连接池的名称 需要和配置文件对应
     * @return 连接池对象
     *//*
    public static synchronized RedisPool getRedisPool(String poolName) {
        RedisPool rp = null;
        if (redisPoolMap.containsKey(poolName)) {
            rp = redisPoolMap.get(poolName);
        } else {
            //读取poolname对应的配置文件的属性来构建poolName
            try {
                Properties pro = PropertiesUtil.getProperties(REDIS_PROFILE,"utf-8");
                rp = createRedisPool(poolName, pro);
                redisPoolMap.put(poolName, rp);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return rp;
    }

    private static RedisPool createRedisPool(String poolName, Properties pro) {
        String ip = pro.getProperty(poolName + "redis.server.host");
        String port = pro.getProperty(poolName + "redis.server.port");

        int maxWait = SsmUtil.convert(pro.getProperty(poolName + "redis.pool.maxWaitMillis"), 0);
        int maxActive = SsmUtil.convert(pro.getProperty(poolName + "redis.pool.maxTotal"), 0);
        int maxIdle = SsmUtil.convert(pro.getProperty(poolName + "redis.pool.maxIdle"), 0);
        System.out.println((poolName + "redis.server.host") + ":[ip:" + ip + " 端口:" + port + " 等待:" + maxWait + " maxActive:" + maxActive + " maxIdle:" + maxIdle + "]");
        return new RedisPool(poolName, ip, port, maxWait, maxActive, maxIdle);
    }

}
*/