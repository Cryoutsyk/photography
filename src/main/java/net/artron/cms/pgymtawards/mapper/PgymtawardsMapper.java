package net.artron.cms.pgymtawards.mapper;

import net.mars.core.mapper.ApplicationMapper;
import net.mars.mybatis.MarsMapper;

import java.util.List;

import org.springframework.dao.DataAccessException;

import net.artron.cms.pgymtawards.model.Pgymtawards;

/**
 * Mapper.
 * 
 * @author zzg
 *
 */
@MarsMapper
public interface PgymtawardsMapper extends ApplicationMapper<Pgymtawards, String> {
	/**
	 * 根据MT_ID删除对应行.
	 * 
	 * @param 影响行数
	 */
	Integer deleteByMtid(String mtid) throws DataAccessException;

	List<Pgymtawards> queryByMtId(String mtid) throws DataAccessException;
}
