package net.artron.cms.pgymttext.mapper;
  
import net.mars.core.mapper.ApplicationMapper;
import net.mars.mybatis.MarsMapper;

import java.util.List;

import org.springframework.dao.DataAccessException;

import net.artron.cms.pgymttext.model.Pgymttext;

/**
 * Mapper.
 * @author zzg
 *
 */
@MarsMapper
public interface PgymttextMapper extends ApplicationMapper<Pgymttext, String> {
	/**
	 * 根据MT_ID删除对应行.
	 * 
	 * @param 比赛id
	 * @return 影响行数
	 */
	Integer deleteByMtid(String mtid) throws DataAccessException;
	List<Pgymttext> queryByMtId(String mtid) throws DataAccessException;
}

