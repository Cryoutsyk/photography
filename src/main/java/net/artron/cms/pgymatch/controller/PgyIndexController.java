package net.artron.cms.pgymatch.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import net.artron.cms.pgymatch.model.Pgymatch;
import net.artron.cms.pgymatch.service.PgymatchService;
import net.mars.Entity;
import net.mars.PageModel;
import net.mars.boot.web.mvc.parameter.ParameterAttribute;
import net.mars.common.cmd.CmdException;
import net.mars.common.cmd.Command;
import net.mars.core.controller.ApplicationController;
import net.sf.json.JSONArray;

/** 首页展示
* @ClassName: PgyIndexController 
* @Description: TODO
* @author luzh
* @date 2018年10月8日 上午9:41:16 
*  
*/
@Slf4j
@Controller
@RequestMapping("/pgyindex")
public class PgyIndexController extends ApplicationController<Pgymatch> {
	 /* 注入Service类对象.
	 */
	@Resource(name = "pgymatchService")
	PgymatchService pgymatchService;
	
	@Override
	public PageModel<? extends Entity> queryByPage(HttpServletRequest request,
			@ParameterAttribute(value = "pageModel") PageModel<? extends Entity> pageModel) {
		PageModel<? extends Entity> result = super.queryByPage(request, pageModel);
		result.setQueryParam(null);
		return result;
	}
	
	@RequestMapping(value = "open/queryPage", method = RequestMethod.GET)
	@ResponseBody
	public PageModel<? extends Entity> queryByAll(HttpServletRequest request, 
			@ParameterAttribute(value = "pageModel") PageModel<? extends Entity> pageModel) {
		Pgymatch ent = (Pgymatch) pageModel.getQueryParam();//把状态放入查询条件中
		ent.setCompetitionstate("1");//征稿中
		return super.queryByPage(request, pageModel);
	}
	
	/** 查询年份及月份
	*@author luzh
	* @Title: yearAndMonth 
	* @Description: TODO
	* @return    
	* @return String    
	* @throws 
	*/
	@RequestMapping(value = "open/yearAndMonth", method = RequestMethod.GET)
	@ResponseBody
	public String yearAndMonth() {
		List<String> list = pgymatchService.queryAllYear();
		Map<String,String> map = new HashMap<String, String>();
		if(!list.isEmpty()){
			for (String string : list) {//格式如:2018-07,2018-04,2017-09
				String year = string.split("-")[0];//年份
				String month = string.split("-")[1];//月份
				if(map.get(year) != null){
					map.put(year, map.get(year)+","+month);
				}else{
					map.put(year, month);
				}
			}
		}
		JSONArray json = new JSONArray();
		//返回拼接好的map值
		Map<String,String> resultMap = new HashMap<String, String>();
		for (Map.Entry<String, String> entry : map.entrySet()) { 
			  //System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue()); Key = 2018, Value = 06,08,09
			resultMap.put("year", entry.getKey());
			resultMap.put("month", entry.getValue());
			json.add(resultMap);
		}
	//	System.out.println(json.toString());[{"month":"[06,08,09]","year":"2018"},{"month":"[09]","year":"2017"}]
		return json.toString();//
	}
	
	/** 查询列表并可分页
	*@author luzh
	* @Title: queryAllList 
	* @Description: TODO
	* @param request
	* @param pageModel
	* @return    
	* @return PageModel<? extends Entity>    
	* @throws 
	*/
	@RequestMapping(value = "open/queryAllList", method = RequestMethod.GET)
	@ResponseBody
	public PageModel<? extends Entity> queryAllList(HttpServletRequest request,
			@ParameterAttribute(value = "pageModel") PageModel<? extends Entity> pageModel) {
		return this.doQueryPage(request, pageModel, new Command<PageModel<? extends Entity>, List<? extends Entity>>() { 
			private static final long serialVersionUID = -1857822974701330577L;

			@SuppressWarnings({ "unchecked" })
			@Override
			public List<? extends Entity> execute(PageModel<? extends Entity> pageModel) throws CmdException {
				if (pgymatchService != null) {
					Class clazz = pageModel.getQueryParam().getClass(); 
					if (clazz.equals(Entity.class) || !Entity.class.isAssignableFrom(clazz)) { 
						setQueryParamEntity(pageModel);
					}  
					
					return pgymatchService.queryIndex(pageModel);
				}
				 
				return null;
			}
		});
	}
}
