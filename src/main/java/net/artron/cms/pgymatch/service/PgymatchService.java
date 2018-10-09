package net.artron.cms.pgymatch.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.dao.DataAccessException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import net.artron.cms.pgymatch.mapper.PgymatchMapper;
import net.artron.cms.pgymatch.model.Pgymatch;
import net.mars.Entity;
import net.mars.PageModel;
import net.mars.core.service.ApplicationService;
import net.mars.exception.MarsException;

/**
 * Service.
 *
 * @author
 */
@Slf4j
@Service(value = "pgymatchService")
public class PgymatchService extends ApplicationService<Pgymatch, String> {
	/**
	 * mapper
	 */
	@Resource(name = "pgymatchMapper")
	PgymatchMapper pgymatchMapper;

	/**
	 * 查询当天最大的code
	 * 
	 * @param 当天日期
	 *            例:20180911
	 * @return 最大code后两位的数字
	 */
	public Integer queryMaxCode(String nyr) throws MarsException {

		Integer result = 0;
		try {
			if (nyr == null || nyr.length() == 0)
			{
				log.error("参数为空");
				throw new MarsException("查询失败");
			}
			result = pgymatchMapper.queryMaxCode(nyr);
		} catch (DuplicateKeyException e) {
			log.error(e.getMessage(), e);
			throw new MarsException("查询失败");
		} catch (DataAccessException de) {
			log.error(de.getMessage(), de);
			throw new MarsException("查询失败");
		} catch (MarsException ce) {
			log.error(ce.getMessage(), ce);
			throw new MarsException(ce.getMessage());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new MarsException("查询失败");
		}
		return result == null ? 0 : result;
	}

	/*
	 * 上线并开始征稿
	 */
	public Integer updateOnline(String dbId,  Integer onlinestate,String competitionstate)
			throws MarsException {
		Integer result = 0;
		try {
			if (dbId == null || dbId.length() == 0)
			{
				log.error("参数为空");
				throw new MarsException("上线失败");
			}
			if (onlinestate == null) {
				log.error("onlinestate为空");
				throw new MarsException("上线失败");
			}
			Map<String, String> map = new HashMap<String, String>();
			map.put("dbId", dbId);
			map.put("onlinestate", onlinestate.toString());
			map.put("competitionstate", competitionstate);

			result = pgymatchMapper.updateOnline(map);

		} catch (DuplicateKeyException e) {
			log.error(e.getMessage(), e);
			throw new MarsException("上线失败");
		} catch (DataAccessException de) {
			log.error(de.getMessage(), de);
			throw new MarsException("上线失败");
		} catch (MarsException ce) {
			log.error(ce.getMessage(), ce);
			throw new MarsException(ce.getMessage());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new MarsException("上线失败");
		}
		return result;
	}

	public Integer updateCompetition(String dbId,   String competitionstate) throws MarsException {
		Integer result = 0;
		try {
			if (dbId == null || dbId.length() == 0)
			{
				log.error("参数为空");
				throw new MarsException("修改失败");
			}
			if (competitionstate == null ||competitionstate.length()==0) {
				log.error("competitionstate为空");
				throw new MarsException("修改失败");
			}
			Map<String, String> map = new HashMap<String, String>();
			map.put("dbId", dbId);
			map.put("competitionstate", competitionstate);

			result = pgymatchMapper.updateCompetition(map);

		} catch (DuplicateKeyException e) {
			log.error(e.getMessage(), e);
			throw new MarsException("修改失败");
		} catch (DataAccessException de) {
			log.error(de.getMessage(), de);
			throw new MarsException("修改失败");
		} catch (MarsException ce) {
			log.error(ce.getMessage(), ce);
			throw new MarsException(ce.getMessage());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new MarsException("修改失败");
		}
		return result;
	}

	/**
	 * 查询比赛当前状态
	 * @param dbId
	 * @return
	 * @throws MarsException
	 */
	public String queryStateById(String dbId)  throws MarsException {

		String result = "";
		try {
			if (dbId == null || dbId.length() == 0)
			{
				log.error("dbId为空");
				throw new MarsException("查询失败");
			}
			result = pgymatchMapper.queryStateById(dbId);
		}  catch (MarsException ce) {
			log.error(ce.getMessage(), ce);
			throw new MarsException(ce.getMessage());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new MarsException("查询失败");
		}
		return result ;
	}
	
	/**
	 * 查询比赛是否获奖
	 * @param dbId
	 * @param userId
	 * @return
	 */
	public Pgymatch queryAwardUser(String dbId , String userId){
		Map<String, String> map = new HashMap<String, String>();
		map.put("dbId", dbId);
		map.put("userId", userId);
		return pgymatchMapper.queryAwardUser(map);
	}
	/** 按年份及月份分组查询
	*@author luzh
	* @Title: queryAllYear 
	* @Description: TODO
	* @return    
	* @return List    
	* @throws 
	*/
	public List<String> queryAllYear(){
		return pgymatchMapper.queryAllYear();
	}
	
	public List<? extends Entity> queryIndex(PageModel<? extends Entity> pageModel) {
		return pgymatchMapper.queryIndex(pageModel);
	}
	
}
