package net.artron.cms.pgyuser.util;



import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;


import net.artron.cms.pgyuser.model.CommandUser;

import net.artron.cms.util.ResultEntity;

import net.mars.common.cmd.CmdException;
import net.mars.common.util.LocaleUtil;
import net.mars.core.ApplicationUtil;
import net.sf.json.JSONObject;


public class CommandResultUtil {

	public static ResultEntity<CommandUser> resultJson(HttpServletRequest request,String code,String operator,Integer status,String message)
    {
        /*CommandEntity result = new CommandEntity();*/
        ResultEntity<CommandUser> result = new ResultEntity<>();
        String operatorCommand = "command." + operator;
		result.setCommand(operator);
		String commandTitle = LocaleUtil.getMessage(request, operatorCommand, new Object[] {});
		result.setCommandTitle(commandTitle);
        result.setCode(code);
        result.setMessage(message);
        result.setStatus(status);
		return result;
    }
	
	
	public static ResultEntity<CommandUser> resultJson(HttpServletRequest request,String code,String operator,Integer status,String message,CommandUser object)
    {
        /*CommandEntity result = new CommandEntity();*/
        ResultEntity<CommandUser> result = new ResultEntity<>();
        String operatorCommand = "command." + operator;
		result.setCommand(operator);
		String commandTitle = LocaleUtil.getMessage(request, operatorCommand, new Object[] {});
		result.setCommandTitle(commandTitle);
        result.setCode(code);
        result.setMessage(message);
        result.setStatus(status);
        result.setData(object);
		return result;
    }
	

	
	/** 根据token得到当前登录者的id
	*@author luzh
	* @Title: getuserid 
	* @Description: TODO
	* @param request
	* @return    
	* @return String    
	* @throws 
	*/
	public String getUserid(HttpServletRequest request){
		JSONObject json = JSONObject.fromObject(this.getUser(request));
		return json.getString("id");
	}
	
	
	/** 得到角色信息
	*@author luzh
	* @Title: getcharacter 
	* @Description: TODO
	* @param request
	* @return    
	* @return String    
	* @throws 
	*/
	public String getCharacter(HttpServletRequest request){
		JSONObject json = JSONObject.fromObject(this.getUser(request));
		return json.getString("extra");
	}
	
	/** 根据token得到用户数据
	*@author luzh
	* @Title: getUser 
	* @Description: TODO
	* @param request
	* @return    
	* @return String    
	* @throws 
	*/
	public String getUser(HttpServletRequest request){
		String header = request.getHeader("Authorization");
		if (StringUtils.isBlank(header) || !header.startsWith("Bearer ")) {
			throw new CmdException("000000");
		}
		String token = header.replaceAll("Bearer ", "");
		try {
			token = ApplicationUtil.parseTokenSubject(token);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return token;
	}

	
	public static int Calculation(int total,int size){
		return (total%size==0)?total/size:(total/size+1);
	}
	
	
	/**
	 * 对list集合进行分页
	 * @param pageSize
	 * @param pageIndex
	 * @param list
	 * @return
	 */
	public static  List  Pager(int pageSize,int pageIndex,List list){
		//使用list 中的sublist方法分页
        List<Object> dataList;
          // 每页显示多少条记录
 
        int currentPage;
        int totalRecord = list.size();
        int totalPage = totalRecord % pageSize;
        if (totalPage > 0) {
            totalPage = totalRecord / pageSize + 1;
        } else {
        	totalPage = totalRecord / pageSize;
        }
        //当前第几页
        currentPage = totalPage < pageIndex ? totalPage : pageIndex;
        // 起始索引
        int fromIndex = pageSize * (currentPage - 1);
        // 结束索引
        int toIndex = pageSize * currentPage > totalRecord ? totalRecord : pageSize * currentPage;
        dataList = list.subList(fromIndex, toIndex);
        return dataList;
	}
}
