package net.artron.cms.pgymanuscript.mapper;

import net.mars.PageModel;
import net.mars.core.mapper.ApplicationMapper;
import net.mars.mybatis.MarsMapper;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import net.artron.cms.pgymanuscript.model.ChannelStatistics;
import net.artron.cms.pgymanuscript.model.Pgymanuscript;
import net.artron.cms.pgymtmstjde.model.PendingCount;
import net.artron.cms.pgymtmstjde.model.RaterMst;
import net.artron.cms.pgymtmstjde.model.ReviewStatistics;

/**
 * Mapper.
 * 
 * @author zzg
 *
 */
@MarsMapper
public interface PgymanuscriptMapper extends ApplicationMapper<Pgymanuscript, String> {
	ChannelStatistics queryChannelCount(String mtid) throws DataAccessException;

	Integer queryMstCountByMtid(String mtid)throws DataAccessException;
	Integer updateBatch(List<ReviewStatistics> list)throws DataAccessException;
	Integer queryMstStateCountByMtid(String mtid)throws DataAccessException;
	Integer queryMaxCode(String dbid) throws DataAccessException;
	
	PendingCount queryCount(Map<String, String> map) throws DataAccessException;
	
	/**
	 * 分页查询.
	 * 
	 * @param page
	 * @return
	 */
	List<Pgymanuscript> queryMstByPage(PageModel<Pgymanuscript> page) throws DataAccessException;
	
	Integer queryNoScoreCountByMtid(String mtid) throws DataAccessException;
	
	List<Pgymanuscript> queryMstAll(Pgymanuscript pgymanuscript)throws DataAccessException;
	Pgymanuscript queryMst(Pgymanuscript  pgymanuscript)throws DataAccessException;
}
