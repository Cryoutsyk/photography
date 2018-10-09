package net.artron.cms.pgymanuscript.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.dao.DataAccessException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import net.mars.PageModel;
import net.mars.core.service.ApplicationService;
import net.mars.exception.MarsException;
import net.artron.cms.pgymanuscript.model.ChannelStatistics;
import net.artron.cms.pgymanuscript.model.Pgymanuscript;
import net.artron.cms.pgymtmstjde.model.PendingCount;
import net.artron.cms.pgymtmstjde.model.RaterMst;
import net.artron.cms.pgymtmstjde.model.ReviewStatistics;
import net.artron.cms.pgymanuscript.mapper.PgymanuscriptMapper;

/**
 * Service.
 *
 * @author
 */
@Slf4j
@Service(value = "pgymanuscriptService")
public class PgymanuscriptService extends ApplicationService<Pgymanuscript, String> {
	/**
	 * mapper
	 */
	@Resource(name = "pgymanuscriptMapper")
	PgymanuscriptMapper pgymanuscriptMapper;

	public ChannelStatistics queryChannelCount(String mtid) throws MarsException {
		ChannelStatistics result = new ChannelStatistics();
		try {
			if (mtid == null || mtid.length() == 0) {
				log.error("mtid为空");
				throw new MarsException("查询失败");
			}
			result = pgymanuscriptMapper.queryChannelCount(mtid);
		} catch (DuplicateKeyException e) {
			log.error(e.getMessage(), e);
			throw new MarsException("查询失败");
		} catch (DataAccessException de) {
			log.error(de.getMessage(), de);
			throw new MarsException("查询失败");
		} catch (MarsException ce) {
			log.error(ce.getMessage(), ce);
			throw new MarsException("查询失败");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new MarsException("查询失败");
		}
		return result;
	}
	
	public Integer queryMstCountByMtid(String mtid) throws MarsException {
		Integer result=0;
		try {
			if (mtid == null || mtid.length() == 0) {
				log.error("mtid为空");
				throw new MarsException("查询失败");
			}
			result = pgymanuscriptMapper.queryMstCountByMtid(mtid);
		} catch (MarsException ce) {
			log.error(ce.getMessage(), ce);
			throw new MarsException("查询失败");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new MarsException("查询失败");
		}
		return result;
	}
	
	public Integer queryMstStateCountByMtid(String mtid)
	{
		return pgymanuscriptMapper.queryMstStateCountByMtid(mtid);
	}
	
	public Integer updateBatch(List<ReviewStatistics> list)
	{
		return pgymanuscriptMapper.updateBatch(list);
	}
	
	public Integer queryMaxCode(String mstid) throws MarsException {

		Integer result = 0;
		try {
			if (mstid == null || mstid.length() == 0)
			{
				log.error("参数为空");
				throw new MarsException("查询失败");
			}
			result = pgymanuscriptMapper.queryMaxCode(mstid);
		} catch (MarsException ce) {
			log.error(ce.getMessage(), ce);
			throw new MarsException(ce.getMessage());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new MarsException("查询失败");
		}
		return result == null ? 0 : result;
	}
	
	
	public PendingCount queryCount(String mtid, String statenum, String mtgpid) {
		Map<String, String> map = new HashMap<>();
		map.put("mtid", mtid);
		map.put("statenum", statenum);
		map.put("mtgpid", mtgpid);
		PendingCount result=pgymanuscriptMapper.queryCount(map);
		if(result!=null)
		{
			result.setAllcount(result.getDscount()+result.getWtgcount()+result.getTgcount());
		}
		return result;
	}

	/**
	 * 分页查询.
	 * 
	 * @param page
	 *            查询对象
	 * @return 返回查询数据列表
	 */
	public List<Pgymanuscript> queryMstByPage( PageModel<Pgymanuscript> page) {
		return pgymanuscriptMapper.queryMstByPage(page);
	}
	
	public Integer queryNoScoreCountByMtid(String mtid) {
		return pgymanuscriptMapper.queryNoScoreCountByMtid(mtid);
	}
	
	public List<Pgymanuscript> queryMstAll(Pgymanuscript pgymanuscript)
	{
		return pgymanuscriptMapper.queryMstAll(pgymanuscript);
	}
	public Pgymanuscript queryMst(Pgymanuscript  pgymanuscript)
	{
		return pgymanuscriptMapper.queryMst(pgymanuscript);
	}
}
