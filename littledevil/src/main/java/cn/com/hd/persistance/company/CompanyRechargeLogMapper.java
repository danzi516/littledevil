package cn.com.hd.persistance.company;

import java.util.List;

import cn.com.hd.common.Page;
import cn.com.hd.domain.company.CompanyInfo;
import cn.com.hd.domain.company.CompanyRechargeLog;


public interface CompanyRechargeLogMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CompanyRechargeLog record);

    int insertSelective(CompanyRechargeLog record);

    CompanyRechargeLog selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CompanyRechargeLog record);

    int updateByPrimaryKey(CompanyRechargeLog record);
    
    List<CompanyRechargeLog>  selectBySelective(CompanyRechargeLog record);
    
    List<CompanyRechargeLog> selectByPage(Page page);
    
}