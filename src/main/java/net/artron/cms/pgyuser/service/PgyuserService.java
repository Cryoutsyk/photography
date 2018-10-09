package net.artron.cms.pgyuser.service;
 
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import net.mars.common.util.DateUtil;
import net.mars.core.ApplicationUtil;
import net.mars.core.Token;
import net.mars.core.service.ApplicationService;
import net.mars.session.SessionContainer;
import net.artron.UserWrapper;
import net.artron.cms.pgyhostunit.mapper.PgyhostunitMapper;
import net.artron.cms.pgyhostunit.model.Pgyhostunit;
import net.artron.cms.pgyhostunit.service.PgyhostunitService;
import net.artron.cms.pgymatch.model.Pgymatch;
import net.artron.cms.pgyrater.mapper.PgyraterMapper;
import net.artron.cms.pgyrater.model.Pgyrater;
import net.artron.cms.pgyrater.service.PgyraterService;
import net.artron.cms.pgyuser.mapper.PgyuserMapper;
import net.artron.cms.pgyuser.model.Pgyuser;
import net.artron.cms.pgyuser.model.Usermasg;
import net.artron.organization.user.model.User;

/**
 * Service.
 *
 * @author 
 */
@Service(value = "pgyuserService")
public class PgyuserService extends ApplicationService<Pgyuser, String> {
	/**
	 * mapper
	 */
	@Resource(name = "pgyuserMapper")
	PgyuserMapper  pgyuserMapper;
	
	@Resource(name = "pgyraterService")
	PgyraterService pgyraterService;
	
	@Resource(name = "pgyhostunitService")
	PgyhostunitService pgyhostunitService;
	
	/**
	 * 验证手机号是否被注册(true 否;false 是)
	 * @param phone
	 * @return
	 */
	public boolean checkPhone(String phone){
		Pgyuser user=pgyuserMapper.checkPhone(phone);
		if (user==null) {
			return true;
		}else {
			return false;
		}
	}
	
	/**
	 * 修改密码
	 * @param pgyuser
	 */
	public void updatepwd(Pgyuser pgyuser){
		pgyuserMapper.updatepwd(pgyuser);
	}
	
	/**
	 * 查询主办方用户列表
	 * @param pgyuser
	 * @return
	 */
	public Set<Pgyuser> unitlist(Pgyuser pgyuser){
		return pgyuserMapper.unitlist(pgyuser);
	}
	
	/**
	 * 获取用户比赛记录列表
	 * @param userid
	 * @return
	 */
	public List<Pgymatch> matchlist(String userid){
		return pgyuserMapper.matchlist(userid);
	}
	
	
	/**
	 * 登录成功获取sessionid
	 * @param uwapper
	 * @param params
	 * @param pgyuser
	 */
	public void loginSuccess(Map<String, String> params){
		String character = StringUtils.isBlank(params.get("character")) ? "admin" : params.get("character");
		//创建token
		Token tokened = new Token();
		tokened.setId(params.get("userid"));
		tokened.setUserCode(params.get("username"));
		tokened.setUserName(params.get("nickname"));
		tokened.setExtra(character);
		String token = ApplicationUtil.createToken(tokened);
		String[] toks = token.split("\\.");
		String sessionId = toks[2].replaceAll("-", "");
		sessionId = sessionId.replaceAll("_", "");
		params.put("sessionId", sessionId);
		params.put("token", token);
		params.put("character", character);
	}
}


