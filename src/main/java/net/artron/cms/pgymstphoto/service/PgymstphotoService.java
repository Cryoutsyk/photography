package net.artron.cms.pgymstphoto.service;
 
import javax.annotation.Resource;
import org.springframework.stereotype.Service; 

import net.mars.core.service.ApplicationService;

import net.artron.cms.pgymstphoto.model.Pgymstphoto;
import net.artron.cms.pgymstphoto.mapper.PgymstphotoMapper;

/**
 * Service.
 *
 * @author 
 */
@Service(value = "pgymstphotoService")
public class PgymstphotoService extends ApplicationService<Pgymstphoto, String> {
	/**
	 * mapper
	 */
	@Resource(name = "pgymstphotoMapper")
	PgymstphotoMapper  pgymstphotoMapper;
}
