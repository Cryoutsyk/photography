package net.artron.cms.pgymtannouncement.controller;
 
import java.util.List;

import javax.annotation.Resource; 
import org.springframework.ui.Model;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller; 
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.mars.Entity;
import net.mars.PageModel;
import net.mars.common.Mars;
import net.mars.common.util.ClassUtil;
import net.mars.common.util.spring.SpringUtil;
import net.mars.boot.web.mvc.parameter.ParameterAttribute;
import net.mars.core.ApplicationUtil;
import net.mars.core.command.CommandEntity;
import net.mars.core.controller.ApplicationController;
import net.mars.core.service.ApplicationService;
import net.artron.cms.pgymtannouncement.model.Pgymtannouncement;
import net.artron.cms.pgymtannouncement.service.PgymtannouncementService;
import net.artron.cms.util.ResultEntity;
import lombok.extern.slf4j.Slf4j;

/**
 * PgymtannouncementController.
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
@RequestMapping("/pgymtannouncement")
public class PgymtannouncementController extends ApplicationController<Pgymtannouncement>  {
	/**
	 * 注入Service类对象.
	 */
	@Resource(name = "pgymtannouncementService")
	PgymtannouncementService pgymtannouncementService;
	
	@RequestMapping("toIndex")
	public String to_index(HttpServletRequest request, Model model) {
		return "pgymtannouncement/index";
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
	 * @api {GET} /pgymtannouncement/query 查询地址所有数据
	 * @apiVersion 1.0.0
     * @apiName query
     * @apiGroup Pgymtannouncement
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
     * @apiParam {String} title 标题,分组名称最多50个字
     * @apiParam {String} author 作者,最多十个字
     * @apiParam {String} textcontent 富文本内容,
     * @apiParam {Integer} detailedaward 是否展示详细获奖列表,0展示,1不展示
     * @apiParam {Integer} showtype 展示类型,0作品名和作者,1作品照片、作品名和作者
     * 
     * @apiExample 调用示例:
     * 	curl -i http://localhost:8080/mars-core/pgymtannouncement/query?format=json&ignore=true&version=v1
     * 
     * @apiSuccess {String}   dbId 数据主键
     * @apiSuccess {String} updatedBy 编辑人
     * @apiSuccess {String} updatedDt 编辑时间
     * @apiSuccess {Integer} tabindex 排序
     * @apiSuccess {String} mtId 比赛ID,
     * @apiSuccess {String} title 标题,分组名称最多50个字
     * @apiSuccess {String} author 作者,最多十个字
     * @apiSuccess {String} textcontent 富文本内容,
     * @apiSuccess {Integer} detailedaward 是否展示详细获奖列表,0展示,1不展示
     * @apiSuccess {Integer} showtype 展示类型,0作品名和作者,1作品照片、作品名和作者
     * 
     * @apiError NoAccessRight 只有授权用户才能访问此地址.
     * @apiError NoParamFormat 没有设置参数format=json.
     * @apiErrorExample  Response (example):
     *     HTTP/1.1 Status 406
     *     {
     *       "error": "NoParamFormat"
     *     }
     * 
     * @apiSampleRequest http://localhost:8080/mars-core/pgymtannouncement/query?format=json&ignore=true&version=v1
     * 
	 */
	@Override
	public List<? extends Entity> queryAll(HttpServletRequest request, @ParameterAttribute(value = "") Pgymtannouncement entity) { 
		return super.queryAll(request, entity);
	}
	  
	/**
	 * 分页查询数据.
	 * @param request
	 * @param pageModel
	 * @return
	 * 
	 * @api {GET} /pgymtannouncement/page 分页查询数据
	 * @apiVersion 1.0.0
     * @apiName page
     * @apiGroup Pgymtannouncement
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
     * 	curl -i http://localhost:8080/mars-core/pgymtannouncement/page?format=json&ignore=true&version=v1&pageNum=2&pageSize=20
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
     * @apiSampleRequest http://localhost:8080/mars-core/pgymtannouncement/page?format=json&ignore=true&version=v1&pageNum=2&pageSize=20
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
     * @apiGroup Pgymtannouncement
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
     * @apiParam {String} title 标题,分组名称最多50个字
     * @apiParam {String} author 作者,最多十个字
     * @apiParam {String} textcontent 富文本内容,
     * @apiParam {Integer} detailedaward 是否展示详细获奖列表,0展示,1不展示
     * @apiParam {Integer} showtype 展示类型,0作品名和作者,1作品照片、作品名和作者
     * 
     * @apiExample 调用示例:
     * 	curl -d "code=11&name=abc" -i http://localhost:8080/mars-core/pgymtannouncement/add/command?format=json&ignore=true&version=v1
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
	public CommandEntity doCommand(@ParameterAttribute(value = "") Pgymtannouncement entity, HttpServletRequest request, @PathVariable String operator) {
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
	
	/**
	 * 获取比赛公告
	 * @param request
	 * @param model
	 * @param pagePath
	 * @return
	 */
	@RequestMapping("/announcementDetail")
	@ResponseBody
	public Object  matchAnnouncementDetail(Pgymtannouncement matchAnnouncement) {
		Pgymtannouncement queryOne = pgymtannouncementService.queryOne(matchAnnouncement);
		return new ResultEntity<Pgymtannouncement>(queryOne,200);
	}
	
	
	
	
}
