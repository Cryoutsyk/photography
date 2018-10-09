package net.artron.cms.ogzuser.service;
 
import javax.annotation.Resource;
import org.springframework.stereotype.Service; 

import net.mars.core.service.ApplicationService;

import net.artron.cms.ogzuser.model.Ogzuser;
import net.artron.cms.ogzuser.mapper.OgzuserMapper;

/**
 * Service.
 *
 * @author 
 */
@Service(value = "ogzuserService")
public class OgzuserService extends ApplicationService<Ogzuser, String> {
	/**
	 * mapper
	 */
	@Resource(name = "ogzuserMapper")
	OgzuserMapper  ogzuserMapper;
}
