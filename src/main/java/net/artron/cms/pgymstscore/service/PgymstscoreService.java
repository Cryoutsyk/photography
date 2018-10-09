package net.artron.cms.pgymstscore.service;
 
import javax.annotation.Resource;
import org.springframework.stereotype.Service; 

import net.mars.core.service.ApplicationService;

import net.artron.cms.pgymstscore.model.Pgymstscore;
import net.artron.cms.pgymstscore.mapper.PgymstscoreMapper;

/**
 * Service.
 *
 * @author 
 */
@Service(value = "pgymstscoreService")
public class PgymstscoreService extends ApplicationService<Pgymstscore, String> {
	/**
	 * mapper
	 */
	@Resource(name = "pgymstscoreMapper")
	PgymstscoreMapper  pgymstscoreMapper;
}
