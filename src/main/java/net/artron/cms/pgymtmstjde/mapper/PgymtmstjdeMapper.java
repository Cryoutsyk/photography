package net.artron.cms.pgymtmstjde.mapper;

import net.mars.PageModel;
import net.mars.core.mapper.ApplicationMapper;
import net.mars.mybatis.MarsMapper;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import net.artron.cms.pgymtmstjde.model.JudgeRatio;
import net.artron.cms.pgymtmstjde.model.PageModelHelper;
import net.artron.cms.pgymtmstjde.model.PendingCount;
import net.artron.cms.pgymtmstjde.model.Pgymtmstjde;
import net.artron.cms.pgymtmstjde.model.RaterMst;
import net.artron.cms.pgymtmstjde.model.ReviewStatistics;

/**
 * Mapper.
 * 
 * @author zzg
 *
 */
@MarsMapper
public interface PgymtmstjdeMapper extends ApplicationMapper<Pgymtmstjde, String> {
	void batchInsert(List<Pgymtmstjde> mtmstjde) throws DataAccessException;

	List<JudgeRatio> queryBfbByMtid(String mtid) throws DataAccessException;

	List<ReviewStatistics> queryStatisticsByMtid (String mtid) throws DataAccessException;
	
	PendingCount queryCount(Map<String, String> map) throws DataAccessException;
	
	/**
	 * 分页查询.
	 * 
	 * @param page
	 * @return
	 */
	List<RaterMst> queryRaterMstByPage(PageModel<RaterMst> page) throws DataAccessException;
}
