package net.artron.cms.pgymtassignjudgeinfo.service;
 
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.dao.DataAccessException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import net.mars.core.service.ApplicationService;
import net.mars.exception.MarsException;
import net.artron.cms.pgymtassignjudgeinfo.model.Pgymtassignjudgeinfo;
import net.artron.cms.pgymtgroup.model.Pgymtgroup;
import net.artron.cms.pgymtgroup.service.PgymtgroupService;
import net.artron.cms.pgymtassignjudgeinfo.mapper.PgymtassignjudgeinfoMapper;

/**
 * Service.
 *
 * @author 
 */
@Slf4j
@Service(value = "pgymtassignjudgeinfoService")
public class PgymtassignjudgeinfoService extends ApplicationService<Pgymtassignjudgeinfo, String> {
	/**
	 * mapper
	 */
	@Resource(name = "pgymtassignjudgeinfoMapper")
	PgymtassignjudgeinfoMapper  pgymtassignjudgeinfoMapper;
	
	public Pgymtassignjudgeinfo queryByMtId(String mtid) throws MarsException {
		Pgymtassignjudgeinfo result = new Pgymtassignjudgeinfo();
		try {
			if (mtid == null || mtid.length() == 0) {
				log.error("参数为空");
				throw new MarsException("查询失败");
			}
			result = pgymtassignjudgeinfoMapper.queryByMtId(mtid);
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
