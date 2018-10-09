package net.artron.cms.pgymtannouncement.service;
 
import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service; 

import net.mars.core.service.ApplicationService;

import net.artron.cms.pgymtannouncement.model.Pgymtannouncement;
import net.artron.cms.util.ResultEntity;
import net.artron.cms.pgymtannouncement.mapper.PgymtannouncementMapper;

/**
 * Service.
 *
 * @author 
 */
@Service(value = "pgymtannouncementService")
public class PgymtannouncementService extends ApplicationService<Pgymtannouncement, String> {
	/**
	 * mapper
	 */
	@Resource(name = "pgymtannouncementMapper")
	PgymtannouncementMapper  pgymtannouncementMapper;
	
	
	public Pgymtannouncement queryOne(Pgymtannouncement pgymtannouncement) {
		List<Pgymtannouncement> list= super.queryAll(pgymtannouncement);
		if (list != null && list.size()>0) {
			return list.get(0);
		} 
		return new Pgymtannouncement();
		
	}
}
