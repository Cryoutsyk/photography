package net.artron.cms.pgymtassignjudgeinfo.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import org.springframework.ui.Model;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.text.StringEscapeUtils;
import org.apache.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.mars.Entity;
import net.mars.PageModel;
import net.mars.common.Mars;
import net.mars.common.spring.SpringContextHolder;
import net.mars.common.util.DateUtil;
import net.mars.common.util.JacksonUtil;
import net.mars.common.util.LocaleUtil;
import net.mars.boot.web.mvc.parameter.ParameterAttribute;
import net.mars.core.command.CommandEntity;
import net.mars.core.command.ServiceCommand;
import net.mars.core.controller.ApplicationController;
import net.mars.exception.MarsException;
import net.artron.cms.pgymanuscript.model.ChannelStatistics;
import net.artron.cms.pgymanuscript.model.Pgymanuscript;
import net.artron.cms.pgymanuscript.service.PgymanuscriptService;
import net.artron.cms.pgymatch.model.Pgymatch;
import net.artron.cms.pgymtassignjudge.model.Pgycheckrater;
import net.artron.cms.pgymtassignjudge.model.Pgymtassignjudge;
import net.artron.cms.pgymtassignjudge.service.PgymtassignjudgeService;
import net.artron.cms.pgymtassignjudgeinfo.model.Pgymtassignjudgeinfo;
import net.artron.cms.pgymtassignjudgeinfo.service.PgymtassignjudgeinfoService;
import net.artron.cms.pgymtawards.model.Pgymtawards;
import net.artron.cms.pgymtgroup.model.Pgymtgroup;
import net.artron.cms.pgymtmstjde.model.Pgymtmstjde;
import net.artron.cms.pgymtmstjde.service.PgymtmstjdeService;
import net.artron.cms.pgymttext.model.Pgymttext;
import net.artron.cms.util.DateUtils;
import net.artron.cms.util.FastjsonUtil;
import net.artron.cms.util.HuidUtils;
import net.artron.cms.util.ResultEntity;
import net.artron.cms.util.StringUtils;
import net.artron.cms.util.ValidationUtils;
import lombok.extern.slf4j.Slf4j;

/**
 * PgymtassignjudgeinfoController. 基类 ApplicationController 中已经定义了一些常用方法 1、页面跳转
 * {pagePath}/toPage 2、跳转到详细页面 {pagePath}/toDetail 3、查询全部数据 queryAll 4、分页查询数据
 * queryByPage 5、增删改等操作 {operator}/command
 * 
 * @author
 */
@Slf4j
@Controller
@RequestMapping("/pgymtassignjudgeinfo")
public class PgymtassignjudgeinfoController extends ApplicationController<Pgymtassignjudgeinfo> {
	/**
	 * 注入Service类对象.
	 */
	@Resource(name = "pgymtassignjudgeinfoService")
	PgymtassignjudgeinfoService pgymtassignjudgeinfoService;

	/**
	 * 注入Service类对象.
	 */
	@Resource(name = "pgymtassignjudgeService")
	PgymtassignjudgeService pgymtassignjudgeService;

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

