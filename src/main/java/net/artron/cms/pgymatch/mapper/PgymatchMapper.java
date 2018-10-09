package net.artron.cms.pgymatch.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import net.artron.cms.pgymatch.model.Pgymatch;
import net.mars.Entity;
import net.mars.PageModel;
import net.mars.core.mapper.ApplicationMapper;
import net.mars.mybatis.MarsMapper;

/**
 * Mapper.
 * 
 * @author zzg
 *
 */
@MarsMapper
public interface PgymatchMapper extends ApplicationMapper<Pgymatch, String> {
	/**
	 * 查询当天最大的code
	 * 
	 * @param 当天日期 例:20180911
	 * @return 最大code后两位的数字
	 */
	Integer queryMaxCode(String nyr) throws DataAccessException;

	Integer updateOnline(Map<String, String> map) throws DataAccessException;

	Integer updateCompetition(Map<String, String> map) throws DataAccessException;
	/**
	 * 查询比赛当前状态
	 * @param dbId
	 * @return
	 * @throws DataAccessException
	 */
	String queryStateById(String dbId) throws DataAccessException;
	
	public List<String> queryAllYear();
	
	/**
	 * 查询比赛是否获奖
	 * @param dbId
	 * @param userId
	 * @return
	 */
	Pgymatch queryAwardUser(Map<String, String> map);
	
	/** 列表前台查询
	*@author luzh
	* @Title: queryIndex 
	* @Description: TODO
	* @param page
	* @return    
	* @return List<Pgymatch>    
	* @throws 
	*/
	public List<? extends Entity> queryIndex(PageModel<? extends Entity> pageModel);
}
