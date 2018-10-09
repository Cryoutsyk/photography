package net.artron.cms.pgymtawards.service;
 
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.dao.DataAccessException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import net.mars.core.service.ApplicationService;
import net.mars.exception.MarsException;
import net.artron.cms.pgymtawards.model.Pgymtawards;
import net.artron.cms.pgymtawards.mapper.PgymtawardsMapper;

/**
 * Service.
 *
 * @author 
 */
@Slf4j
@Service(value = "pgymtawardsService")
public class PgymtawardsService extends ApplicationService<Pgymtawards, String> {
	/**
	 * mapper
	 */
	@Resource(name = "pgymtawardsMapper")
	PgymtawardsMapper  pgymtawardsMapper;
	
	/**
	 * 删除.
	 * @param 比赛ID
	 * @return 影响行数
	 * @throws MarsException 异常
	 */
	public Integer deleteByMtid(String mtid) throws MarsException {	
		
		Integer result=0;
		try {
			if(mtid==null || mtid.length()==0)
			{
				log.error("参数为空");
				throw new MarsException("失败");
			}
			result= pgymtawardsMapper.deleteByMtid(mtid);
		} catch (DuplicateKeyException e) {
			log.error(e.getMessage(), e);
			throw new MarsException("失败");
		} catch (DataAccessException de) {
			log.error(de.getMessage(), de);
			throw new MarsException("失败");
		} catch (MarsException ce) {
			log.error(ce.getMessage(), ce);
			throw new MarsException(ce.getMessage());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new MarsException("失败");
		}
		return result;
		
	}
	
	public List<Pgymtawards> queryByMtId(String mtid) throws MarsException
	{
		List<Pgymtawards> result=new ArrayList<Pgymtawards>();
		try {
			if(mtid==null || mtid.length()==0)
			{
				log.error("参数为空");
				throw new MarsException("查询失败");
			}
			result= pgymtawardsMapper.queryByMtId(mtid);
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
		return result;
	}
	
}
