package net.artron.cms.pgymtassignjudgeinfo.mapper;
  
import net.mars.core.mapper.ApplicationMapper;
import net.mars.mybatis.MarsMapper;

import java.util.List;

import org.springframework.dao.DataAccessException;

import net.artron.cms.pgymtassignjudgeinfo.model.Pgymtassignjudgeinfo;
import net.artron.cms.pgymtgroup.model.Pgymtgroup;

/**
 * Mapper.
 * @author zzg
 *
 */
@MarsMapper
public interface PgymtassignjudgeinfoMapper extends ApplicationMapper<Pgymtassignjudgeinfo, String> {
	
	Pgymtassignjudgeinfo queryByMtId(String mtid) throws DataAccessException;
	
}

