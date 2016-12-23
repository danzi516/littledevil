package cn.com.hd.persistance.company;

import java.util.List;

import cn.com.hd.common.Page;
import cn.com.hd.domain.company.CompanyInfo;
import cn.com.hd.domain.company.CompanyRoleOperation;


public interface CompanyRoleOperationMapper {
    int deleteByPrimaryKey(Integer id);
    
    int deleteByRoleId(Integer id);

    int insert(CompanyRoleOperation record);

    int insertSelective(CompanyRoleOperation record);

    CompanyRoleOperation selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CompanyRoleOperation record);

    int updateByPrimaryKey(CompanyRoleOperation record);
    
    List<CompanyRoleOperation> selectByPage(Page page);
    
    List<CompanyRoleOperation> selectByRoleId(Integer id);
}