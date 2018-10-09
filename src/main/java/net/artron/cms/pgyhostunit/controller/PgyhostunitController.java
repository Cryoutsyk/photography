package net.artron.cms.pgyhostunit.controller;
 
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import net.artron.cms.pgyhostunit.model.Pgyhostunit;
import net.artron.cms.pgyhostunit.service.PgyhostunitService;
import net.artron.cms.pgyuser.util.CommandResultUtil;
import net.mars.Entity;
import net.mars.PageModel;
import net.mars.boot.web.mvc.parameter.ParameterAttribute;
import net.mars.common.Mars;
import net.mars.core.command.CommandEntity;
import net.mars.core.controller.ApplicationController;
import net.mars.exception.MarsException;

/**
 * PgyhostunitController.
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
@RequestMapping("/pgyhostunit")
public class PgyhostunitController extends ApplicationController<Pgyhostunit>  {
	private final String UPDATE = "update";
	private final String SELECT = "select";
	/**
	 * 注入Service类对象.
	 */
	@Resource(name = "pgyhostunitService")
	PgyhostunitService pgyhostunitService;
	
	@RequestMapping("toIndex")
	public String to_index(HttpServletRequest request, Model model) {
		return "pgyhostunit/index";
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
	 * @api {GET} /pgyhostunit/query 查询地址所有数据
	 * @apiVersion 1.0.0
     * @apiName query
     * @apiGroup Pgyhostunit
     * @apiDescription 查询所有数据
     * @apiPermission 无
     * 
     * @apiParam {String} version=v1 版本号
     * @apiParam {Boolean} format=json 返回数据格式
     * @apiParam {Boolean} ignore=true 是否需要验证访问权限
     * @apiParam {String} companyName 单位名称
     * @apiParam {String} name 联系人姓名
     * @apiParam {String} telphone 手机号
     * @apiParam {String} email 邮箱
     * @apiParam {String} address 地址
     * @apiParam {String} accountNumber 账号
     * @apiParam {String} password 密码
     * @apiParam {String} remarks 备注
     * @apiParam {java.util.Date} createDt 创建时间
     * 
     * @apiExample 调用示例:
     * 	curl -i http://localhost:8080/mars-core/pgyhostunit/query?format=json&ignore=true&version=v1
     * 
     * @apiSuccess {String}   dbId 数据主键
     * @apiSuccess {String} companyName 单位名称
     * @apiSuccess {String} name 联系人姓名
     * @apiSuccess {String} telphone 手机号
     * @apiSuccess {String} email 邮箱
     * @apiSuccess {String} address 地址
     * @apiSuccess {String} accountNumber 账号
     * @apiSuccess {String} password 密码
     * @apiSuccess {String} remarks 备注
     * @apiSuccess {java.util.Date} createDt 创建时间
     * 
     * @apiError NoAccessRight 只有授权用户才能访问此地址.
     * @apiError NoParamFormat 没有设置参数format=json.
     * @apiErrorExample  Response (example):
     *     HTTP/1.1 Status 406
     *     {
     *       "error": "NoParamFormat"
     *     }
     * 
     * @apiSampleRequest http://localhost:8080/mars-core/pgyhostunit/query?format=json&ignore=true&version=v1
     * 
	 */
	@Override
	public List<? extends Entity> queryAll(HttpServletRequest request, @ParameterAttribute(value = "") Pgyhostunit entity) { 
		return super.queryAll(request, entity);
	}
	  
	/**
	 * 分页查询数据.
	 * @param request
	 * @param pageModel
	 * @return
	 * 
	 * @api {GET} /pgyhostunit/page 分页查询数据
	 * @apiVersion 1.0.0
     * @apiName page
     * @apiGroup Pgyhostunit
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
     * 	curl -i http://localhost:8080/mars-core/pgyhostunit/page?format=json&ignore=true&version=v1&pageNum=2&pageSize=20
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
     * @apiSampleRequest http://localhost:8080/mars-core/pgyhostunit/page?format=json&ignore=true&version=v1&pageNum=2&pageSize=20
     *  
	 */
	@Override
	public PageModel<? extends Entity> queryByPage(HttpServletRequest request, 
			@ParameterAttribute(value = "pageModel") PageModel<? extends Entity> pageModel) {
		//只有admin才能调此接口
		CommandResultUtil util = new CommandResultUtil();
		String character = util.getCharacter(request);
		if(StringUtils.isNotBlank(character) && character.equals("admin")){
			Pgyhostunit ent = (Pgyhostunit) pageModel.getQueryParam();
			ent.setStatus(null);//查询所有的状态
			return super.queryByPage(request, pageModel);
		}else{
			return null;
		}
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
     * @apiGroup Pgyhostunit
     * @apiDescription 增删改查等操作
     * @apiPermission 无
     * 
     * @apiParam {String} version=v1 版本, 指定值 : v1
     * @apiParam {Boolean} format=json 返回数据格式, 默认值 : json
     * @apiParam {Boolean} ignore=true 是否需要验证访问权限, 默认值 : true
     * @apiParam {String} companyName 单位名称
     * @apiParam {String} name 联系人姓名
     * @apiParam {String} telphone 手机号
     * @apiParam {String} email 邮箱
     * @apiParam {String} address 地址
     * @apiParam {String} userName 账号
     * @apiParam {String} password 密码
     * @apiParam {String} remarks 备注
     * @apiParam {java.util.Date} createDt 创建时间
     * 
     * @apiExample 调用示例:
     * 	curl -d "code=11&name=abc" -i http://localhost:8080/mars-core/pgyhostunit/add/command?format=json&ignore=true&version=v1
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
	public CommandEntity doCommand(@ParameterAttribute(value = "") Pgyhostunit entity, HttpServletRequest request, @PathVariable String operator) {
		log.debug("{} doCommand : \"{}\" ", Mars.LOG_PRE, operator);
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
	
	/** 启用/禁用
	*@author luzh
	* @Title: updateState 
	* @Description: TODO
	* @param request
	* @return    
	* @return CommandEntity    
	* @throws 
	*/
	@RequestMapping(value="updateState",method=RequestMethod.GET)
	@ResponseBody
	public CommandEntity updateState(HttpServletRequest request){
		 //TODO 需验证身份,管理员可修改
		 String state = request.getParameter("status");
		 String version = request.getParameter("version");
		 String dbId = request.getParameter("dbId");
		 if (StringUtils.isBlank(version)) {
			 return CommandResultUtil.resultJson(request, Mars.FAIL, SELECT, HttpStatus.SC_INTERNAL_SERVER_ERROR, "参数有误");
		}
		 try {
			 Pgyhostunit pgyhostunit = pgyhostunitService.queryById(dbId);
			 pgyhostunit.setStatus(Integer.valueOf(state));
			 pgyhostunitService.update(pgyhostunit);
		} catch (MarsException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return CommandResultUtil.resultJson(request, Mars.SUCCESS, UPDATE, HttpStatus.SC_OK, "修改成功");
	}
}
