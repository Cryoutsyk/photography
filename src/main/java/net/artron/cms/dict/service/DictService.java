package net.artron.cms.dict.service;
 
import javax.annotation.Resource;
import org.springframework.stereotype.Service; 

import net.mars.core.service.ApplicationService;

import net.artron.cms.dict.model.Dict;
import net.artron.cms.dict.mapper.DictMapper;

/**
 * Service.
 *
 * @author 
 */
@Service(value = "dictService")
public class DictService extends ApplicationService<Dict, String> {
	/**
	 * mapper
	 */
	@Resource(name = "dictMapper")
	DictMapper  dictMapper;
}
