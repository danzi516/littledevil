package cn.com.hd.service.uc;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.hd.common.Page;
import cn.com.hd.domain.uc.SaleMan;
import cn.com.hd.domain.uc.UserInfo;
import cn.com.hd.persistance.uc.SaleManMapper;
import cn.com.hd.persistance.uc.UserInfoMapper;

@Service("SaleManService")
public class SaleManService {
	@Autowired
	private SaleManMapper saleManMapper;
	@Transactional
	public int deleteByPrimaryKey(Integer id){
		return saleManMapper.deleteByPrimaryKey(id);
	}
	@Transactional
	public int insert(SaleMan record){
    	return saleManMapper.insert(record);
    }
	@Transactional
    public int insertSelective(SaleMan record){
    	return saleManMapper.insertSelective(record);
    }

    public SaleMan selectByPrimaryKey(Integer id){
    	return saleManMapper.selectByPrimaryKey(id);
    }
    
    @Transactional
    public int updateByPrimaryKeySelective(SaleMan record){
    	return saleManMapper.updateByPrimaryKeySelective(record);
    }
    @Transactional
    public int updateByPrimaryKey(SaleMan record){
    	return saleManMapper.updateByPrimaryKey(record);
    }
    public Page selectSaleManByPage(Page page){
    	page.setData(saleManMapper.selectSaleManByPage(page));
    	return page;
    }
}
