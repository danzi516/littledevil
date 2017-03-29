package cn.com.hd.controller.uc;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.com.hd.common.MD5Encrypt;
import cn.com.hd.common.Page;
import cn.com.hd.domain.company.CompanyStaff;
import cn.com.hd.domain.uc.SaleMan;
import cn.com.hd.domain.uc.User;
import cn.com.hd.domain.uc.UserInfo;
import cn.com.hd.service.company.CompanyStaffService;
import cn.com.hd.service.uc.SaleManService;
import cn.com.hd.service.uc.UserInfoService;
import cn.com.hd.service.uc.UserService;

/**
 *业务员控制器
 *类说明：系统初始化页面控制器
 *@author lijiaxing 2016/10/17
 *${webRoot}:系统运行根目录 
 **/
@Controller
@RequestMapping("/saleman")
public class SaleManController {
	@Resource
	private SaleManService saleManService;
	
	@Resource
	private CompanyStaffService companyStaffService;
	/**
	 * 功能描述：分页查询所有业务员
	 * 作者：lijiaxing
	 * url：${webRoot}/saleman/selectSaleManByPage
	 * 请求方式：POST
	 * @param  Page page
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 *         key:rows[查询结果ist]
	 *         key:total[记录总数]
	 */
    @RequestMapping(value="selectSaleManByPage",method=RequestMethod.POST)
    public @ResponseBody Map<String, Object> selectByPage(Page page){
        Map<String,Object> map = new HashMap<String,Object>();
        String code="";
        try{
            page = saleManService.selectSaleManByPage(page);
            code="0";
            map.put("rows", page.getData());
    		map.put("total", page.getTotalRecord());
        }catch(Exception e){
            code="1";
            e.printStackTrace();
        }
        map.put("code", code);
        return map;
    }
	
	
	/**
	 * 功能描述：删除业务员
	 * 作者：lijiaxing
	 * url：${webRoot}/saleman/deleteSaleMan
	 * 请求方式：GET
	 * @param  id
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 */
	@RequestMapping("deleteSaleMan/{id}")
	public @ResponseBody Map<String,Object> deleteSaleMan(@PathVariable("id") int id){
		Map<String,Object> map=new HashMap<String,Object>();
		String code="";
		try{
			saleManService.deleteByPrimaryKey(id);
			code="0";
		}catch(Exception e){
            code="1";
            e.printStackTrace();
        }
        map.put("code", code);
        return map;
	}
	
	/**
	 * 功能描述：添加业务员
	 * 作者：lijiaxing
	 * url：${webRoot}/saleman/insert
	 * 请求方式：POST
	 * @param  id
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 */
	@RequestMapping(value="insert",method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> insertAdmin(@RequestBody SaleMan saleMan){
		Map<String,Object> map=new HashMap<String,Object>();
		String code="";
		try{
			saleManService.insert(saleMan);
			code="0";
		}catch(Exception e){
            code="1";
            e.printStackTrace();
        }
        map.put("code", code);
        return map;
	}
	
	/**
	 * 功能描述：更新业务员
	 * 作者：lijiaxing
	 * url：${webRoot}/saleman/update
	 * 请求方式：POST
	 * @param  id
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 */
	@RequestMapping(value="update",method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> updatePerson(@RequestBody SaleMan saleMan){
		Map<String,Object> map=new HashMap<String,Object>();
		String code="";
		try{
			saleManService.updateByPrimaryKeySelective(saleMan);
			code="0";
		}catch(Exception e){
            code="1";
            e.printStackTrace();
        }
        map.put("code", code);
        return map;
	}
	
}
