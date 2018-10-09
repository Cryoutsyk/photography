package net.artron.cms.pgyuser.mapper;
  
import net.artron.cms.pgymatch.model.Pgymatch;
import net.artron.cms.pgyuser.model.Pgyuser;
import net.mars.core.mapper.ApplicationMapper;
import net.mars.mybatis.MarsMapper;

import java.util.List;
import java.util.Set;

/**
 * Mapper.
 * @author zzg
 *
 */
@MarsMapper
public interface PgyuserMapper extends ApplicationMapper<Pgyuser, String> {
	/**
	 * 验证手机号是否被注册
	 * @param phone
	 * @return
	 */
	Pgyuser checkPhone(String phone);
	
	/**
	 * 修改密码
	 * @param pgyuser
	 */
	void updatepwd(Pgyuser pgyuser);
	
	/**
	 * 查询主办方用户列表
	 * @param pgyuser
	 * @return
	 */
	Set<Pgyuser> unitlist(Pgyuser pgyuser);
	
	/**
	 * 获取用户比赛记录列表
	 * @param userid
	 * @return
	 */
	List<Pgymatch> matchlist(String userid);
}

