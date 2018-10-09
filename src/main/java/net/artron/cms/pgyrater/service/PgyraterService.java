
package net.artron.cms.pgyrater.service;
 
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service; 

import net.mars.core.service.ApplicationService;

import net.artron.cms.pgyrater.model.Pgyrater;
import net.artron.cms.pgyrater.mapper.PgyraterMapper;

/**
 * Service.
 *
 * @author 
 */
@Service(value = "pgyraterService")
public class PgyraterService extends ApplicationService<Pgyrater, String> {
	/**
	 * mapper
	 */
	@Resource(name = "pgyraterMapper")
	PgyraterMapper  pgyraterMapper;
	
	/**
	 * 获取登录用户身份信息
	 * @param params
	 * @return
	 */
	public boolean checkrater(Map<String, String> params){
		Pgyrater pgyrater = new Pgyrater();
		pgyrater.setAccountNumber(params.get("username"));
		pgyrater.setPassword(params.get("password"));
		List<Pgyrater> pgyraters = super.queryAll(pgyrater);
		if (pgyraters!=null && pgyraters.size()!=0) {
			/*params.put("character", "rater");*/
			for (Pgyrater pgy : pgyraters) {
				params.put("userid", pgy.getDbId());
				params.put("nickname", pgy.getName());
			}
			return true;
		}
		return false;
	}
}



