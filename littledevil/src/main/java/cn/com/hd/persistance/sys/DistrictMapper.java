package cn.com.hd.persistance.sys;

import java.util.List;
import java.util.Map;

import cn.com.hd.domain.sys.District;


public interface DistrictMapper {
	 int deleteByPrimaryKey(Integer id);

	    int insert(District record);

	    int insertSelective(District record);

	    District selectByPrimaryKey(Integer id);

	    int updateByPrimaryKeySelective(District record);

	    int updateByPrimaryKey(District record);
	    
	    District selectByDistrictCode(String districtCode);
	    
	    District selectParentByDistrictCode(String districtCode);
	    
	    List<District> selectChildrenByDistrictCode(String districtCode);
	    
	    List<District> selectSameParentByDistrictCode(String districtCode);
	    
	    int updateByDistrictCode(District record);
	    
	    String selectDistrictNameByCode(String districtCode);
	    
	    List<District> selectByName(Map<String,Object> map);
	    
	    List<District> selectAllDistrict();
}