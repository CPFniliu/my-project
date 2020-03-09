package cn.cpf.web.base.lang.dict;

import java.util.Map;

/**
 * <b>Description : </b>
 *
 * @author CPF
 * @date 2019/12/16 14:06
 **/
public abstract class DictCacheIoHandle {

    public abstract Map<String, DictTypeBean> readAllFromCache();

    public abstract DictTypeBean readOneFromCache(String fieldKey);

    public abstract void writeAllToCache(Map<String, DictTypeBean> dataListMap);

    public abstract void writeOneToCache(DictTypeBean data);

    /**
     * 判断redis里面数据是否存在
     * 1. redis里面没有相关键    : return false
     * 2. redis正在被其它线程塞数据 : 等待一秒, 再次验证, 若依然如此, 返回 false
     * 3. redis里面有完整数据 : return true
     * 4. redis里面有数据, 但是数据不全 return true// 该结果应该无法验证
     * 5. redis无法联通  : return false
     *
     * @return true表示可以取数据, false表示不能取数据
     */
    public abstract boolean existDictData(String... tagList);

}
