package net.artron.cms.pgymttext.controller;
 
import java.util.List;

import javax.annotation.Resource; 
import org.springframework.ui.Model;
import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpStatus;
import org.springframework.stereotype.Controller; 
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import net.mars.Entity;
import net.mars.PageModel;
import net.mars.common.Mars;
import net.mars.common.util.LocaleUtil;
import net.mars.boot.web.mvc.parameter.ParameterAttribute;
import net.mars.core.command.CommandEntity;
import net.mars.core.controller.ApplicationController; 
import net.artron.cms.pgymttext.model.Pgymttext;
import net.artron.cms.pgymttext.service.PgymttextService; 
import lombok.extern.slf4j.Slf4j;

/**
 * PgymttextController.
 * 基类 ApplicationController 中已经定义了一些常用方法
 * 1、页面跳转 {pagePath}/toPage 
 * 2、跳转到详细页面 {pagePath}/toDetail
 * 3、查询全部数据 queryAll
 * 4、分页查询数据 queryByPage
 * 5、增删改等操作 {operator}/command
 * @author
 */
@Slf4j 
@Controller
@RequestMapping("/pgymttext")
public class PgymttextController extends ApplicationController<Pgymttext>  {
	/**
	 * 注入Service类对象.
	 */
	@Resource(name = "pgymttextService")
	PgymttextService pgymttextService;
	
	@RequestMapping("toIndex")
	public String to_index(HttpServletRequest request, Model model) {
		return "pgymttext/index";
	}
	
	/**
	 * 进入page界面之前, 可设置额外参数.
	 *
	 * @param request
	 */
	@Override 
	protected void beforeGoPage(String page, HttpServletRequest request, Model model) {
		super.beforeGoPage(page, request, model);
	}
	
	/**
	 * 查询所有数据.
	 * @param request
	 * @return
	 *
	 *
	 * @api {GET} /pgymttext/query 查询地址所有数据
	 * @apiVersion 1.0.0
     * @apiName query
     * @apiGroup Pgymttext
     * @apiDescription 查询所有数据
     * @apiPermission 无
     * 
     * @apiParam {String} version=v1 版本号
     * @apiParam {Boolean} format=json 返回数据格式
     * @apiParam {Boolean} ignore=true 是否需要验证访问权限
     * @apiParam {String} updatedBy 编辑人
     * @apiParam {String} updatedDt 编辑时间
     * @apiParam {Integer} tabindex 排序
     * @apiParam {String} mtId 比赛ID,
     * @apiParam {String} texttype 类型,字典表取,,,1征集内容,2奖项设置,3征稿细则,4投稿方式,5日程安排,6特别说明
     * @apiParam {String} textcontent 文本内容,带格式文本框,最多500字
     * 
     * @apiExample 调用示例:
     * 	curl -i http://localhost:8080/mars-core/pgymttext/query?format=json&ignore=true&version=v1
     * 
     * @apiSuccess {String}   dbId 数据主键
     * @apiSuccess {String} updatedBy 编辑人
     * @apiSuccess {String} updatedDt 编辑时间
     * @apiSuccess {Integer} tabindex 排序
     * @apiSuccess {String} mtId 比赛ID,
     * @apiSuccess {String} texttype 类型,字典表取,,,1征集内容,2奖项设置,3征稿细则,4投稿方式,5日程安排,6特别说明
     * @apiSuccess {String} textcontent 文本内容,带格式文本框,最多500字
     * 
     * @apiError NoAccessRight 只有授权用户才能访问此地址.
     * @apiError NoParamFormat 没有设置参数format=json.
     * @apiErrorExample  Response (example):
     *     HTTP/1.1 Status 406
     *     {
     *       "error": "NoParamFormat"
     *     }
     * 
     * @apiSampleRequest http://localhost:8080/mars-core/pgymttext/query?format=json&ignore=true&version=v1
     * 
	 */
	@Override
	public List<? extends Entity> queryAll(HttpServletRequest request, @ParameterAttribute(value = "") Pgymttext entity) { 
		return super.queryAll(request, entity);
	}
	  
