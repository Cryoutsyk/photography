package net.artron.cms.util;

import javax.servlet.http.HttpServletRequest;

import lombok.extern.slf4j.Slf4j;
import net.artron.cms.pgyuser.util.CommandResultUtil;
@Slf4j
public class HuidUtils {

	public static String getHuid( HttpServletRequest request) {
		String role= new CommandResultUtil().getCharacter(request);
		log.info("角色:"+role);
		String huid= "";
		if(role.equals(EnumRole.admin.toString()))
		{
			huid="zhubanfangyachang";//"雅昌主办方ID";
		}else if(role.equals(EnumRole.hostunit.toString()))
		{
			huid=new CommandResultUtil().getUserid(request);
		}
		return huid;
	}
}
