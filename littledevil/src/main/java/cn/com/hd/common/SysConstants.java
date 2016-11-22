package cn.com.hd.common;

import java.util.HashMap;
import java.util.Map;


public class SysConstants {
	
	/**
	 * 定义 超级管理员 
	 */
	public static final String ADMIN_NAME = "admin";
	
	/**
	 * 学生角色
	 */
	public static final String STUDENT_ROLE = "student";
	
	/**
	 * 家长角色
	 */
	public static final String PARENT_ROLE = "parent";
	
	/**
	 * 教师角色
	 */
	public static final String TEACHER_ROLE = "teacher";
	
	/**
	 * 个人角色
	 */
	public static final String PERSON_ROLE = "person";
	
	/**
	 * 学校角色
	 */
	public static final String SCHOOL_ROLE = "school";
	
	/**
	 * 机构角色
	 */
	public static final String ORG_ROLE = "org";
	
	/**
	 * 系统角色
	 */
	public static final String SYS_ROLE = "sys";
	
	/**
	 * true 状态
	 */
	public static final String STATE_TRUE="1";
	
	/**
	 * false 状态
	 */
	public static final String STATE_FALSE="0";
	
	/*
	 * 文件上传路径
	 */
	public static final String File_UPLOAD_PATH = "res/upload/";
	
	/**
	 * 性别
	 */
	public static final Map SEX = new HashMap(){
		{
			put("1","男");
			put("0","女");
			put("2","保密");
		}
	};
	
	/**
	 * 角色
	 */
	public static final Map USER_ROLE = new HashMap(){
		{
			put("parent","家长");
			put("student","学生");
			put("teacher","教师");
		}
	};	
	/**
	 * 学段
	 */
	public static final Map FACULTY = new HashMap(){
		{
			put("xx","小学");
			put("cz","初中");
			put("gz","高中");
		}
	};
	
	/**
	 * 获取学段编码字符串，多个用逗号隔开
	 */
	public static String getFacultyNames(String facultyCode){
		 if(facultyCode!=null&&!facultyCode.equals("")){
			 String[] codes=facultyCode.split(",");
			 String names="";
			 for(int i=0;i<codes.length;i++){
				 if(i==codes.length-1){
					 names+=FACULTY.get(codes[i]);
				 }else{
					 names+=FACULTY.get(codes[i])+",";
				 }
			 }
			 return names;
		 }else{
			 return "";
		 }
	}
	
	/**
	 * 获取学段编码字符串，多个用逗号隔开
	 */
	public static String getFacultyCodes(String facultyName){
		 if(facultyName!=null&&!facultyName.equals("")){
			 String[] names=facultyName.split(",");
			 String codes="";
			 for(int i=0;i<names.length;i++){
				 if(i==names.length-1){
					 codes+=getFacultyCode(names[i]);
				 }else{
					 codes+=getFacultyCode(names[i])+",";
				 }
			 }
			 return codes;
		 }else{
			 return "";
		 }
	}
	/**
	 * 获取学段编码
	 */
	public static String getFacultyCode(String facultyName){
		if("小学".equals(facultyName)){
			return "xx";
		}else if("初中".equals(facultyName)){
			return "cz";
		}else if("高中".equals(facultyName)){
			return "gz";
		}else{
			return "";
		}
	}
	
	/**
	 * 用户类型CODE
	 */
	public static final String USER_TYPE = "user_type";
	
	/**
	 * 个人用户下面的分类
	 */
	public static final String PERSON = "person";
	
	/**
	 * 民族  字典表对应的CODE
	 */
	public static final String NATION = "nation";
	
	/**
	 * 政治面貌 字典表对应的CODE
	 */
	public static final String POLITICAL = "political";
	
	
	/**
	 *机构类型
	 */
	public static final Map ORG_TYPE = new HashMap(){
		{
			put("0","省");
			put("1","市");
			put("2","区");
		}
	};
	/**
	 * 获取机构类型标识
	 */
	public static String getOrgTypeCode(String orgTypeName){
		if("省".equals(orgTypeName)){
			return "0";
		}else if("市".equals(orgTypeName)){
			return "1";
		}else if("区".equals(orgTypeName)){
			return "2";
		}else{
			return "";
		}
	}
	
	/**
	 * 推送应用分类  字典表对应的CODE
	 */
	public static final String APP_GROUP_USER = "app_group_user";
	
	
	/**
	 * 系统菜单应用分类  字典表对应的CODE
	 */
	public static final String APP_GROUP_SYS = "app_group_sys";
	
	
	/**
	 * 应用是否收费
	 */
	public static final Map IS_PAY = new HashMap(){
		{
			put("0","免费");
			put("1","收费");
		}
	};
	
	/**
	 * 区域表第一级的 parent_code
	 */
	public static final String DISTRICT_PARENT_CODE = "000000";
	
	
	/**
	 * 学校类型SCHOOL_OBJECT_TYPE
	 */
	public static final String SCHOOL_OBJECT_TYPE = "1";
	
	/**
	 * 机构类型ORG_OBJECT_TYPE
	 */
	public static final String ORG_OBJECT_TYPE = "2";
	
	/**
	 * 导入人员的临时路径
	 */
	public static final String TMP_PATH = "WEB-INF/tmp/";
	
	/**
	 * lijiaxing 20160505 
	 * 添加批量导数据文件存放路径
	 */
	public static final String BATCH_IMPORT_RECORD_PATH = "import/";
	
	/*
	 * 文件上传路径
	 */
	public static final String FILE_UPLOAD_PATH = "res/upload/";
	
	/**
	 * 应用是否收费
	 */
	public static final Map TEMP_FILEPATH = new HashMap(){
		{
			put("temp_org","res/tempFile/temp_org.xlsx");
			put("temp_school","res/tempFile/temp_school.xlsx");
			put("temp_student","res/tempFile/temp_student.xls");
			put("temp_teacher","res/tempFile/temp_teacher.xls");
			put("temp_orgUser","res/tempFile/temp_org_user.xls");
			put("temp_building","res/tempFile/temp_building.xlsx");
			put("temp_classroom","res/tempFile/temp_classroom.xlsx");
			put("temp_term","res/tempFile/temp_term.xlsx");
			put("temp_dailyRoutine","res/tempFile/temp_dailyRoutine.xlsx");
			put("temp_courseInfo","res/tempFile/temp_courseInfo.xlsx");
			put("temp_compulsoryCourse","res/tempFile/temp_compulsoryCourse.xlsx");
			put("temp_optionalCourse","res/tempFile/temp_optionalCourse.xlsx");
		}
	};
	public static final Map TEMP_FILENAME = new HashMap(){
		{
			put("temp_org","机构信息导入模版.xlsx");
			put("temp_school","学校信息导入模版.xlsx");
			put("temp_student","学生信息导入模版.xls");
			put("temp_teacher","教师信息导入模板.xls");
			put("temp_orgUser","机构人员信息导入模板.xls");
			put("temp_building","教学楼表导入模版.xlsx");
			put("temp_classroom","教室表导入模版.xlsx");
			put("temp_term","学期表导入模版.xlsx");
			put("temp_dailyRoutine","作息表导入模版.xlsx");
			put("temp_courseInfo","课程表导入模版.xlsx");
			put("temp_compulsoryCourse","必修课表导入模版.xlsx");
			put("temp_optionalCourse","任选课表导入模版.xlsx");
		}
	};
}	