	/**
	 * 分页查询数据.
	 * @param request
	 * @param pageModel
	 * @return
	 * 
	 * @api {GET} /pgymttext/page 分页查询数据
	 * @apiVersion 1.0.0
     * @apiName page
     * @apiGroup Pgymttext
     * @apiDescription 分页查询数据
     * @apiPermission 无
     * 
     * @apiParam {String} version=v1 版本号
     * @apiParam {Boolean} format=json 返回数据格式
     * @apiParam {Boolean} ignore=true 是否需要验证访问权限
     * @apiParam {Integer} pageNum=1 当前页码
     * @apiParam {Integer} pageSize=15 当前页数据条数
     * @apiParam {String} order=asc 排序方式 "asc" 、 "desc"
     * @apiParam {String} sort 排序字段
     * @apiParam {String} code 编码
     * @apiParam {String} name 名称
     * 
     * @apiExample 调用示例:
     * 	curl -i http://localhost:8080/mars-core/pgymttext/page?format=json&ignore=true&version=v1&pageNum=2&pageSize=20
     * 
     * @apiSuccess {List}   results 数据列表
     * @apiSuccess {Integer} pageNum 页码
     * @apiSuccess {Integer} pageSize 当前页条数
     * @apiSuccess {Integer} totalRecord 总记录条数
     * @apiSuccess {Integer} totalPage 总页数 
     * 
     * @apiError NoAccessRight 只有授权用户才能访问此地址.
     * @apiError NoParamFormat 没有设置参数format=json.
     * @apiErrorExample  Response (example):
     *     HTTP/1.1 Status 406
     *     {
     *       "error": "NoParamFormat"
     *     }
     * 
     * @apiSampleRequest http://localhost:8080/mars-core/pgymttext/page?format=json&ignore=true&version=v1&pageNum=2&pageSize=20
     *  
	 */
	@Override
	public PageModel<? extends Entity> queryByPage(HttpServletRequest request, 
			@ParameterAttribute(value = "pageModel") PageModel<? extends Entity> pageModel) {
		return super.queryByPage(request, pageModel);
	}
	  
	/**
	 * 设定一些参数值.
	 * @param request
	 * @param pageModel
	 */
	@Override 
	protected void beforeQueryByPage(HttpServletRequest request, PageModel<? extends Entity> pageModel) {
		//Entity的属性 createdDt 有默认值，查询时需要去掉此默认参数值
		Entity ent = pageModel.getQueryParam();
		if (ent != null) {
			ent.setCreatedDt(null);
		}
	}
	
	/**
	 * 增删改查等操作.
	 * @param entity 参数
	 * @param request 参数
	 * @param operator 操作
	 * @return
	 * 
	 * 
	 * @api {POST} /address/{operator}/command 增删改查等操作.
	 * @apiVersion 1.0.0
     * @apiName command
     * @apiGroup Pgymttext
     * @apiDescription 增删改查等操作
     * @apiPermission 无
     * 
     * @apiParam {String} version=v1 版本, 指定值 : v1
     * @apiParam {Boolean} format=json 返回数据格式, 默认值 : json
     * @apiParam {Boolean} ignore=true 是否需要验证访问权限, 默认值 : true
     * @apiParam {String} updatedBy 编辑人
     * @apiParam {String} updatedDt 编辑时间
     * @apiParam {Integer} tabindex 排序
     * @apiParam {String} mtId 比赛ID,
     * @apiParam {String} texttype 类型,字典表取,,,1征集内容,2奖项设置,3征稿细则,4投稿方式,5日程安排,6特别说明
     * @apiParam {String} textcontent 文本内容,带格式文本框,最多500字
     * 
     * @apiExample 调用示例:
     * 	curl -d "code=11&name=abc" -i http://localhost:8080/mars-core/pgymttext/add/command?format=json&ignore=true&version=v1
     * 
     * @apiSuccess {String}   code 结果状态码, "success" : 成功； "fail" : 失败
     * @apiSuccess {String}   message 结果文字描述信息
     * 
     * @apiError NoAccessRight 只有授权用户才能访问此地址.
     * @apiError NoParamFormat 没有设置参数format=json.
     * @apiErrorExample  Response (example):
     *     HTTP/1.1 Status 406
     *     {
     *       "error": "NoParamFormat"
     *     }
	 */
	@Override
	public CommandEntity doCommand(@ParameterAttribute(value = "") Pgymttext entity, HttpServletRequest request, @PathVariable String operator) {
		log.debug("{} doCommand : \"{}\" ", Mars.LOG_PRE, operator);
//		CommandEntity result = new CommandEntity();
//		String operatorCommand = "command." + operator;
//		result.setCommand(operator);
//		String commandTitle = LocaleUtil.getMessage(request, operatorCommand, new Object[] {});
//		result.setCommandTitle(commandTitle);
//		result.setStatus(HttpStatus.SC_INTERNAL_SERVER_ERROR);
//		result.setCode(Mars.FAIL);
//		if(operator.equals("add"))
//		{
//			if(entity.getMtId()==null || "".equals(entity.getMtId()))
//			{
//				String message = "比赛ID为空";//LocaleUtil.getMessage(request, exceptionCode, new Object[] {commandTitle});
//				result.setMessage(message);
//				return result;
//			}
//		}
//		else if(operator.equals("update"))
//		{			
//			
//		}
//		else if(operator.equals("delete"))
//		{			
//			
//		}
//		
		return super.doCommand(entity, request, operator);
	}
	
	/**
	 * 执行操作前可进行额外的参数设置.
	 */
	@Override
	protected void beforeCommand(HttpServletRequest request, Entity entity, String cmdCode) {
	}
	
	/**
	 * 执行操作完成后，可以增加额外返回数据.
	 */
	@Override
	protected void afterCommand(HttpServletRequest request, Entity entity, CommandEntity result, String cmdCode) {
	}
	
	
	
}
