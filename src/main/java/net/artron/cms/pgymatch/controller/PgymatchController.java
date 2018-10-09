package net.artron.cms.pgymatch.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.text.StringEscapeUtils;
import org.apache.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import net.artron.cms.pgyhostunit.model.Pgyhostunit;
import net.artron.cms.pgyhostunit.service.PgyhostunitService;
import net.artron.cms.pgymanuscript.model.ChannelStatistics;
import net.artron.cms.pgymanuscript.model.Pgymanuscript;
import net.artron.cms.pgymanuscript.service.PgymanuscriptService;
import net.artron.cms.pgymatch.model.CommandModel;
import net.artron.cms.pgymatch.model.Pgymatch;
import net.artron.cms.pgymatch.model.inModel;
import net.artron.cms.pgymatch.service.PgymatchService;
import net.artron.cms.pgymtawards.model.Pgymtawards;
import net.artron.cms.pgymtawards.service.PgymtawardsService;
import net.artron.cms.pgymtgroup.model.Pgymtgroup;
import net.artron.cms.pgymtgroup.service.PgymtgroupService;
import net.artron.cms.pgymtmstjde.model.JudgeRatio;
import net.artron.cms.pgymtmstjde.model.ReviewStatistics;
import net.artron.cms.pgymtmstjde.service.PgymtmstjdeService;
import net.artron.cms.pgymttext.model.Pgymttext;
import net.artron.cms.pgymttext.service.PgymttextService;
import net.artron.cms.pgyuser.util.CommandResultUtil;
import net.artron.cms.util.DateUtils;
import net.artron.cms.util.EnumRole;
import net.artron.cms.util.FastjsonUtil;
import net.artron.cms.util.HuidUtils;
import net.artron.cms.util.PathUtil;
import net.artron.cms.util.ResultEntity;
import net.artron.cms.util.StringUtils;
import net.artron.cms.util.ValidationUtils;
import net.mars.Entity;
import net.mars.PageModel;
import net.mars.boot.web.mvc.parameter.ParameterAttribute;
import net.mars.common.Mars;
import net.mars.common.spring.SpringContextHolder;
import net.mars.common.util.DateUtil;
import net.mars.common.util.FileUtil;
import net.mars.common.util.LocaleUtil;
import net.mars.core.command.CommandEntity;
import net.mars.core.command.ServiceCommand;
import net.mars.core.controller.ApplicationController;
import net.mars.exception.MarsException;

/**
 * PgymatchController. 基类 ApplicationController 中已经定义了一些常用方法 1、页面跳转
 * {pagePath}/toPage 2、跳转到详细页面 {pagePath}/toDetail 3、查询全部数据 queryAll 4、分页查询数据
 * queryByPage 5、增删改等操作 {operator}/command
 * 
 * @author
 */
@Slf4j
@Controller
@RequestMapping("/pgymatch")
public class PgymatchController extends ApplicationController<Pgymatch> {
	/**
	 * 注入Service类对象.
	 */
	@Resource(name = "pgymatchService")
	PgymatchService pgymatchService;

	@Resource(name = "pgymttextService")
	PgymttextService pgymttextService;

	/**
	 * 注入Service类对象.
	 */
	@Resource(name = "pgymtawardsService")
	PgymtawardsService pgymtawardsService;

	/**
	 * 注入Service类对象.
	 */
	@Resource(name = "pgymtgroupService")
	PgymtgroupService pgymtgroupService;

	/**
	 * 注入Service类对象.
	 */
	@Resource(name = "pgymanuscriptService")
	PgymanuscriptService pgymanuscriptService;

	/**
	 * 注入Service类对象.
	 */
	@Resource(name = "pgymtmstjdeService")
	PgymtmstjdeService pgymtmstjdeService;

	/**
	 * 注入Service类对象.
	 */
	@Resource(name = "pgyhostunitService")
	PgyhostunitService pgyhostunitService;

	// @Resource(name = "pgymttextAddCommand")
	// PgymttextAddCommand pgymttextAddCommand;

