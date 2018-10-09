package net.artron.cms.pic.mapper;
  
import net.mars.core.mapper.ApplicationMapper;
import net.mars.mybatis.MarsMapper;
import net.artron.cms.pic.model.Pic;

/**
 * Mapper.
 * @author zzg
 *
 */
@MarsMapper
public interface PicMapper extends ApplicationMapper<Pic, String> {
}

