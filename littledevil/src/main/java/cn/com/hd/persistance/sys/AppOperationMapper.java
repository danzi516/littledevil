package cn.com.hd.persistance.sys;

import cn.com.hd.domain.sys.AppOperation;


public interface AppOperationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AppOperation record);

    int insertSelective(AppOperation record);

    AppOperation selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AppOperation record);

    int updateByPrimaryKey(AppOperation record);
}