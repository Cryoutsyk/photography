package net.artron.cms.pgyhostunit.mapper;
  
import net.mars.core.mapper.ApplicationMapper;
import net.mars.mybatis.MarsMapper;

import java.util.List;

import net.artron.cms.pgyhostunit.model.Pgyhostunit;

/**
 * Mapper.
 * @author zzg
 *
 */
@MarsMapper
public interface PgyhostunitMapper extends ApplicationMapper<Pgyhostunit, String> {
	
	//查询主办方账户
	List<Pgyhostunit> getunit(Pgyhostunit pgyhostunit);
}

