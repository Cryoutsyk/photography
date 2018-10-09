package net.artron.cms.pgymtgroup.mapper;
  
import net.mars.core.mapper.ApplicationMapper;
import net.mars.mybatis.MarsMapper;

import java.util.List;

import org.springframework.dao.DataAccessException;

import net.artron.cms.pgymtgroup.model.Pgymtgroup;

/**
 * Mapper.
 * @author zzg
 *
 */
@MarsMapper
public interface PgymtgroupMapper extends ApplicationMapper<Pgymtgroup, String> {
	/**
	 * 根据MT_ID删除对应行.
	 * 
	 * @param 影响行数
	 */
	Integer deleteByMtid(String mtid) throws DataAccessException;
	List<Pgymtgroup> queryByMtId(String mtid) throws DataAccessException;
}

