package net.artron.cms.pgyhostunit.service;
 
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import net.mars.core.ApplicationUtil;
import net.mars.core.Token;
import net.mars.core.service.ApplicationService;

import net.artron.cms.pgyhostunit.model.Pgyhostunit;
import net.artron.cms.pgyrater.model.Pgyrater;
import net.artron.cms.pgyhostunit.mapper.PgyhostunitMapper;

/**
 * Service.
 *
 * @author 
 */
@Service(value = "pgyhostunitService")
public class PgyhostunitService extends ApplicationService<Pgyhostunit, String> {
	/**
	 * mapper
	 */
	@Resource(name = "pgyhostunitMapper")
	PgyhostunitMapper  pgyhostunitMapper;
	
	public boolean checkunit(Map<String, String> params){
		Pgyhostunit pgyhostunit = new Pgyhostunit();
		pgyhostunit.setAccountNumber(params.get("username"));
		pgyhostunit.setPassword(params.get("password"));
		pgyhostunit.setStatus(null);
		pgyhostunit.setVersion(null);
		pgyhostunit.setCreatedDt(null);
		//查询主办方账户
		List<Pgyhostunit> pgyhostunits = pgyhostunitMapper.getunit(pgyhostunit);
		if (pgyhostunits!=null && pgyhostunits.size()!=0) {
			/*params.put("character", "hostunit");*/
			for (Pgyhostunit pgy : pgyhostunits) {
				params.put("userid", pgy.getDbId());
				params.put("nickname", pgy.getName());
			}
			return true;
		}
		return false;
	}
}
