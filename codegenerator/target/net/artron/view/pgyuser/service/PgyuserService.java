package net.artron.view.pgyuser.service;
 
import javax.annotation.Resource;
import org.springframework.stereotype.Service; 

import net.mars.core.service.ApplicationService;

import net.artron.view.pgyuser.model.Pgyuser;
import net.artron.view.pgyuser.mapper.PgyuserMapper;

/**
 * Service.
 *
 * @author 
 */
@Service(value = "pgyuserService")
public class PgyuserService extends ApplicationService<Pgyuser, > {
	/**
	 * mapper
	 */
	@Resource(name = "pgyuserMapper")
	PgyuserMapper  pgyuserMapper;
}
