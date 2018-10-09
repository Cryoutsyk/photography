package net.artron.cms.pgymtassignjudge.service;
 
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import net.mars.core.service.ApplicationService;
import net.mars.exception.MarsException;
import net.artron.cms.pgymtassignjudge.model.Pgycheckrater;
import net.artron.cms.pgymtassignjudge.model.Pgymtassignjudge;
import net.artron.cms.util.DictUtils;
import net.artron.cms.pgymatch.service.PgymatchService;
import net.artron.cms.pgymtassignjudge.mapper.PgymtassignjudgeMapper;

/**
 * Service.
 *
 * @author 
 */
@Slf4j
@Service(value = "pgymtassignjudgeService")
public class PgymtassignjudgeService extends ApplicationService<Pgymtassignjudge, String> {
	/**
	 * mapper
	 */
	@Resource(name = "pgymtassignjudgeMapper")
	PgymtassignjudgeMapper  pgymtassignjudgeMapper;
	
	/**
	 * 
	 * @param map
	 * @return
	 * @throws DataAccessException
	 */
	
	/**
	 * 取评委及选中信息
	 * @param mtId 
	 * @param huId
	 * @return
	 * @throws MarsException
	 */
	public List<Pgycheckrater>  queryCheckrater(String mtId,String huId)throws MarsException {

		 List<Pgycheckrater> result = new ArrayList<Pgycheckrater>();
		try {
			if (mtId == null || mtId.length() == 0)
			{
				log.error("mtId为空");
				throw new MarsException("查询失败");
			}
			if (huId == null || huId.length() == 0)
			{
				log.error("huId为空");
				throw new MarsException("查询失败");
			}
			Map<String, String> map=new HashMap<String, String>();
			map.put("mtId", mtId);
			map.put("huId", huId);
			
			result = pgymtassignjudgeMapper.queryCheckrater(map);
//			if(result!=null)
//			{
//				for (Pgycheckrater pgycheckrater : result) {
//					if(pgycheckrater.getGood_type()!=null && pgycheckrater.getGood_type().length()>0)
//					{
//						pgycheckrater.setGood_type(DictUtils.getDictLabels(pgycheckrater.getGood_type(),"GoodTypeEnum",""));
//					}
//				}
//			}
		}  catch (MarsException ce) {
			log.error(ce.getMessage(), ce);
			throw new MarsException(ce.getMessage());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new MarsException("查询失败");
		}
		return result ;
	}
}
