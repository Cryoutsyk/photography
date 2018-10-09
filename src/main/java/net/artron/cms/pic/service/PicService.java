package net.artron.cms.pic.service;
 
import javax.annotation.Resource;
import org.springframework.stereotype.Service; 

import net.mars.core.service.ApplicationService;

import net.artron.cms.pic.model.Pic;
import net.artron.cms.pic.mapper.PicMapper;

/**
 * Service.
 *
 * @author 
 */
@Service(value = "picService")
public class PicService extends ApplicationService<Pic, String> {
	/**
	 * mapper
	 */
	@Resource(name = "picMapper")
	PicMapper  picMapper;
}
