package net.artron.cms.pgymtmstjde.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import net.mars.PageModel;
import net.mars.common.cmd.CmdException;
import net.mars.common.cmd.Command;
import net.mars.core.mapper.ApplicationMapper;
import net.mars.core.service.ApplicationService;
import net.mars.exception.MarsException;
import net.artron.cms.pgymtmstjde.model.JudgeRatio;
import net.artron.cms.pgymtmstjde.model.PageModelHelper;
import net.artron.cms.pgymtmstjde.model.PendingCount;
import net.artron.cms.pgymtmstjde.model.Pgymtmstjde;
import net.artron.cms.pgymtmstjde.model.RaterMst;
import net.artron.cms.pgymtmstjde.model.ReviewStatistics;
import net.artron.cms.pgymtmstjde.model.Statistics;
import net.artron.cms.util.DictUtils;
import net.artron.cms.pgymtassignjudge.model.Pgycheckrater;
import net.artron.cms.pgymtassignjudge.service.PgymtassignjudgeService;
import net.artron.cms.pgymtmstjde.mapper.PgymtmstjdeMapper;

/**
 * Service.
 *
 * @author
 */
@Slf4j
@Service(value = "pgymtmstjdeService")
public class PgymtmstjdeService extends ApplicationService<Pgymtmstjde, String> {
	/**
	 * mapper
	 */
	@Resource(name = "pgymtmstjdeMapper")
	PgymtmstjdeMapper pgymtmstjdeMapper;

	/**
	 * 分配评委-保存评委稿件
	 * 
	 * @param mtmstjde
	 * @throws MarsException
	 */
	public void batchInsert(List<Pgymtmstjde> mtmstjde) throws MarsException {

		try {
			if (mtmstjde == null || mtmstjde.size() == 0) {
				log.error("Pgymtmstjde为空");
				throw new MarsException("保存失败");
			}
			pgymtmstjdeMapper.batchInsert(mtmstjde);
		} catch (MarsException ce) {
			log.error(ce.getMessage(), ce);
			throw new MarsException(ce.getMessage());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new MarsException("保存失败");
		}
	}

	/**
	 * 初评页签百分比数据
	 * 
	 * @param mtid
	 * @return
	 * @throws MarsException
	 */
	public List<JudgeRatio> queryBfbByMtid(String mtid) throws MarsException {
		List<JudgeRatio> jr = new ArrayList<JudgeRatio>();
		try {
			if (mtid == null || mtid.length() == 0) {
				log.error("mtid为空");
				throw new MarsException("查询失败");
			}
			jr = pgymtmstjdeMapper.queryBfbByMtid(mtid);
		} catch (MarsException ce) {
			log.error(ce.getMessage(), ce);
			throw new MarsException(ce.getMessage());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new MarsException("查询失败");
		}
		return jr;
	}

	/**
	 * 合并初评结果
	 * 
	 * @param rs
	 */
	public List<ReviewStatistics> queryMergeResult(String mtid) throws MarsException {
		List<ReviewStatistics> rs = new ArrayList<ReviewStatistics>();
		try {
			if (mtid == null || mtid.length() == 0) {
				log.error("mtid为空");
				throw new MarsException("查询失败");
			}
			rs = pgymtmstjdeMapper.queryStatisticsByMtid(mtid);
			if (rs != null && rs.size() > 0) {
				for (ReviewStatistics reviewStatistics : rs) {
					List<Statistics> ss = reviewStatistics.getStatistics().stream().filter(s -> s.getAuditstate() == 1)
							.collect(Collectors.toList());
					if (ss != null && ss.size() > 0) {
						reviewStatistics.setStatus(1);
					} else {
						ss = reviewStatistics.getStatistics().stream().filter(s -> s.getAuditstate() == 2)
								.collect(Collectors.toList());
						if (ss != null && ss.size() > 0) {
							reviewStatistics.setStatus(2);
						} else {
							reviewStatistics.setStatus(0);
						}
					}
				}
			}
		} catch (MarsException ce) {
			log.error(ce.getMessage(), ce);
			throw new MarsException(ce.getMessage());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new MarsException("查询失败");
		}
		return rs;
	}

	/**
	 * 取初评待评审数
	 * 
	 * @param mtid
	 * @return
	 * @throws MarsException
	 */
	public Integer queryNotReviewedCountByMtid(String mtid) throws MarsException {
		List<ReviewStatistics> rs = new ArrayList<ReviewStatistics>();
		Integer NotReviewed = 0;
		try {
			if (mtid == null || mtid.length() == 0) {
				log.error("mtid为空");
				throw new MarsException("查询失败");
			}
			rs = queryMergeResult(mtid);
			if (rs != null && rs.size() > 0) {
				NotReviewed = rs.stream().filter(s -> s.getStatus() == 0).collect(Collectors.toList()).size();
			}

		} catch (MarsException ce) {
			log.error(ce.getMessage(), ce);
			throw new MarsException(ce.getMessage());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new MarsException("查询失败");
		}
		return NotReviewed;
	}

	/**
	 * 初评统计
	 * 
	 * @param mtid
	 *            比赛ID
	 * @return List<Integer> 0:总稿件数,1:待评审数,2:未通过数,3:通过数
	 * @throws MarsException
	 */
	public List<Integer> queryStatisticsByMtid(String mtid) throws MarsException {
		List<ReviewStatistics> rs = new ArrayList<ReviewStatistics>();
		List<Integer> list = new ArrayList<Integer>();
		try {
			if (mtid == null || mtid.length() == 0) {
				log.error("mtid为空");
				throw new MarsException("查询失败");
			}
			rs = queryMergeResult(mtid);
			if (rs != null && rs.size() > 0) {
				list.add(rs.size());
				list.add(rs.stream().filter(s -> s.getStatus() == 0).collect(Collectors.toList()).size());
				list.add(rs.stream().filter(s -> s.getStatus() == 2).collect(Collectors.toList()).size());
				list.add(rs.stream().filter(s -> s.getStatus() == 1).collect(Collectors.toList()).size());
			}

		} catch (MarsException ce) {
			log.error(ce.getMessage(), ce);
			throw new MarsException(ce.getMessage());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new MarsException("查询失败");
		}
		return list;
	}

	/**
	 * 评委评审数据查询
	 * 
	 * @param mtid
	 * @param jdeid
	 * @param mtgpid
	 * @return
	 */
	public PendingCount queryCount(String mtid, String jdeid, String mtgpid) {
		Map<String, String> map = new HashMap<>();
		map.put("mtid", mtid);
		map.put("jdeid", jdeid);
		map.put("mtgpid", mtgpid);
		PendingCount result=pgymtmstjdeMapper.queryCount(map);
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
	public List<RaterMst> queryRaterMstByPage( PageModel<RaterMst> page) {
		return pgymtmstjdeMapper.queryRaterMstByPage(page);
	}

}
