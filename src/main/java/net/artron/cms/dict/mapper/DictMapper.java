package net.artron.cms.dict.mapper;
  
import net.mars.core.mapper.ApplicationMapper;
import net.mars.mybatis.MarsMapper;

import java.util.List;

import net.artron.cms.dict.model.Dict;

/**
 * Mapper.
 * @author zzg
 *
 */
@MarsMapper
public interface DictMapper extends ApplicationMapper<Dict, String> {
	
	public List<String> findTypeList(Dict dict);
	
	/**
	 * 查询所有数据列表
	 * @param entity
	 * @return
	 */
	public List<Dict> findAllList(Dict dict);
	
}

