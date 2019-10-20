package cn.cpf.web.base.lang.base;

import com.google.common.collect.Maps;

import java.util.Map;

/**
 * <b>Description : </b>
 *
 * @author CPF
 * @date 2019/8/1 18:43
 **/
public class RecordMap implements IGetter {

    protected Map<String, Object> map = null;

    public Object put(String key, Object object) {
        if (map == null) {
            map = Maps.newHashMap();
        }
        return map.put(key, object);
    }

    public void putAll(Map<String, Object> objectMap) {
        if (map == null) {
            map = objectMap;
        }
        map.putAll(objectMap);
    }

    @Override
    public Object get(String key) {
        if (map == null) {
            return null;
        }
        return map.get(key);
    }

    /**
     * 移除 map 中 key 的键值对应的对象
     *
     * @return 移除的对象
     */
    public Object remove(String key) {
        if (map == null) {
            return null;
        }
        return map.remove(key);
    }

    /**
     * 移除 map 中 key 的键值对应的对象
     *
     * @return 移除的对象
     */
    public <T> T remove(String key, Class<T> tClass) {
        Object obj = remove(key);
        return tClass.cast(obj);
    }

    protected Map<String, Object> getMap() {
        return this.map;
    }

}