	@RequestMapping("toIndex")
	public String to_index(HttpServletRequest request, Model model) {
		return "pgymtassignjudgeinfo/index";
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
	 * @api {GET} /pgymtassignjudgeinfo/query 查询地址所有数据
	 * @apiVersion 1.0.0
	 * @apiName query
	 * @apiGroup Pgymtassignjudgeinfo
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
	 * @apiParam {Integer} assigntype 分配方式,0按数量均分,1评审全部作品
	 * @apiParam {java.util.Date} endtime 截止时间,
	 * @apiParam {Integer} totalworks 初审作品总数,
	 * @apiParam {Integer} checkedjudge 已选评委数,
	 * @apiParam {Integer} averagework 每人评审作品数,
	 * @apiParam {String} note 备注,
	 * 
	 * @apiExample 调用示例: curl -i
	 *             http://localhost:8080/mars-core/pgymtassignjudgeinfo/query?format=json&ignore=true&version=v1
	 * 
	 * @apiSuccess {String} dbId 数据主键
	 * @apiSuccess {String} updatedBy 编辑人
	 * @apiSuccess {String} updatedDt 编辑时间
	 * @apiSuccess {Integer} tabindex 排序
	 * @apiSuccess {String} mtId 比赛ID,
	 * @apiSuccess {Integer} assigntype 分配方式,0按数量均分,1评审全部作品
	 * @apiSuccess {java.util.Date} endtime 截止时间,
	 * @apiSuccess {Integer} totalworks 初审作品总数,
	 * @apiSuccess {Integer} checkedjudge 已选评委数,
	 * @apiSuccess {Integer} averagework 每人评审作品数,
	 * @apiSuccess {String} note 备注,
	 * 
	 * @apiError NoAccessRight 只有授权用户才能访问此地址.
	 * @apiError NoParamFormat 没有设置参数format=json.
	 * @apiErrorExample Response (example): HTTP/1.1 Status 406 { "error":
	 *                  "NoParamFormat" }
	 * 
	 * @apiSampleRequest http://localhost:8080/mars-core/pgymtassignjudgeinfo/query?format=json&ignore=true&version=v1
	 * 
	 */
	@Override
	public List<? extends Entity> queryAll(HttpServletRequest request,
			@ParameterAttribute(value = "") Pgymtassignjudgeinfo entity) {
		return super.queryAll(request, entity);
	}

	/**
	 * 分页查询数据.
	 * 
	 * @param request
	 * @param pageModel
	 * @return
	 * 
	 * @api {GET} /pgymtassignjudgeinfo/page 分页查询数据
	 * @apiVersion 1.0.0
	 * @apiName page
	 * @apiGroup Pgymtassignjudgeinfo
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
	 *             http://localhost:8080/mars-core/pgymtassignjudgeinfo/page?format=json&ignore=true&version=v1&pageNum=2&pageSize=20
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
	 * @apiSampleRequest http://localhost:8080/mars-core/pgymtassignjudgeinfo/page?format=json&ignore=true&version=v1&pageNum=2&pageSize=20
	 * 
	 */
	@Override
	public PageModel<? extends Entity> queryByPage(HttpServletRequest request,
			@ParameterAttribute(value = "pageModel") PageModel<? extends Entity> pageModel) {
		return super.queryByPage(request, pageModel);
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
	 * @apiGroup Pgymtassignjudgeinfo
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
	 * @apiParam {Integer} assigntype 分配方式,0按数量均分,1评审全部作品
	 * @apiParam {java.util.Date} endtime 截止时间,
	 * @apiParam {Integer} totalworks 初审作品总数,
	 * @apiParam {Integer} checkedjudge 已选评委数,
	 * @apiParam {Integer} averagework 每人评审作品数,
	 * @apiParam {String} note 备注,
	 * 
	 * @apiExample 调用示例: curl -d "code=11&name=abc" -i
	 *             http://localhost:8080/mars-core/pgymtassignjudgeinfo/add/command?format=json&ignore=true&version=v1
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
	public CommandEntity doCommand(@ParameterAttribute(value = "") Pgymtassignjudgeinfo entity,
			HttpServletRequest request, @PathVariable String operator) {
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
	 * 查询分配评委信息
	 * 
	 * @param mtid
	 *            比赛ID
	 * @param huid
	 *            主办方ID
	 * @param request
	 * @return
	 * 
	 * @apiExample http://localhost:8080/artron-photography/pgymtassignjudgeinfo/getAssignjudgeinfo?format=json&ignore=false&mtid=&huid=
	 */
	@RequestMapping(value = "getAssignjudgeinfo", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public ResultEntity<Pgymtassignjudgeinfo> getAssignjudgeinfo(String mtid,  HttpServletRequest request) {
		ResultEntity<Pgymtassignjudgeinfo> result = new ResultEntity<Pgymtassignjudgeinfo>();
		result.setCommand("getAssignjudgeinfo");
		result.setCommandTitle("分配评委信息");
		result.setStatus(HttpStatus.SC_INTERNAL_SERVER_ERROR);
		result.setCode(Mars.FAIL);
		try {
			if (mtid == null || mtid.length() == 0) {
				log.error("参数为空");
				throw new MarsException("查询失败");
			}
			Pgymtassignjudgeinfo info = pgymtassignjudgeinfoService.queryByMtId(mtid);
			if (info == null)
				info = new Pgymtassignjudgeinfo();
			if(info.getTotalworks()==null || info.getTotalworks()==0)
			{
				info.setTotalworks(pgymanuscriptService.queryMstCountByMtid(mtid));
			}
			String huid=HuidUtils.getHuid(request);
			if(huid==null || huid.length()==0)
			{
				log.error("主办方ID为空");
			}
			List<Pgycheckrater> pgycheckrater = pgymtassignjudgeService.queryCheckrater(mtid, huid);
			
			for (Pgycheckrater pcr : pgycheckrater) {
				if(pcr.getImg_url()==null || pcr.getImg_url().length()==0)
					pcr.setImg_url("http://dpic.tiankong.com/9n/ee/QJ6734834164.jpg?x-oss-process=style/670w");
			}
			
			
			info.setPgycheckrater(pgycheckrater);
			result.setData(info);
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
	 * 分配评委
	 * 
	 * @param CommandModel
	 * @param request
	 * 
	 * @return CommandEntity
	 * 
	 * @apiExample http://localhost:8080/artron-photography/pgymtassignjudgeinfo/addassignjudgeinfo?format=json&ignore=false
	 * 
	 */
	@RequestMapping(value = "/addassignjudgeinfo", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public CommandEntity addassignjudgeinfo(@ParameterAttribute(value = "") Pgymtassignjudgeinfo entity,
			HttpServletRequest request) {
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
				throw new MarsException("保存失败.");
			}
			ValidationUtils.validObject(entity);//
			// System.out.println(JacksonUtil.doJackson(entity));
			log.info(entity.getCheckrater());
			String CheckraterIds = StringEscapeUtils.unescapeHtml4(entity.getCheckrater());
			log.info(CheckraterIds);
			String[] ids = JacksonUtil.convertJson2Bean(CheckraterIds, String[].class); // CheckraterIds.split(",");

			if (ids == null || ids.length == 0) {
				throw new MarsException("选中评委不能为空");
			}

			if (ids.length > 10) {
				throw new MarsException("最多只能选择十名评委.");
			}

			if (!StringUtils.isInt(entity.getEtime())) {
				throw new MarsException("截止时间错误.");
			}

			entity.setEndtime(DateUtils.transferLongToDate(Long.valueOf(entity.getEtime())));

			if (entity.getTotalworks() == null)
				entity.setTotalworks(0);
			if (entity.getCheckedjudge() == null)
				entity.setCheckedjudge(0);
			if (entity.getAveragework() == null)
				entity.setAveragework(0);

			String mtdbid = entity.getMtId();
			Pgymanuscript mst = new Pgymanuscript();
			mst.setMtId(mtdbid);
			List<Pgymanuscript> pgymanuscript = pgymanuscriptService.queryAll(mst);
			if (pgymanuscript == null || pgymanuscript.size() == 0) {
				log.error("失败，稿件数为0.");
				throw new MarsException("保存失败.");
			}

			CommandEntity mtAddEntity = super.doExecuteCommand(request, operator, entity);
			if (mtAddEntity.getStatus().equals(HttpStatus.SC_OK) && mtAddEntity.getCode().equals(Mars.SUCCESS)) {
				// 继续后面的添加
				if (mtdbid == null || mtdbid.length() == 0) {
					log.error("比赛ID为空");
					throw new MarsException("保存失败.");
				}
				for (String id : ids) {
					Pgymtassignjudge judge = new Pgymtassignjudge();
					judge.setMtId(mtdbid);
					judge.setJdeId(id);
					judge.setReviewstate(0);
					String commandBeanId = judge.getClass().getSimpleName() + "." + operator;
					log.info("{} Find Command bean : {} ", Mars.LOG_PRE, commandBeanId);
					ServiceCommand<Pgymtassignjudge, String> command = SpringContextHolder.getBean(commandBeanId);
					pgymtassignjudgeService.save(judge, command);
				}

				List<Pgymtmstjde> list = new ArrayList<Pgymtmstjde>();
				// entity.getAssigntype()//ASSIGNTYPE //0按数量均分,1评审全部作品
				if (entity.getAssigntype() == 0) {
					int pws = ids.length;// 评委数
					int gjs = pgymanuscript.size();// 稿件数
					int pjs = gjs / pws;// 平均数
					int yushu = gjs % pws;// 余数

					for (int i = 0; i < pws; i++) {
						List<Pgymanuscript> tmp = pgymanuscript.subList(i * pjs, pjs * (i + 1));
						for (Pgymanuscript pgymst : tmp) {
							Pgymtmstjde mtmstjde = new Pgymtmstjde();
							mtmstjde.setMtId(mtdbid);
							mtmstjde.setMstId(pgymst.getDbId());
							mtmstjde.setJdeId(ids[i]);
							mtmstjde.setVersion(0);
							mtmstjde.setTabIndex(0);
							mtmstjde.setAuditstate(0);
							mtmstjde.setDbId(StringUtils.getUUID32());
							list.add(mtmstjde);
						}
					}
					if (yushu > 0) {
						List<Pgymanuscript> tmp = pgymanuscript.subList(pws * pjs, gjs);
						for (int i = 0; i < tmp.size(); i++) {
							Pgymtmstjde mtmstjde = new Pgymtmstjde();
							mtmstjde.setMtId(mtdbid);
							mtmstjde.setMstId(tmp.get(i).getDbId());
							mtmstjde.setJdeId(ids[i]);
							mtmstjde.setVersion(0);
							mtmstjde.setTabIndex(0);
							mtmstjde.setAuditstate(0);
							mtmstjde.setDbId(StringUtils.getUUID32());
							list.add(mtmstjde);
						}
					}
				} else if (entity.getAssigntype() == 1) {
					for (String id : ids) {
						for (Pgymanuscript manuscript : pgymanuscript) {
							Pgymtmstjde mtmstjde = new Pgymtmstjde();
							mtmstjde.setMtId(mtdbid);
							mtmstjde.setMstId(manuscript.getDbId());
							mtmstjde.setJdeId(id);
							mtmstjde.setVersion(0);
							mtmstjde.setTabIndex(0);
							mtmstjde.setAuditstate(0);
							mtmstjde.setDbId(StringUtils.getUUID32());
							list.add(mtmstjde);
						}
					}
				}
				pgymtmstjdeService.batchInsert(list);
				result.setStatus(HttpStatus.SC_OK);
				result.setCode(Mars.SUCCESS);
				// System.out.println(JacksonUtil.doJackson(result));
			} else {
				result.setStatus(mtAddEntity.getStatus());
				result.setCode(mtAddEntity.getCode());
				result.setMessage(mtAddEntity.getMessage());
			}
		} catch (IllegalArgumentException e) {
			// TODO: handle exception
			e.printStackTrace();
			result.setMessage("保存失败.");
		} catch (MarsException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result.setMessage(e.getMessage());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			result.setMessage("保存失败.");
		}
		return result;
	}
}
