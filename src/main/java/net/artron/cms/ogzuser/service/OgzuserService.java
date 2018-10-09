package net.artron.cms.ogzuser.service;
 
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service; 

import net.mars.core.service.ApplicationService;

import net.artron.cms.ogzuser.model.Ogzuser;
import net.artron.cms.pgyrater.model.Pgyrater;
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
	
	
	public boolean checkadmin(Map<String, String> params){
		Ogzuser ogzuser = new Ogzuser();
		ogzuser.setCode(params.get("username"));
		ogzuser.setUserPassword(params.get("password"));
		List<Ogzuser> ogzusers = super.queryAll(ogzuser);
		if (ogzusers!=null && ogzusers.size()!=0) {
			for (Ogzuser ogz : ogzusers) {
				params.put("userid", ogz.getDbId());
				params.put("nickname", ogz.getName());
			}
			return true;
		}
		return false;
	}
}
