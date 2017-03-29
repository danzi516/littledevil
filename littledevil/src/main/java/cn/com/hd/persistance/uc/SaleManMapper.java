package cn.com.hd.persistance.uc;

import java.util.List;

import cn.com.hd.common.Page;
import cn.com.hd.domain.uc.SaleMan;


public interface SaleManMapper {
    int deleteByPrimaryKey(Integer id);
    
    int insert(SaleMan record);

    int insertSelective(SaleMan record);

    SaleMan selectByPrimaryKey(Integer id);
    
    int updateByPrimaryKeySelective(SaleMan record);

    int updateByPrimaryKey(SaleMan record);

    List<SaleMan> selectSaleManByPage(Page page);
}