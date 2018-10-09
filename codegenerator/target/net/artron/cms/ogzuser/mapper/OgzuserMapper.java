package net.artron.cms.ogzuser.mapper;
  
import net.mars.core.mapper.ApplicationMapper;
import net.mars.mybatis.MarsMapper;
import net.artron.cms.ogzuser.model.Ogzuser;

/**
 * Mapper.
 * @author zzg
 *
 */
@MarsMapper
public interface OgzuserMapper extends ApplicationMapper<Ogzuser, String> {
}