	@RequestMapping("toIndex")
	public String to_index(HttpServletRequest request, Model model) {
		return "pgymatch/index";
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
	 * 
	 * @param request
	 * @return
	 *
	 *
	 * @api {GET} /pgymatch/query 查询地址所有数据
	 * @apiVersion 1.0.0
	 * @apiName query
	 * @apiGroup Pgymatch
	 * @apiDescription 查询所有数据
	 * @apiPermission 无
	 * 
	 * @apiParam {String} version=v1 版本号
	 * @apiParam {Boolean} format=json 返回数据格式
	 * @apiParam {Boolean} ignore=true 是否需要验证访问权限
	 * @apiParam {String} updatedBy 编辑人
	 * @apiParam {String} updatedDt 编辑时间
	 * @apiParam {Integer} tabindex 排序
	 * @apiParam {String} code 序号,8位年月日+4位主办单位编号+2位正整数序号（每日从01开始累计）例如：
	 *           20180829002309按创建顺序倒序排列
	 * @apiParam {String} name 比赛名称,比赛名称最多五十个字
	 * @apiParam {java.util.Date} draftstarttime 征稿开始时间,
	 * @apiParam {java.util.Date} draftendtime 征稿结束时间,到结束时间后更改比赛状态为征稿结束(自动)，不直接进入初评
	 * @apiParam {String} homebigimg 首页大图,
	 * @apiParam {String} coverbigimg 封面大图,
	 * @apiParam {String} organizer 主办单位,主办单位名称最多三十个字
	 * @apiParam {String} coorganizer 协办单位,协办单位名称最多一百个字
	 * @apiParam {String} highestreward 最高奖励,最高奖励最多20个字
	 * @apiParam {Integer} individuallimit 个人投稿数量限制,0不限制,>0为限制数量,默认0不限制
	 * @apiParam {Integer} onlinestate 在线状态,1在线,0下线,默认0下线
	 * @apiParam {String} competitionstate
	 *           比赛状态,取字典,,,默认0未征稿,1征稿中,2征稿结束,3开始初评,4结束初评,5开始终评,6开始初步终评,7开始投分终评,8结束终评,9公示中,10比赛结束;2-8为评选中
	 * 
	 * @apiExample 调用示例: curl -i
	 *             http://localhost:8080/mars-core/pgymatch/query?format=json&ignore=true&version=v1
	 * 
	 * @apiSuccess {String} dbId 数据主键
	 * @apiSuccess {String} updatedBy 编辑人
	 * @apiSuccess {String} updatedDt 编辑时间
	 * @apiSuccess {Integer} tabindex 排序
	 * @apiSuccess {String} code 序号,8位年月日+4位主办单位编号+2位正整数序号（每日从01开始累计）例如：
	 *             20180829002309按创建顺序倒序排列
	 * @apiSuccess {String} name 比赛名称,比赛名称最多五十个字
	 * @apiSuccess {java.util.Date} draftstarttime 征稿开始时间,
	 * @apiSuccess {java.util.Date} draftendtime
	 *             征稿结束时间,到结束时间后更改比赛状态为征稿结束(自动)，不直接进入初评
	 * @apiSuccess {String} homebigimg 首页大图,
	 * @apiSuccess {String} coverbigimg 封面大图,
	 * @apiSuccess {String} organizer 主办单位,主办单位名称最多三十个字
	 * @apiSuccess {String} coorganizer 协办单位,协办单位名称最多一百个字
	 * @apiSuccess {String} highestreward 最高奖励,最高奖励最多20个字
	 * @apiSuccess {Integer} individuallimit 个人投稿数量限制,0不限制,>0为限制数量,默认0不限制
	 * @apiSuccess {Integer} onlinestate 在线状态,1在线,0下线,默认0下线
	 * @apiSuccess {String} competitionstate
	 *             比赛状态,取字典,,,默认0未征稿,1征稿中,2征稿结束,3开始初评,4结束初评,5开始终评,6开始初步终评,7开始投分终评,8结束终评,9公示中,10比赛结束;2-8为评选中
	 * 
	 * @apiError NoAccessRight 只有授权用户才能访问此地址.
	 * @apiError NoParamFormat 没有设置参数format=json.
	 * @apiErrorExample Response (example): HTTP/1.1 Status 406 { "error":
	 *                  "NoParamFormat" }
	 * 
	 * @apiSampleRequest http://localhost:8080/mars-core/pgymatch/query?format=json&ignore=true&version=v1
	 * 
	 */
	@Override
	public List<? extends Entity> queryAll(HttpServletRequest request,
			@ParameterAttribute(value = "") Pgymatch entity) {
		return super.queryAll(request, entity);
	}

	/**
	 * 分页查询数据.
	 * 
	 * @param request
	 * @param pageModel
	 * @return
	 * 
	 * @api {GET} /pgymatch/page 分页查询数据
	 * @apiVersion 1.0.0
	 * @apiName page
	 * @apiGroup Pgymatch
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
	 * @apiExample 调用示例: curl -i
	 *             http://localhost:8080/mars-core/pgymatch/page?format=json&ignore=true&version=v1&pageNum=2&pageSize=20
	 * 
	 * @apiSuccess {List} results 数据列表
	 * @apiSuccess {Integer} pageNum 页码
	 * @apiSuccess {Integer} pageSize 当前页条数
	 * @apiSuccess {Integer} totalRecord 总记录条数
	 * @apiSuccess {Integer} totalPage 总页数
	 * 
	 * @apiError NoAccessRight 只有授权用户才能访问此地址.
	 * @apiError NoParamFormat 没有设置参数format=json.
	 * @apiErrorExample Response (example): HTTP/1.1 Status 406 { "error":
	 *                  "NoParamFormat" }
	 * 
	 * @apiSampleRequest http://localhost:8080/mars-core/pgymatch/page?format=json&ignore=true&version=v1&pageNum=2&pageSize=20
	 * 
	 */
	@Override
	public PageModel<? extends Entity> queryByPage(HttpServletRequest request,
			@ParameterAttribute(value = "pageModel") PageModel<? extends Entity> pageModel) {
		String role = new CommandResultUtil().getCharacter(request);
		if (role.equals(EnumRole.rater.toString())) {
			return null;
		}
		if (role.equals(EnumRole.hostunit.toString())) {
			Pgymatch ent = (Pgymatch) pageModel.getQueryParam();// 把主办方单位的id放入查询条件中
			// 主办方账号只能看到自己名下的评委 超级管理员可以看到全部
			String id = new CommandResultUtil().getUserid(request);
			ent.setHuid(id);
		}

		PageModel<? extends Entity> result = super.queryByPage(request, pageModel);
		result.setQueryParam(null);
		return result;
	}

	/**
	 * 设定一些参数值.
	 * 
	 * @param request
	 * @param pageModel
	 */
	@Override
	protected void beforeQueryByPage(HttpServletRequest request, PageModel<? extends Entity> pageModel) {
		// Entity的属性 createdDt 有默认值，查询时需要去掉此默认参数值
		Entity ent = pageModel.getQueryParam();
		if (ent != null) {
			ent.setCreatedDt(null);
		}
	}

	// /**
	// * 分页查询数据.
	// * @param request
	// * @param pageModel
	// * @return
	// */
	// @RequestMapping(value = "/mtpage", method = RequestMethod.GET, produces =
	// "application/json; charset=UTF-8")
	// @ResponseBody
	// public PageModel<Pgymatch> querymtByPage(HttpServletRequest request,
	// @ParameterAttribute(value = "pageModel") PageModel<Pgymatch> pageModel){
	//
	//
	//
	//
	//
	// return pageModel;
	// }

	/**
	 * 增删改查等操作.
	 * 
	 * @param entity
	 *            参数
	 * @param request
	 *            参数
	 * @param operator
	 *            操作
	 * @return
	 * 
	 * 
	 * @api {POST} /address/{operator}/command 增删改查等操作.
	 * @apiVersion 1.0.0
	 * @apiName command
	 * @apiGroup Pgymatch
	 * @apiDescription 增删改查等操作
	 * @apiPermission 无
	 * 
	 * @apiParam {String} version=v1 版本, 指定值 : v1
	 * @apiParam {Boolean} format=json 返回数据格式, 默认值 : json
	 * @apiParam {Boolean} ignore=true 是否需要验证访问权限, 默认值 : true
	 * @apiParam {String} updatedBy 编辑人
	 * @apiParam {String} updatedDt 编辑时间
	 * @apiParam {Integer} tabindex 排序
	 * @apiParam {String} code 序号,8位年月日+4位主办单位编号+2位正整数序号（每日从01开始累计）例如：
	 *           20180829002309按创建顺序倒序排列
	 * @apiParam {String} name 比赛名称,比赛名称最多五十个字
	 * @apiParam {java.util.Date} draftstarttime 征稿开始时间,
	 * @apiParam {java.util.Date} draftendtime 征稿结束时间,到结束时间后更改比赛状态为征稿结束(自动)，不直接进入初评
	 * @apiParam {String} homebigimg 首页大图,
	 * @apiParam {String} coverbigimg 封面大图,
	 * @apiParam {String} organizer 主办单位,主办单位名称最多三十个字
	 * @apiParam {String} coorganizer 协办单位,协办单位名称最多一百个字
	 * @apiParam {String} highestreward 最高奖励,最高奖励最多20个字
	 * @apiParam {Integer} individuallimit 个人投稿数量限制,0不限制,>0为限制数量,默认0不限制
	 * @apiParam {Integer} onlinestate 在线状态,1在线,0下线,默认0下线
	 * @apiParam {String} competitionstate
	 *           比赛状态,取字典,,,默认0未征稿,1征稿中,2征稿结束,3开始初评,4结束初评,5开始终评,6开始初步终评,7开始投分终评,8结束终评,9公示中,10比赛结束;2-8为评选中
	 * 
	 * @apiExample 调用示例: curl -d "code=11&name=abc" -i
	 *             http://localhost:8080/mars-core/pgymatch/add/command?format=json&ignore=true&version=v1
	 * 
	 * @apiSuccess {String} code 结果状态码, "success" : 成功； "fail" : 失败
	 * @apiSuccess {String} message 结果文字描述信息
	 * 
	 * @apiError NoAccessRight 只有授权用户才能访问此地址.
	 * @apiError NoParamFormat 没有设置参数format=json.
	 * @apiErrorExample Response (example): HTTP/1.1 Status 406 { "error":
	 *                  "NoParamFormat" }
	 */
	@Override
	public CommandEntity doCommand(@ParameterAttribute(value = "") Pgymatch entity, HttpServletRequest request,
			@PathVariable String operator) {
		log.debug("{} doCommand : \"{}\" ", Mars.LOG_PRE, operator);
		return super.doCommand(entity, request, operator);
	}

	/**
	 * 执行操作前可进行额外的参数设置.
	 */
	@Override
	protected void beforeCommand(HttpServletRequest request, Entity entity, String cmdCode) {
		if (cmdCode.equals("add")) {
			System.out.println("beforeCommand:" + entity.getDbId());
		}
	}

	/**
	 * 执行操作完成后，可以增加额外返回数据.
	 */
	@Override
	protected void afterCommand(HttpServletRequest request, Entity entity, CommandEntity result, String cmdCode) {
		if (cmdCode.equals("add")) {
			System.out.println("afterCommand:" + entity.getDbId());
			result.setExtraCode(entity.getDbId());
		}
	}

	/*
	 * 修改比赛状态
	 * 
	 * @param id
	 * 
	 * @param version
	 * 
	 * @param competitionstate
	 * 
	 * @return CommandEntity
	 * http://localhost:8080/artron-photography/pgymatch/mtcompetition?format=json&
	 * ignore=false&id=1039448411964702720&version=1&competitionstate=2
	 */
	@RequestMapping(value = "/mtcompetition", method = RequestMethod.POST, produces = "application/json; charset=UTF-8") //
	@ResponseBody
	public CommandEntity mtUpdateCompetition(inModel map, HttpServletRequest request) {
		String operator = "update";
		log.debug("{} doCommand : \"{}\" ", Mars.LOG_PRE, operator);
		CommandEntity result = new CommandEntity();
		result.setCommand(operator);
		result.setCommandTitle("修改比赛状态");
		result.setStatus(HttpStatus.SC_INTERNAL_SERVER_ERROR);
		result.setCode(Mars.FAIL);
		try {
			if (map.getId() == null || map.getId().length() == 0) {
				{
					log.error("id不能为空");
					throw new MarsException("修改比赛状态失败");
				}
			}
			if (map.getCompetitionstate() == null || map.getCompetitionstate().length() == 0) {
				log.error("competitionstate不能为空.");
				throw new MarsException("修改比赛状态失败");
			}
			if (!StringUtils.isInt(map.getCompetitionstate())) {
				log.error("competitionstate错误:" + map.getCompetitionstate());
				throw new NumberFormatException("修改比赛状态失败");
			}
			String id = map.getId();
			Integer competitionstate = Integer.valueOf(map.getCompetitionstate());
			if (competitionstate == 1) {
				log.error("征稿未结束,不能修改比赛状态,状态值:" + competitionstate);
				throw new MarsException("征稿未结束,不能修改比赛状态");
			}
			if (competitionstate < 2 || competitionstate > 10) {
				log.error("competitionstate值错误:" + competitionstate);
				throw new MarsException("修改比赛状态失败");
			}
			Pgymatch entity = pgymatchService.queryById(id);
			if (entity == null) {
				log.error("id错误.");
				throw new MarsException("修改比赛状态失败");
			}
			Integer oldCompetitionstate = Integer.valueOf(entity.getCompetitionstate());
			if (competitionstate <= oldCompetitionstate) {
				log.error("competitionstate错误:" + competitionstate);
				throw new MarsException("修改比赛状态失败");
			}
			if ((oldCompetitionstate + 1) != competitionstate) {
				log.error("competitionstate错误:" + competitionstate);
				throw new MarsException("修改比赛状态失败");
			}
			Integer num = pgymatchService.updateCompetition(id, competitionstate.toString());
			if (num > 0) {
				result.setStatus(HttpStatus.SC_OK);
				result.setCode(Mars.SUCCESS);
				result.setMessage("修改比赛状态成功");
			}
		} catch (MarsException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result.setMessage(e.getMessage());
		} catch (NumberFormatException e) {
			// TODO: handle exception
			e.printStackTrace();
			result.setMessage(e.getMessage());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			result.setMessage("修改比赛状态失败");
		}
		return result;
	}

	/*
	 * 比赛上线
	 * 
	 * @param id
	 * 
	 * @param version
	 * 
	 * @return CommandEntity
	 * http://localhost:8080/artron-photography/pgymatch/mtonline?format=json&ignore
	 * =false&id=1039448411964702720&version=1
	 */
	@RequestMapping(value = "/mtonline", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public CommandEntity mtUpdateOnline(inModel map, HttpServletRequest request) {
		String operator = "update";
		log.debug("{} doCommand : \"{}\" ", Mars.LOG_PRE, operator);
		CommandEntity result = new CommandEntity();
		result.setCommand(operator);
		result.setCommandTitle("上线比赛");
		result.setStatus(HttpStatus.SC_INTERNAL_SERVER_ERROR);
		result.setCode(Mars.FAIL);
		result.setMessage("上线失败");
		try {
			if (map.getId() == null || map.getId().length() == 0) {
				log.error("参数不能为空.");
				throw new MarsException("上线失败");
			}
			String id = map.getId();
			Pgymatch entity = pgymatchService.queryById(id);
			if (entity == null) {
				log.error("参数错误.");
				throw new MarsException("上线失败");
			}
			if (entity.getOnlinestate() == 1) {
				log.error("已上线比赛,不需要再次上线.");
				throw new MarsException("上线失败,比赛已经上线");
			}
			int num = pgymatchService.updateOnline(id, 1, "2");// 状态1上线,"1"征稿中 值2在调试完成后改成1
			if (num > 0) {
				result.setStatus(HttpStatus.SC_OK);
				result.setCode(Mars.SUCCESS);
				result.setMessage("比赛上线成功");
			}
		} catch (MarsException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result.setMessage(e.getMessage());
		} catch (NumberFormatException e) {
			// TODO: handle exception
			e.printStackTrace();
			result.setMessage(e.getMessage());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			result.setMessage("上线失败");
		}
		return result;
	}

	/**
	 * 编辑比赛
	 * 
	 * @param CommandModel
	 * @param request
	 * 
	 * @return CommandEntity
	 */
	@RequestMapping(value = "/mtupdate", method = RequestMethod.POST, produces = "application/json; charset=UTF-8") //
	@ResponseBody
	public CommandEntity mtUpdate(@ParameterAttribute(value = "") Pgymatch entity, HttpServletRequest request) { // throws
																													// Exception
		// @RequestBody
		// Pgymatch
		// entity
		String operator = "update";
		log.debug("{} doCommand : \"{}\" ", Mars.LOG_PRE, operator);
		CommandEntity result = new CommandEntity();
		String operatorCommand = "command." + operator;
		result.setCommand(operator);
		String commandTitle = LocaleUtil.getMessage(request, operatorCommand, new Object[] {});
		result.setCommandTitle(commandTitle);
		result.setStatus(HttpStatus.SC_INTERNAL_SERVER_ERROR);
		result.setCode(Mars.FAIL);
		try {

			if (entity == null) {
				{
					log.error("失败，参数为空.");
					throw new MarsException("修改失败");
				}
			}
			ValidationUtils.validObject(entity);//

			log.info(entity.getMtawards());
			log.info(entity.getMtgroup());
			String Mtawards = StringEscapeUtils.unescapeHtml4(entity.getMtawards());
			String Mtgroup = StringEscapeUtils.unescapeHtml4(entity.getMtgroup());
			log.info(Mtawards);
			log.info(Mtgroup);
			List<Pgymtawards> mtawards = FastjsonUtil.JsonToList(Mtawards, Pgymtawards.class);// 奖项列表
			List<Pgymtgroup> mtgroup = FastjsonUtil.JsonToList(Mtgroup, Pgymtgroup.class); // 分组列表
			if (mtawards == null) {
				throw new MarsException("奖项列表不能为空.");
			}
			if (Mtgroup == null) {
				throw new MarsException("分组列表不能为空.");
			}
			ValidationUtils.validObject(mtgroup);
			ValidationUtils.validObject(mtawards);

			String mtdbid = entity.getDbId();
			if (mtdbid == null || mtdbid.length() == 0) {
				log.error("ID不能为空.");
				throw new MarsException("修改失败");
			}
			if (mtgroup.size() > 10) {
				throw new MarsException("分组数量不能超过10个.");
			}

			if (mtawards.size() > 20) {
				throw new MarsException("奖项数量不能超过20个.");
			}
			if (!StringUtils.isInt(entity.getDraftstime())) {
				throw new MarsException("征稿开始时间错误.");
			}
			if (!StringUtils.isInt(entity.getDraftetime())) {
				throw new MarsException("征稿结束时间错误.");
			}

			entity.setDraftstarttime(DateUtils.transferLongToDate(Long.valueOf(entity.getDraftstime())));
			entity.setDraftendtime(DateUtils.transferLongToDate(Long.valueOf(entity.getDraftetime())));

			// 1征集内容,2奖项设置,3征稿细则,4投稿方式,5日程安排,6特别说明
			List<Pgymttext> mttext = new ArrayList<Pgymttext>();
			Pgymttext cjnr = new Pgymttext();
			cjnr.setTabIndex(0);
			cjnr.setVersion(0);
			cjnr.setTexttype("1");
			cjnr.setTextcontent(entity.getCollectioncontents());
			mttext.add(cjnr);

			Pgymttext jxsz = new Pgymttext();
			jxsz.setTabIndex(1);
			jxsz.setVersion(0);
			jxsz.setTexttype("2");
			jxsz.setTextcontent(entity.getAwards());
			mttext.add(jxsz);

			Pgymttext zggz = new Pgymttext();
			zggz.setTabIndex(2);
			zggz.setVersion(0);
			zggz.setTexttype("3");
			zggz.setTextcontent(entity.getDraftrules());
			mttext.add(zggz);

			Pgymttext tgfs = new Pgymttext();
			tgfs.setTabIndex(3);
			tgfs.setVersion(0);
			tgfs.setTexttype("4");
			tgfs.setTextcontent(entity.getSubmission());// submission
			mttext.add(tgfs);

			if (entity.getSchedule() != null && entity.getSchedule().length() > 0)// schedule
			{
				Pgymttext rcap = new Pgymttext();
				rcap.setTabIndex(4);
				rcap.setVersion(0);
				rcap.setTexttype("5");
				rcap.setTextcontent(entity.getSchedule());// schedule
				mttext.add(rcap);
			}

			if (entity.getSpecialdescription() != null && entity.getSpecialdescription().length() > 0) {
				Pgymttext tbsm = new Pgymttext();
				tbsm.setTabIndex(5);
				tbsm.setVersion(0);
				tbsm.setTexttype("6");
				tbsm.setTextcontent(entity.getSpecialdescription());// specialdescription
				mttext.add(tbsm);
			}

			if (entity.getCoorganizer() == null)
				entity.setCoorganizer("");
			CommandEntity mtAddEntity = super.doExecuteCommand(request, operator, entity);
			if (mtAddEntity.getStatus().equals(HttpStatus.SC_OK) && mtAddEntity.getCode().equals(Mars.SUCCESS)) {

				// 继续后面的操作
				Integer result_del = pgymtgroupService.deleteByMtid(mtdbid);
				for (Pgymtgroup gp : mtgroup) {
					gp.setMtId(mtdbid);
					String commandBeanId = gp.getClass().getSimpleName() + "." + "add";
					log.info("{} Find Command bean : {} ", Mars.LOG_PRE, commandBeanId);
					ServiceCommand<Pgymtgroup, String> command = SpringContextHolder.getBean(commandBeanId);
					pgymtgroupService.save(gp, command);
				}
				result_del = pgymtawardsService.deleteByMtid(mtdbid);
				for (Pgymtawards ads : mtawards) {
					ads.setMtId(mtdbid);
					String commandBeanId = ads.getClass().getSimpleName() + "." + "add";
					log.info("{} Find Command bean : {} ", Mars.LOG_PRE, commandBeanId);
					ServiceCommand<Pgymtawards, String> command = SpringContextHolder.getBean(commandBeanId);
					pgymtawardsService.save(ads, command);
				}
				result_del = pgymttextService.deleteByMtid(mtdbid);
				for (Pgymttext tt : mttext) {
					tt.setMtId(mtdbid);
					String commandBeanId = tt.getClass().getSimpleName() + "." + "add";
					log.info("{} Find Command bean : {} ", Mars.LOG_PRE, commandBeanId);
					ServiceCommand<Pgymttext, String> command = SpringContextHolder.getBean(commandBeanId);
					pgymttextService.save(tt, command);
				}
				result.setStatus(HttpStatus.SC_OK);
				result.setCode(Mars.SUCCESS);
			} else {
				result.setStatus(mtAddEntity.getStatus());
				result.setCode(mtAddEntity.getCode());
				result.setMessage(mtAddEntity.getMessage());
			}
		} catch (MarsException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result.setMessage(e.getMessage());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			result.setMessage("修改失败");
		}
		return result;
	}

	private void SetTextcontent(List<Pgymttext> mttext, Pgymatch mt) {
		for (Pgymttext tt : mttext) {
			switch (tt.getTexttype()) {// 1征集内容,2奖项设置,3征稿细则,4投稿方式,5日程安排,6特别说明
			case "1":
				mt.setCollectioncontents(tt.getTextcontent());
				break;
			case "2":
				mt.setAwards(tt.getTextcontent());
				break;
			case "3":
				mt.setDraftrules(tt.getTextcontent());
				break;
			case "4":
				mt.setSubmission(tt.getTextcontent());
				break;
			case "5":
				mt.setSchedule(tt.getTextcontent());
				break;
			case "6":
				mt.setSpecialdescription(tt.getTextcontent());
				break;
			default:
				break;
			}
		}
	}

	/**
	 * 查询比赛当前状态
	 * 
	 * @param dbid
	 * @param request
	 * @return
	 * 
	 * @apiExample http://localhost:8080/artron-photography/pgymatch/getState?format=json&ignore=false&dbid=1040414483119341568
	 * 
	 */
	@RequestMapping(value = "/getState", method = RequestMethod.GET, produces = "application/json; charset=UTF-8") //
	@ResponseBody
	public CommandEntity queryStateById(String dbid, HttpServletRequest request) {
		ResultEntity<String> result = new ResultEntity<String>();
		result.setCommand("getState");
		result.setCommandTitle("查询比赛当前状态");
		result.setStatus(HttpStatus.SC_INTERNAL_SERVER_ERROR);
		result.setCode(Mars.FAIL);
		try {
			if (dbid == null || dbid.length() == 0) {
				{
					log.error("id不能为空");
					throw new MarsException("查询失败.");
				}
			}
			String stste = pgymatchService.queryStateById(dbid);
			result.setData(stste);
			result.setStatus(HttpStatus.SC_OK);
			result.setCode(Mars.SUCCESS);
			result.setMessage("查询比赛当前状态成功");

		} catch (MarsException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result.setMessage(e.getMessage());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			result.setMessage("查询失败");
		}
		return result;
	}

	/**
	 * 征稿页签信息
	 * 
	 * @param dbid
	 * @param request
	 * @return
	 * 
	 * @apiExample http://localhost:8080/artron-photography/pgymatch/getDraft?format=json&ignore=false&dbid=1040414483119341568
	 * 
	 */
	@RequestMapping(value = "open/getDraft", method = RequestMethod.GET, produces = "application/json; charset=UTF-8") //
	@ResponseBody
	public ResultEntity<Pgymatch> queryDraftById(String dbid, HttpServletRequest request) {
		ResultEntity<Pgymatch> result = new ResultEntity<Pgymatch>();
		result.setCommand("getDraft");
		result.setCommandTitle("取征稿页信息");
		result.setStatus(HttpStatus.SC_INTERNAL_SERVER_ERROR);
		result.setCode(Mars.FAIL);
		try {
			if (dbid == null || dbid.length() == 0) {
				log.error("参数为空");
				throw new MarsException("查询失败");
			}
			Pgymatch mt = pgymatchService.queryById(dbid);
			ChannelStatistics cs = pgymanuscriptService.queryChannelCount(dbid);
			if (cs.getAllcount() != null && cs.getDqcount() != null) {
				cs.setSccount(cs.getAllcount() - cs.getDqcount());
			} else {
				log.error("稿件数查询失败,mtid:" + dbid);
				throw new MarsException("查询失败");
			}
			mt.setChannelstatistics(cs);
			result.setData(mt);
			result.setStatus(HttpStatus.SC_OK);
			result.setCode(Mars.SUCCESS);
		} catch (MarsException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result.setMessage(e.getMessage());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			result.setMessage("查询失败");
		}
		return result;
	}

	/*
	 * 取比赛信息
	 * 
	 * @param request
	 * 
	 * @return ResultEntity<CommandModel>
	 * 
	 * http://localhost:8080/artron-photography/pgymatch/getmt?format=json&ignore=
	 * false&id=1039448411964702720
	 */
	@RequestMapping(value = "open/getmt", method = RequestMethod.GET, produces = "application/json; charset=UTF-8") //
	@ResponseBody
	public ResultEntity<CommandModel> queryById(String id, String extraCode, HttpServletRequest request) {
		ResultEntity<CommandModel> result = new ResultEntity<CommandModel>();
		result.setCommand("GetModel");
		result.setCommandTitle("取比赛信息");
		result.setStatus(HttpStatus.SC_INTERNAL_SERVER_ERROR);
		result.setCode(Mars.FAIL);
		try {
			if (id == null || id.length() == 0) {
				log.error("参数为空");
				throw new MarsException("查询失败");
			}
			CommandModel cm = new CommandModel();
			Pgymatch mt = pgymatchService.queryById(id);

			if (extraCode == null || extraCode.length() == 0) {
				List<Pgymtawards> mtawards = pgymtawardsService.queryByMtId(id);
				cm.setMtawards(mtawards);
				List<Pgymtgroup> mtgroup = pgymtgroupService.queryByMtId(id);
				cm.setMtgroup(mtgroup);
				List<Pgymttext> mttext = pgymttextService.queryByMtId(id);
				SetTextcontent(mttext, mt);
			} else if (!"0".equals(extraCode)) {
				List<Pgymtawards> mtawards = pgymtawardsService.queryByMtId(id);
				cm.setMtawards(mtawards);
				List<Pgymtgroup> mtgroup = pgymtgroupService.queryByMtId(id);
				cm.setMtgroup(mtgroup);
				List<Pgymttext> mttext = pgymttextService.queryByMtId(id);
				SetTextcontent(mttext, mt);

			}
			cm.setMatch(mt);
			result.setData(cm);
			result.setStatus(HttpStatus.SC_OK);
			result.setCode(Mars.SUCCESS);
		} catch (MarsException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result.setMessage(e.getMessage());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			result.setMessage("查询失败");
		}
		return result;
	}

	/**
	 * 添加比赛
	 * 
	 * @param CommandModel
	 * @param request
	 * 
	 * @return CommandEntity
	 */
	@RequestMapping(value = "/mtadd", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public CommandEntity mtAdd(@ParameterAttribute(value = "") Pgymatch entity, HttpServletRequest request) {

		String operator = "add";
		log.debug("{} doCommand : \"{}\" ", Mars.LOG_PRE, operator);
		CommandEntity result = new CommandEntity();
		String operatorCommand = "command." + operator;
		result.setCommand(operator);
		String commandTitle = LocaleUtil.getMessage(request, operatorCommand, new Object[] {});
		result.setCommandTitle(commandTitle);
		result.setStatus(HttpStatus.SC_INTERNAL_SERVER_ERROR);
		result.setCode(Mars.FAIL);
		try {
			if (entity == null) {
				log.error("失败，参数为空.");
				throw new MarsException("添加失败.");
			}
			ValidationUtils.validObject(entity);//

			log.info(entity.getMtawards());
			log.info(entity.getMtgroup());
			String Mtawards = StringEscapeUtils.unescapeHtml4(entity.getMtawards());
			String Mtgroup = StringEscapeUtils.unescapeHtml4(entity.getMtgroup());
			log.info(Mtawards);
			log.info(Mtgroup);
			List<Pgymtawards> mtawards = FastjsonUtil.JsonToList(Mtawards, Pgymtawards.class);// 奖项列表
			List<Pgymtgroup> mtgroup = FastjsonUtil.JsonToList(Mtgroup, Pgymtgroup.class); // 分组列表
			if (mtawards == null) {
				throw new MarsException("奖项不能为空.");
			}
			if (Mtgroup == null) {
				throw new MarsException("分组不能为空.");
			}
			ValidationUtils.validObject(mtgroup);
			ValidationUtils.validObject(mtawards);
			if (mtgroup.size() > 10) {
				throw new MarsException("分组数量不能超过10个.");
			}

			if (mtawards.size() > 20) {
				throw new MarsException("奖项数量不能超过20个.");
			}
			if (!StringUtils.isInt(entity.getDraftstime())) {
				throw new MarsException("征稿开始时间错误.");
			}
			if (!StringUtils.isInt(entity.getDraftetime())) {
				throw new MarsException("征稿结束时间错误.");
			}

			entity.setDraftstarttime(DateUtils.transferLongToDate(Long.valueOf(entity.getDraftstime())));
			entity.setDraftendtime(DateUtils.transferLongToDate(Long.valueOf(entity.getDraftetime())));

			// List<Pgymtawards> tabnull = mtawards.stream().filter(s -> s.getTabIndex() ==
			// null).collect(Collectors.toList());
			// if (tabnull != null && !tabnull.isEmpty()) {
			// throw new MarsException("TabIndex为空.");
			// }
			// if (entity.getMtawards().size() !=
			// entity.getMtawards().stream().map(Pgymtawards::getTabIndex)
			// .collect(Collectors.toSet()).size()) {
			// throw new MarsException("TabIndex重复.");
			// }

			// 1征集内容,2奖项设置,3征稿细则,4投稿方式,5日程安排,6特别说明
			List<Pgymttext> mttext = new ArrayList<Pgymttext>();
			Pgymttext cjnr = new Pgymttext();
			cjnr.setTabIndex(0);
			cjnr.setVersion(0);
			cjnr.setTexttype("1");
			cjnr.setTextcontent(entity.getCollectioncontents());
			mttext.add(cjnr);

			Pgymttext jxsz = new Pgymttext();
			jxsz.setTabIndex(1);
			jxsz.setVersion(0);
			jxsz.setTexttype("2");
			jxsz.setTextcontent(entity.getAwards());
			mttext.add(jxsz);

			Pgymttext zggz = new Pgymttext();
			zggz.setTabIndex(2);
			zggz.setVersion(0);
			zggz.setTexttype("3");
			zggz.setTextcontent(entity.getDraftrules());
			mttext.add(zggz);

			Pgymttext tgfs = new Pgymttext();
			tgfs.setTabIndex(3);
			tgfs.setVersion(0);
			tgfs.setTexttype("4");
			tgfs.setTextcontent(entity.getSubmission());// submission
			mttext.add(tgfs);

			if (entity.getSchedule() != null && entity.getSchedule().length() > 0)// schedule
			{
				Pgymttext rcap = new Pgymttext();
				rcap.setTabIndex(4);
				rcap.setVersion(0);
				rcap.setTexttype("5");
				rcap.setTextcontent(entity.getSchedule());// schedule
				mttext.add(rcap);
			}

			if (entity.getSpecialdescription() != null && entity.getSpecialdescription().length() > 0) {
				Pgymttext tbsm = new Pgymttext();
				tbsm.setTabIndex(5);
				tbsm.setVersion(0);
				tbsm.setTexttype("6");
				tbsm.setTextcontent(entity.getSpecialdescription());// specialdescription
				mttext.add(tbsm);
			}

			entity.setOnlinestate(0);
			entity.setCompetitionstate("0");
			String huid = HuidUtils.getHuid(request);
			log.info("主办方:" + huid);
			Pgyhostunit pgyhostunit = pgyhostunitService.queryById(huid);
			String code = DateUtil.formatDate(new Date(), "yyyyMMdd");
			// 取当天最大序号
			Integer maxcode = pgymatchService.queryMaxCode(code);
			maxcode++;
			code += pgyhostunit.getCode();// 主办单位编号
			code += String.format("%02d", maxcode); // 序号
			entity.setCode(code);
			entity.setHuid(huid);
			if (entity.getCoorganizer() == null)
				entity.setCoorganizer("");

			CommandEntity mtAddEntity = super.doExecuteCommand(request, operator, entity);
			if (mtAddEntity.getStatus().equals(HttpStatus.SC_OK) && mtAddEntity.getCode().equals(Mars.SUCCESS)) {
				// 继续后面的添加
				String mtdbid = mtAddEntity.getExtraCode();
				if (mtdbid == null || mtdbid.length() == 0) {
					log.error("比赛添加失败ID返回空");
					throw new MarsException("添加失败.");
				}
				for (Pgymtgroup gp : mtgroup) {
					gp.setMtId(mtdbid);
					String commandBeanId = gp.getClass().getSimpleName() + "." + operator;
					log.info("{} Find Command bean : {} ", Mars.LOG_PRE, commandBeanId);
					ServiceCommand<Pgymtgroup, String> command = SpringContextHolder.getBean(commandBeanId);
					pgymtgroupService.save(gp, command);
				}
				int tabindex = 1;
				for (Pgymtawards ads : mtawards) {
					ads.setMtId(mtdbid);
					ads.setTabIndex(tabindex);
					String commandBeanId = ads.getClass().getSimpleName() + "." + operator;
					log.info("{} Find Command bean : {} ", Mars.LOG_PRE, commandBeanId);
					ServiceCommand<Pgymtawards, String> command = SpringContextHolder.getBean(commandBeanId);
					pgymtawardsService.save(ads, command);
					tabindex++;
				}

				for (Pgymttext tt : mttext) {
					tt.setMtId(mtdbid);
					String commandBeanId = tt.getClass().getSimpleName() + "." + operator;
					log.info("{} Find Command bean : {} ", Mars.LOG_PRE, commandBeanId);
					ServiceCommand<Pgymttext, String> command = SpringContextHolder.getBean(commandBeanId);
					pgymttextService.save(tt, command);
				}
				result.setStatus(HttpStatus.SC_OK);
				result.setCode(Mars.SUCCESS);
				result.setExtraCode(mtdbid);
			} else {
				result.setStatus(mtAddEntity.getStatus());
				result.setCode(mtAddEntity.getCode());
				result.setMessage(mtAddEntity.getMessage());
			}
		} catch (IllegalArgumentException e) {
			// TODO: handle exception
			e.printStackTrace();
			result.setMessage("添加失败.");
		} catch (MarsException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result.setMessage(e.getMessage());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			result.setMessage("添加失败.");
		}
		return result;
	}

	/*
	 * 上传图片
	 */
	@PostMapping("/upload")
	@ResponseBody
	public CommandEntity mtupload(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
		CommandEntity result = new CommandEntity();
		result.setCommand("UpLoad");
		result.setCommandTitle("上传图片");
		result.setStatus(HttpStatus.SC_INTERNAL_SERVER_ERROR);
		result.setCode(Mars.FAIL);
		try {
			if (file.isEmpty()) {
				throw new MarsException("文件不能为空.");
			}

			// 获得文件类型（可以判断如果不是图片，禁止上传）
			String contentType = file.getContentType();// ?????
			System.out.println(contentType);

			System.out.println(contentType.substring(0, contentType.indexOf("/")));
			// if(contentType.equals("image/jpeg"))
			if (!"image".equals(contentType.substring(0, contentType.indexOf("/")))) {
				throw new MarsException("上传失败，图片格式错误.");
			}
			// file.getSize();//5*1048576 5M
			if (file.getSize() > 5 * 1048576) {// 限制5M
				throw new MarsException("上传失败，请上传小于5M图片.");
			}
			// 生成uuid作为文件名称
			String uuid = UUID.randomUUID().toString().replaceAll("-", "");

			String path = PathUtil.GetFolderPath();
			System.out.println(path);
			String sqlPathPre = path.replaceAll("\\\\", "/");
			System.out.println(sqlPathPre);

			// 定义文件保存的本地路径
			String localPath = PathUtil.GetPathPrefix() + path;
			System.out.println(localPath);
			boolean cDirecotry = FileUtil.createDirecotry(localPath);
			System.out.println("创建目录:" + cDirecotry);

			// 获得文件后缀名
			String suffixName = contentType.substring(contentType.indexOf("/") + 1);
			// 得到 文件名
			String saveFileName = uuid + "." + suffixName;
			System.out.println(saveFileName);
			// FileUtil.chmod(localPath);
			System.out.println(localPath + saveFileName);

			// 保存数据库的路径
			String sqlPath = null;
			// String FileName = file.getOriginalFilename();// 文件原名

			File saveFile = new File(localPath + saveFileName);
			if (!saveFile.getParentFile().exists()) {
				saveFile.getParentFile().mkdirs();
			}

			BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(saveFile));
			out.write(file.getBytes());
			out.flush();
			out.close();
			// 把图片的相对路径保存至数据库
			sqlPath = sqlPathPre + saveFileName;
			System.out.println(sqlPath);
			result.setStatus(HttpStatus.SC_OK);
			result.setCode(Mars.SUCCESS);
			result.setMessage(sqlPath);

		} catch (FileNotFoundException e) {
			e.printStackTrace();
			result.setMessage("上传失败");
		} catch (IOException e) {
			e.printStackTrace();
			result.setMessage("上传失败");
		} catch (MarsException e) {
			e.printStackTrace();
			result.setMessage(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			result.setMessage("上传失败");
		}
		return result;
	}

	/**
	 * 初评页签信息
	 * 
	 * @param mtid
	 *            比赛ID
	 * @param request
	 * @return
	 * 
	 * @apiExample http://localhost:8080/artron-photography/pgymatch/getPreliminary?format=json&ignore=false&mtid=
	 */
	@RequestMapping(value = "getPreliminary", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public ResultEntity<Map<String, Object>> QueryPreliminary(String mtid, HttpServletRequest request) {
		ResultEntity<Map<String, Object>> result = new ResultEntity<Map<String, Object>>();
		result.setCommand("getPreliminary");
		result.setCommandTitle("初评页签信息");
		result.setStatus(HttpStatus.SC_INTERNAL_SERVER_ERROR);
		result.setCode(Mars.FAIL);
		try {
			if (mtid == null || mtid.length() == 0) {
				log.error("参数为空");
				throw new MarsException("查询失败");
			}
			Integer fppw = 0;
			Integer zgjs = 0;
			Integer dpsgjs = 0;
			Integer wtggjs = 0;
			Integer tggjs = 0;
			Map<String, Object> map = new HashMap<>();
			String mtstatus = pgymatchService.queryStateById(mtid);
			List<JudgeRatio> jr = pgymtmstjdeService.queryBfbByMtid(mtid);
			if (jr != null && jr.size() > 0) {
				fppw = 1;
			}
			else
			{
				jr=new ArrayList<JudgeRatio>();
			}
			List<Integer> list = pgymtmstjdeService.queryStatisticsByMtid(mtid);
			// 0:总稿件数,1:待评审数,2:未通过数,3:通过数
			if (list != null && list.size() == 4) {
				zgjs = list.get(0);
				dpsgjs = list.get(1);
				wtggjs = list.get(2);
				tggjs = list.get(3);
			}
			map.put("mtstatus", mtstatus);
			map.put("fppw", fppw);
			map.put("zgjs", zgjs);

			map.put("dpsgjs", dpsgjs);
			map.put("wtggjs", wtggjs);
			map.put("tggjs", tggjs);

			map.put("jr", jr);
			result.setData(map);
			result.setStatus(HttpStatus.SC_OK);
			result.setCode(Mars.SUCCESS);
		} catch (MarsException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
			result.setMessage(e.getMessage());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			log.error(e.getMessage());
			result.setMessage("查询失败");
		}
		return result;
	}

	/**
	 * 取初评待评审稿件数 结束初评前取数值判断是否提示
	 * 
	 * @param mtid
	 *            比赛ID
	 * @param request
	 * @return
	 * 
	 * @apiExample http://localhost:8080/artron-photography/pgymatch/NotReviewed?format=json&ignore=false&mtid=
	 */
	@RequestMapping(value = "NotReviewed", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public ResultEntity<Integer> queryNotReviewedByMtid(String mtid, HttpServletRequest request) {
		ResultEntity<Integer> result = new ResultEntity<Integer>();
		result.setCommand("NotReviewed");
		result.setCommandTitle("取初评待评审稿件数");
		result.setStatus(HttpStatus.SC_INTERNAL_SERVER_ERROR);
		result.setCode(Mars.FAIL);
		try {
			if (mtid == null || mtid.length() == 0) {
				log.error("参数为空");
				throw new MarsException("结束初评失败");
			}
			Integer dpsgjs = pgymtmstjdeService.queryNotReviewedCountByMtid(mtid);
			result.setData(dpsgjs);
			result.setStatus(HttpStatus.SC_OK);
			result.setCode(Mars.SUCCESS);
		} catch (MarsException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
			result.setMessage(e.getMessage());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			log.error(e.getMessage());
			result.setMessage("结束初评失败");
		}
		return result;
	}

	/**
	 * 结束初评
	 * 
	 * @param mtid
	 *            比赛ID
	 * @param request
	 * @return
	 * 
	 * @apiExample http://localhost:8080/artron-photography/pgymatch/EndFirstReview?format=json&ignore=false
	 */
	@RequestMapping(value = "EndFirstReview", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public CommandEntity EndFirstReview(String mtid, HttpServletRequest request) {
		CommandEntity result = new CommandEntity();
		result.setCommand("EndFirstReview");
		result.setCommandTitle("结束初评");
		result.setStatus(HttpStatus.SC_INTERNAL_SERVER_ERROR);
		result.setCode(Mars.FAIL);
		try {
			if (mtid == null || mtid.length() == 0) {
				log.error("参数为空");
				throw new MarsException("结束初评失败");
			}
			String mtstate = pgymatchService.queryStateById(mtid);
			Integer state = Integer.valueOf(mtstate);
			if (state < 3) {
				log.error("比赛状态为 " + state);
				throw new MarsException("结束初评失败,开始初评后才可以结束初评!");
			}
			if (state >= 4) {
				log.error("初评已被其他管理人员结束,比赛状态为 " + state);
				throw new MarsException("结束初评失败");
			}

			// 合并初评结果
			List<ReviewStatistics> mr = pgymtmstjdeService.queryMergeResult(mtid);
			if (mr == null || mr.size() == 0) {
				log.error("稿件数为0");
				throw new MarsException("结束初评失败");
			}
			// 批量修改稿件状态
			pgymanuscriptService.updateBatch(mr);

			Integer num = pgymatchService.updateCompetition(mtid, "4");
			if (num > 0) {
				result.setStatus(HttpStatus.SC_OK);
				result.setCode(Mars.SUCCESS);
				result.setMessage("结束初评成功");
			} else {
				result.setMessage("结束初评失败");
			}
		} catch (MarsException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
			result.setMessage(e.getMessage());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			log.error(e.getMessage());
			result.setMessage("结束初评失败");
		}
		return result;
	}

	// queryMstStateCountByMtid
	/**
	 * 取开始终评前待评审稿件数 开始终评前取数值判断是否提示
	 * 
	 * @param mtid
	 *            比赛ID
	 * @param request
	 * @return
	 * 
	 * @apiExample http://localhost:8080/artron-photography/pgymatch/BeforeStartFinal?format=json&ignore=false&mtid=
	 */
	@RequestMapping(value = "BeforeStartFinal", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public ResultEntity<Integer> queryBeforeStartFinalByMtid(String mtid, HttpServletRequest request) {
		ResultEntity<Integer> result = new ResultEntity<Integer>();
		result.setCommand("BeforeStartFinal");
		result.setCommandTitle("取开始终评前待评审稿件数");
		result.setStatus(HttpStatus.SC_INTERNAL_SERVER_ERROR);
		result.setCode(Mars.FAIL);
		try {
			if (mtid == null || mtid.length() == 0) {
				log.error("参数为空");
				throw new MarsException("开始终评失败");
			}
			Integer dpsgjs = pgymanuscriptService.queryMstStateCountByMtid(mtid);
			result.setData(dpsgjs);
			result.setStatus(HttpStatus.SC_OK);
			result.setCode(Mars.SUCCESS);
		} catch (MarsException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
			result.setMessage(e.getMessage());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			log.error(e.getMessage());
			result.setMessage("开始终评失败");
		}
		return result;
	}
	

	/**
	 * 开始终评
	 * 
	 * @param mtid
	 *            比赛ID
	 * @param request
	 * @return
	 * 
	 * @apiExample http://localhost:8080/artron-photography/pgymatch/StartFinal?format=json&ignore=false
	 */
	@RequestMapping(value = "StartFinal", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public CommandEntity StartFinal(String mtid, HttpServletRequest request) {
		CommandEntity result = new CommandEntity();
		result.setCommand("StartFinal");
		result.setCommandTitle("开始终评");
		result.setStatus(HttpStatus.SC_INTERNAL_SERVER_ERROR);
		result.setCode(Mars.FAIL);
		try {
			if (mtid == null || mtid.length() == 0) {
				log.error("参数为空");
				throw new MarsException("开始终评失败");
			}
			String mtstate = pgymatchService.queryStateById(mtid);
			Integer state = Integer.valueOf(mtstate);
			if (state < 4) {
				log.error("比赛状态为 " + state);
				throw new MarsException("开始终评失败,结束初评后才可以开始终评!");
			}
			if (state >= 5) {
				log.error("开始终评已被其他管理人员处理,比赛状态为 " + state);
				throw new MarsException("开始终评失败");
			}

			Integer num = pgymatchService.updateCompetition(mtid, "5");
			if (num > 0) {
				result.setStatus(HttpStatus.SC_OK);
				result.setCode(Mars.SUCCESS);
				result.setMessage("开始终评成功");
			} else {
				result.setMessage("开始终评失败");
			}

		} catch (MarsException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
			result.setMessage(e.getMessage());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			log.error(e.getMessage());
			result.setMessage("开始终评失败");
		}
		return result;
	}

	/**
	 * 终评页签信息
	 * 
	 * @param mtid
	 *            比赛ID
	 * @param request
	 * @return
	 * 
	 * @apiExample http://localhost:8080/artron-photography/pgymatch/getFinal?format=json&ignore=false&mtid=
	 */
	@RequestMapping(value = "getFinal", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public ResultEntity<Map<String, Object>> QueryFinalComment(String mtid, HttpServletRequest request) {
		ResultEntity<Map<String, Object>> result = new ResultEntity<Map<String, Object>>();
		result.setCommand("QueryFinalComment");
		result.setCommandTitle("终评页签信息");
		result.setStatus(HttpStatus.SC_INTERNAL_SERVER_ERROR);
		result.setCode(Mars.FAIL);
		try {
			if (mtid == null || mtid.length() == 0) {
				log.error("查询失败,参数为空");
				throw new MarsException("查询失败,参数为空");
			}
			Integer zgjs = 0;
			Integer dpsgjs = 0;
			Integer wtggjs = 0;
			Integer tggjs = 0;

			Integer pfzpzgjs = 0;
			Integer pfzpdpfgjs = 0;
			Integer pfzpypfgjs = 0;

			Map<String, Object> map = new HashMap<>();
			String mtstatus = pgymatchService.queryStateById(mtid);
			Integer mtstate = Integer.valueOf(mtstatus);
			Pgymanuscript mst = new Pgymanuscript();
			mst.setMtId(mtid);
			mst.setMststate1(1);
			List<Pgymanuscript> mstlist = pgymanuscriptService.queryAll(mst);
			// 0:总稿件数,1:待评审数,2:未通过数,3:通过数
			if (mstlist != null && mstlist.size() > 0) {
				zgjs = mstlist.size();
				dpsgjs = mstlist.stream().filter(s -> s.getMststate2() == 0).collect(Collectors.toList()).size();
				wtggjs = mstlist.stream().filter(s -> s.getMststate2() == 2).collect(Collectors.toList()).size();
				List<Pgymanuscript> okList = mstlist.stream().filter(s -> s.getMststate2() == 1)
						.collect(Collectors.toList());
				tggjs = okList.size();
				if (mtstate >= 7)// 评分终评/评分终评之后
				{
					// 评分终评-总稿件数,待评分稿件数,已评分稿件数
					pfzpzgjs = tggjs;
					pfzpdpfgjs = okList.stream().filter(s -> s.getVotes() == 0).collect(Collectors.toList()).size();
					pfzpypfgjs = okList.stream().filter(s -> s.getVotes() > 0).collect(Collectors.toList()).size();
				}
			}
			map.put("mtstatus", mtstatus);
			map.put("zgjs", zgjs);
			map.put("dpsgjs", dpsgjs);
			map.put("wtggjs", wtggjs);
			map.put("tggjs", tggjs);

			map.put("pfzpzgjs", pfzpzgjs);
			map.put("pfzpdpfgjs", pfzpdpfgjs);
			map.put("pfzpypfgjs", pfzpypfgjs);

			result.setData(map);
			result.setStatus(HttpStatus.SC_OK);
			result.setCode(Mars.SUCCESS);
		} catch (MarsException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
			result.setMessage(e.getMessage());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			log.error(e.getMessage());
			result.setMessage("查询失败");
		}
		return result;
	}
	
	/**
	 * 取未评分稿件数
	 * 
	 * @param mtid
	 *            比赛ID
	 * @param request
	 * @return
	 * 
	 * @apiExample http://localhost:8080/artron-photography/pgymatch/open/NoScoreCount?format=json&ignore=false&mtid=
	 */
	@RequestMapping(value = "/open/NoScoreCount", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public ResultEntity<Integer> queryNoScoreCountByMtid(String mtid, HttpServletRequest request) {
		ResultEntity<Integer> result = new ResultEntity<Integer>();
		result.setCommand("NoScoreCount");
		result.setCommandTitle("取未评分稿件数");
		result.setStatus(HttpStatus.SC_INTERNAL_SERVER_ERROR);
		result.setCode(Mars.FAIL);
		try {
			if (mtid == null || mtid.length() == 0) {
				log.error("参数为空");
				throw new MarsException("查询失败,参数为空");
			}
			Integer wpfgjs = pgymanuscriptService.queryNoScoreCountByMtid(mtid);
			result.setData(wpfgjs);
			result.setStatus(HttpStatus.SC_OK);
			result.setCode(Mars.SUCCESS);
		} catch (MarsException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
			result.setMessage(e.getMessage());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			log.error(e.getMessage());
			result.setMessage("查询失败失败");
		}
		return result;
	}
	
	

}
