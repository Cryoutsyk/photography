package net.artron.cms.pgymtassignjudge.mapper;
  
import net.mars.core.mapper.ApplicationMapper;
import net.mars.mybatis.MarsMapper;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import net.artron.cms.pgymtassignjudge.model.Pgycheckrater;
import net.artron.cms.pgymtassignjudge.model.Pgymtassignjudge;

/**
 * Mapper.
 * @author zzg
 *
 */
@MarsMapper
public interface PgymtassignjudgeMapper extends ApplicationMapper<Pgymtassignjudge, String> {
	/**
	 * 取评委及选中信息
	 * @param map
	 * @return
	 * @throws DataAccessException
	 */
	List<Pgycheckrater>  queryCheckrater(Map<String, String> map) throws DataAccessException; 
}

