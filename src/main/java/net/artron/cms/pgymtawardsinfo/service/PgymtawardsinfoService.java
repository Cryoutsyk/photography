package net.artron.cms.pgymtawardsinfo.service;
 
import javax.annotation.Resource;
import org.springframework.stereotype.Service; 

import net.mars.core.service.ApplicationService;

import net.artron.cms.pgymtawardsinfo.model.Pgymtawardsinfo;
import net.artron.cms.pgymtawardsinfo.mapper.PgymtawardsinfoMapper;

/**
 * Service.
 *
 * @author 
 */
@Service(value = "pgymtawardsinfoService")
public class PgymtawardsinfoService extends ApplicationService<Pgymtawardsinfo, String> {
	/**
	 * mapper
	 */
	@Resource(name = "pgymtawardsinfoMapper")
	PgymtawardsinfoMapper  pgymtawardsinfoMapper;
}
