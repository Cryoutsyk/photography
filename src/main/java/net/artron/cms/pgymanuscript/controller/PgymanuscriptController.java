package net.artron.cms.pgymanuscript.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.text.StringEscapeUtils;
import org.apache.http.HttpStatus;
import org.apache.poi.poifs.filesystem.OfficeXmlFileException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.common.collect.Maps;

import lombok.extern.slf4j.Slf4j;
import net.artron.cms.pgymanuscript.model.Pgymanuscript;
import net.artron.cms.pgymanuscript.model.options;
import net.artron.cms.pgymanuscript.service.PgymanuscriptService;
import net.artron.cms.pgymatch.model.CommandModel;
import net.artron.cms.pgymatch.model.Pgymatch;
import net.artron.cms.pgymatch.service.PgymatchService;
import net.artron.cms.pgymstphoto.model.Pgymstphoto;
import net.artron.cms.pgymstphoto.service.PgymstphotoService;
import net.artron.cms.pgymstscore.model.Pgymstscore;
import net.artron.cms.pgymstscore.service.PgymstscoreService;
import net.artron.cms.pgymtawards.model.Pgymtawards;
import net.artron.cms.pgymtawards.service.PgymtawardsService;
import net.artron.cms.pgymtgroup.model.Pgymtgroup;
import net.artron.cms.pgymtgroup.service.PgymtgroupService;
import net.artron.cms.pgymtmstjde.model.PageModelHelper;
import net.artron.cms.pgymtmstjde.model.PendingCount;
import net.artron.cms.pgymttext.model.Pgymttext;
import net.artron.cms.pgyuser.util.CommandResultUtil;
import net.artron.cms.util.EnumRole;
import net.artron.cms.util.FastjsonUtil;
import net.artron.cms.util.ImportExcelUtil;
import net.artron.cms.util.ResultEntity;
import net.artron.cms.util.ResultPageModel;
import net.artron.cms.util.ValidationUtils;
import net.mars.Entity;
import net.mars.PageModel;
import net.mars.boot.web.mvc.parameter.ParameterAttribute;
import net.mars.common.Mars;
import net.mars.common.cmd.CmdException;
import net.mars.common.cmd.Command;
import net.mars.common.spring.SpringContextHolder;
import net.mars.common.util.JacksonUtil;
import net.mars.common.util.LocaleUtil;
import net.mars.core.command.CommandEntity;
import net.mars.core.command.ServiceCommand;
import net.mars.core.controller.ApplicationController;
import net.mars.exception.MarsException;

/**
 * PgymanuscriptController. 基类 ApplicationController 中已经定义了一些常用方法 1、页面跳转
 * {pagePath}/toPage 2、跳转到详细页面 {pagePath}/toDetail 3、查询全部数据 queryAll 4、分页查询数据
 * queryByPage 5、增删改等操作 {operator}/command
 * 
 * @author
 */
@Slf4j
@Controller
@RequestMapping("/pgymanuscript")
public class PgymanuscriptController extends ApplicationController<Pgymanuscript> {
	/**
	 * 注入Service类对象.
	 */
	@Resource(name = "pgymanuscriptService")
	PgymanuscriptService pgymanuscriptService;

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
	@Resource(name = "pgymatchService")
	PgymatchService pgymatchService;

	/**
	 * 注入Service类对象.
	 */
	@Resource(name = "pgymstphotoService")
	PgymstphotoService pgymstphotoService;
	
	/**
	 * 注入Service类对象.
	 */
	@Resource(name = "pgymstscoreService")
	PgymstscoreService pgymstscoreService;

	@RequestMapping("toIndex")
	public String to_index(HttpServletRequest request, Model model) {
		return "pgymanuscript/index";
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
	 * @api {GET} /pgymanuscript/query 查询地址所有数据
	 * @apiVersion 1.0.0
	 * @apiName query
	 * @apiGroup Pgymanuscript
	 * @apiDescription 查询所有数据
	 * @apiPermission 无
	 * 
	 * @apiParam {String} version=v1 版本号
	 * @apiParam {Boolean} format=json 返回数据格式
	 * @apiParam {Boolean} ignore=true 是否需要验证访问权限
	 * @apiParam {String} updatedBy 编辑人
	 * @apiParam {String} updatedDt 编辑时间
	 * @apiParam {Integer} tabindex 排序
	 * @apiParam {String} code 序号,比赛序号+000001,从1开始递增,6位不够补0 例如： 20180829002309000001
	 * @apiParam {String} mtId 比赛ID,
	 * @apiParam {String} name 作品题目,最多二十字
	 * @apiParam {String} author 作者,最多十个字
	 * @apiParam {String} details 作品简介,最多一百字
	 * @apiParam {String} mtGpId 参赛组ID,
	 * @apiParam {Integer} msttype 单张、组照,0单张,1组照
	 * @apiParam {Integer} channel 渠道,0当前渠道,1上传
	 * @apiParam {String} userId 前端用户id,前端账号ID
	 * @apiParam {Integer} mststate1 稿件状态-初评,默认0待审核,1通过,2不通过；初评结果
	 * @apiParam {Integer} mststate2 稿件状态-初步终评,默认0待审核,1通过,2不通过；初步中评结果
	 * @apiParam {Double} votes 得分数,保留两位小数
	 * 
	 * @apiExample 调用示例: curl -i
	 *             http://localhost:8080/mars-core/pgymanuscript/query?format=json&ignore=true&version=v1
	 * 
	 * @apiSuccess {String} dbId 数据主键
	 * @apiSuccess {String} updatedBy 编辑人
	 * @apiSuccess {String} updatedDt 编辑时间
	 * @apiSuccess {Integer} tabindex 排序
	 * @apiSuccess {String} code 序号,比赛序号+000001,从1开始递增,6位不够补0 例如：
	 *             20180829002309000001
	 * @apiSuccess {String} mtId 比赛ID,
	 * @apiSuccess {String} name 作品题目,最多二十字
	 * @apiSuccess {String} author 作者,最多十个字
	 * @apiSuccess {String} details 作品简介,最多一百字
	 * @apiSuccess {String} mtGpId 参赛组ID,
	 * @apiSuccess {Integer} msttype 单张、组照,0单张,1组照
	 * @apiSuccess {Integer} channel 渠道,0当前渠道,1上传
	 * @apiSuccess {String} userId 前端用户id,前端账号ID
	 * @apiSuccess {Integer} mststate1 稿件状态-初评,默认0待审核,1通过,2不通过；初评结果
	 * @apiSuccess {Integer} mststate2 稿件状态-初步终评,默认0待审核,1通过,2不通过；初步中评结果
	 * @apiSuccess {Double} votes 得分数,保留两位小数
	 * 
	 * @apiError NoAccessRight 只有授权用户才能访问此地址.
	 * @apiError NoParamFormat 没有设置参数format=json.
	 * @apiErrorExample Response (example): HTTP/1.1 Status 406 { "error":
	 *                  "NoParamFormat" }
	 * 
	 * @apiSampleRequest http://localhost:8080/mars-core/pgymanuscript/query?format=json&ignore=true&version=v1
	 * 
	 */
	@Override
	public List<? extends Entity> queryAll(HttpServletRequest request,
			@ParameterAttribute(value = "") Pgymanuscript entity) {
		return super.queryAll(request, entity);
	}

	/**
	 * 分页查询数据.
	 * 
	 * @param request
	 * @param pageModel
	 * @return
	 * 
	 * @api {GET} /pgymanuscript/page 分页查询数据
	 * @apiVersion 1.0.0
	 * @apiName page
	 * @apiGroup Pgymanuscript
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
	 *             http://localhost:8080/mars-core/pgymanuscript/page?format=json&ignore=true&version=v1&pageNum=2&pageSize=20
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
	 * @apiSampleRequest http://localhost:8080/mars-core/pgymanuscript/page?format=json&ignore=true&version=v1&pageNum=2&pageSize=20
	 * @apiSampleRequest http://localhost:8080/artron-photography/pgymanuscript/page?format=json&ignore=false&pageNum=1&pageSize=20&name=test&msttype=0&mtGpId=1040422180208246784&channel=0&adid=1040506090543906816
	 *                   name:作品题目/作者 msttype:0单张/1组照 mtGpId:组id
	 *                   channel:0当前渠道(前端)/1上传(后台) adid:奖项id
	 * 
	 */
	@SuppressWarnings("unchecked")
	@Override
	public ResultPageModel<Pgymanuscript> queryByPage(HttpServletRequest request,
			@ParameterAttribute(value = "pageModel") PageModel<? extends Entity> pageModel) {
		Pgymanuscript ent = (Pgymanuscript) pageModel.getQueryParam();
		String role = new CommandResultUtil().getCharacter(request);
		if (role.equals(EnumRole.rater.toString())) {
			return null;
		}
		if (role.equals(EnumRole.admin.toString())) {
			ent.setMtId(null);// 超级管理员查看全部
		}
		// if(role.equals(EnumRole.hostunit.toString()))//主办方登录不加处理

		PageModel<? extends Entity> page = super.queryByPage(request, pageModel);

		String mtstatus = "";
		try {
			mtstatus = pgymatchService.queryStateById(ent.getMtId());
		} catch (MarsException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ResultPageModel<Pgymanuscript> result = new ResultPageModel<Pgymanuscript>();
		result.setQueryParam(null);
		result.setMtstatus(mtstatus);
		result.setOrder(page.getOrder());
		result.setPageNum(page.getPageNum());
		result.setPageSize(page.getPageSize());
		result.setRows(page.getRows());
		result.setSortField(page.getSortField());
		result.setTotal(page.getTotal());
		result.setTotalPage(page.getTotalPage());
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
	 * @apiGroup Pgymanuscript
	 * @apiDescription 增删改查等操作
	 * @apiPermission 无
	 * 
	 * @apiParam {String} version=v1 版本, 指定值 : v1
	 * @apiParam {Boolean} format=json 返回数据格式, 默认值 : json
	 * @apiParam {Boolean} ignore=true 是否需要验证访问权限, 默认值 : true
	 * @apiParam {String} updatedBy 编辑人
	 * @apiParam {String} updatedDt 编辑时间
	 * @apiParam {Integer} tabindex 排序
	 * @apiParam {String} code 序号,比赛序号+000001,从1开始递增,6位不够补0 例如： 20180829002309000001
	 * @apiParam {String} mtId 比赛ID,
	 * @apiParam {String} name 作品题目,最多二十字
	 * @apiParam {String} author 作者,最多十个字
	 * @apiParam {String} details 作品简介,最多一百字
	 * @apiParam {String} mtGpId 参赛组ID,
	 * @apiParam {Integer} msttype 单张、组照,0单张,1组照
	 * @apiParam {Integer} channel 渠道,0当前渠道,1上传
	 * @apiParam {String} userId 前端用户id,前端账号ID
	 * @apiParam {Integer} mststate1 稿件状态-初评,默认0待审核,1通过,2不通过；初评结果
	 * @apiParam {Integer} mststate2 稿件状态-初步终评,默认0待审核,1通过,2不通过；初步中评结果
	 * @apiParam {Double} votes 得分数,保留两位小数
	 * 
	 * @apiExample 调用示例: curl -d "code=11&name=abc" -i
	 *             http://localhost:8080/mars-core/pgymanuscript/add/command?format=json&ignore=true&version=v1
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
	public CommandEntity doCommand(@ParameterAttribute(value = "") Pgymanuscript entity, HttpServletRequest request,
			@PathVariable String operator) {
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
		if (cmdCode.equals("add")) {
			System.out.println("afterCommand:" + entity.getDbId());
			result.setExtraCode(entity.getDbId());
		}
	}

	/**
	 * 上传excel
	 * 
	 * @apiExample http://localhost:8080/artron-photography/pgymanuscript/uploadxls?format=json&ignore=false
	 */
	@PostMapping("/uploadxls")
	@ResponseBody
	public ResultEntity<Pgymstphoto> mstuploadimg(@RequestParam("file") MultipartFile file, String mtid,
			HttpServletRequest request) {
		ResultEntity<Pgymstphoto> result = new ResultEntity<Pgymstphoto>();
		result.setCommand("UpLoad");
		result.setCommandTitle("上传excel");
		result.setStatus(HttpStatus.SC_INTERNAL_SERVER_ERROR);
		result.setCode(Mars.FAIL);
		try {
			if (file.isEmpty()) {
				throw new MarsException("文件不能为空.");
			}
			String oldname = file.getOriginalFilename();// 原名
			// 获得文件类型（可以判断如果不是图片，禁止上传）
			String contentType = file.getContentType();
			System.out.println("oldname:" + oldname);
			System.out.println(oldname + ",contentType:" + contentType);
			// System.out.println(contentType.substring(0, contentType.indexOf("/")));
			// if(contentType.equals("image/jpeg"))
			if (!"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet".equals(contentType)
					&& !"application/vnd.ms-excel".equals(contentType)) {
				throw new MarsException("Excel格式错误.");
			}
			// file.getSize();//5*1048576 5M
			if (file.getSize() > 10 * 1048576) {// 限制10M
				throw new MarsException("上传失败，请上传小于10M文件.");
			}
			Map<String, String> m = new HashMap<String, String>();
			m.put("照片文件名", "ptname");
			m.put("作者", "author");
			m.put("参赛组", "gpname");
			m.put("作品题目", "name");
			m.put("作品简介", "details");
			List<Map<String, Object>> ls = ImportExcelUtil.parseExcel(file.getInputStream(), oldname, m);
			for (Map<String, Object> map : ls) {
				System.out.println(map.get("ptname") + "," + map.get("author") + "," + map.get("gpname") + ","
						+ map.get("name") + "," + map.get("details"));
			}

			/*
			 * 保存文件 // 生成uuid作为文件名称 String uuid =
			 * UUID.randomUUID().toString().replaceAll("-", "");
			 * 
			 * String path = File.separator + "photography" + File.separator + "mst" +
			 * File.separator + mtid+File.separator+"excel"+File.separator;
			 * 
			 * 
			 * // 定义文件保存的本地路径 String localPath = PathUtil.GetPathPrefix() + path;
			 * System.out.println(localPath); boolean cDirecotry =
			 * FileUtil.createDirecotry(localPath); System.out.println("创建目录:" +
			 * cDirecotry);
			 * 
			 * // 获得文件后缀名 String suffixName = oldname.substring(oldname.lastIndexOf(".") +
			 * 1); // 得到 文件名 String saveFileName = uuid + "." + suffixName;
			 * System.out.println(saveFileName); // FileUtil.chmod(localPath); String
			 * fullname=localPath + saveFileName; System.out.println(fullname);
			 * 
			 * 
			 * File saveFile = new File(fullname); if (!saveFile.getParentFile().exists()) {
			 * saveFile.getParentFile().mkdirs(); }
			 * 
			 * BufferedOutputStream out = new BufferedOutputStream(new
			 * FileOutputStream(saveFile)); out.write(file.getBytes()); out.flush();
			 * out.close();
			 */

			//// CommandEntity commandEntity= super.doCommand(pt, request, "add");
			//// result.setStatus(commandEntity.getStatus());
			//// result.setCode(commandEntity.getCode());
			//// result.setMessage(commandEntity.getMessage());
			result.setStatus(HttpStatus.SC_OK);
			result.setCode(Mars.SUCCESS);
			// result.setMessage("http://localhost:8080/artron-photography"+sqlPath);

		} catch (FileNotFoundException e) {
			e.printStackTrace();
			result.setMessage("上传失败");
		} catch (IOException e) {
			e.printStackTrace();
			result.setMessage("上传失败");
		} catch (MarsException e) {
			e.printStackTrace();
			result.setMessage(e.getMessage());
		} catch (OfficeXmlFileException e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("excel后缀修改后读取数据失败");
			result.setMessage("上传失败,excel错误");
		} catch (Exception e) {
			e.printStackTrace();
			result.setMessage("上传失败");
		}
		return result;
	}

	/**
	 * 稿件查询下拉框信息
	 * 
	 * @param mtid
	 * @param request
	 * @return
	 * 
	 * @apiExample http://localhost:8080/artron-photography/pgymanuscript/open/getselectinfo?format=json&ignore=false&mtid=dsa
	 * 
	 */
	@RequestMapping(value = "open/getselectinfo", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public ResultEntity<Map<String, List<options>>> GetSelectInfo(String mtid, HttpServletRequest request) {
		ResultEntity<Map<String, List<options>>> result = new ResultEntity<Map<String, List<options>>>();
		result.setCommand("GetSelectInfo");
		result.setCommandTitle("获取下拉框信息");
		result.setStatus(HttpStatus.SC_INTERNAL_SERVER_ERROR);
		result.setCode(Mars.FAIL);
		try {

			Map<String, List<options>> commandModel = new HashMap<String, List<options>>();
			List<options> gp = new ArrayList<options>();
			List<Pgymtgroup> mtgroup = pgymtgroupService.queryByMtId(mtid);
			if (mtgroup != null && mtgroup.size() > 0) {
				for (Pgymtgroup pgymtgroup : mtgroup) {
					options options = new options();
					options.setKey(pgymtgroup.getDbId());
					options.setValue(pgymtgroup.getName());
					gp.add(options);
				}
			}
			commandModel.put("gp", gp);

			List<options> ad = new ArrayList<options>();
			List<Pgymtawards> mtawards = pgymtawardsService.queryByMtId(mtid);
			if (mtawards != null && mtawards.size() > 0) {
				for (Pgymtawards pgymtawards : mtawards) {
					options options = new options();
					options.setKey(pgymtawards.getDbId());
					options.setValue(pgymtawards.getName());
					ad.add(options);
				}
			}
			commandModel.put("ad", ad);

			result.setData(commandModel);
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
	 * 删除稿件和照片
	 * 
	 * @param CommandModel
	 * @param request
	 * 
	 * @return CommandEntity
	 *         http://localhost:8080/artron-photography/pgymanuscript/mstdel?format=json&ignore=false&dbId=1049140440671977472
	 */
	@RequestMapping(value = "/mstdel", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public CommandEntity mstDel(@ParameterAttribute(value = "") Pgymanuscript entity, HttpServletRequest request) {

		String operator = "delete";
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
				throw new MarsException("删除失败.");
			}
			if (entity.getDbId() == null || entity.getDbId().length() == 0) {
				log.error("失败，主键ID为空.");
				throw new MarsException("删除失败,参数为空.");
			}

			CommandEntity mtAddEntity = super.doExecuteCommand(request, operator, entity);
			if (mtAddEntity.getStatus().equals(HttpStatus.SC_OK) && mtAddEntity.getCode().equals(Mars.SUCCESS)) {

				Pgymstphoto delphoto = new Pgymstphoto();
				delphoto.setMstId(entity.getDbId());
				List<Pgymstphoto> photo = pgymstphotoService.queryAll(delphoto);// 照片列表

				for (Pgymstphoto ads : photo) {
					pgymstphotoService.delete(ads);
				}

				result.setStatus(HttpStatus.SC_OK);
				result.setCode(Mars.SUCCESS);
			} else {
				result.setStatus(mtAddEntity.getStatus());
				result.setCode(mtAddEntity.getCode());
				result.setMessage(mtAddEntity.getMessage());
			}
		} catch (IllegalArgumentException e) {
			// TODO: handle exception
			e.printStackTrace();
			result.setMessage("删除失败.");
		} catch (MarsException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result.setMessage(e.getMessage());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			result.setMessage("删除失败.");
		}
		return result;
	}

	/**
	 * 添加稿件和照片
	 * 
	 * @param CommandModel
	 * @param request
	 * 
	 * @return CommandEntity
	 *         http://localhost:8080/artron-photography/pgymanuscript/mstadd?format=json&ignore=false
	 */
	@RequestMapping(value = "/mstadd", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public CommandEntity mstAdd(@ParameterAttribute(value = "") Pgymanuscript entity, HttpServletRequest request) {

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

			log.info(entity.getProduction());
			String mstphoto = StringEscapeUtils.unescapeHtml4(entity.getProduction());
			log.info(mstphoto);
			List<Pgymstphoto> photo = FastjsonUtil.JsonToList(mstphoto, Pgymstphoto.class);// 照片列表

			if (photo == null) {
				throw new MarsException("照片不能为空.");
			}
			System.out.println(JacksonUtil.doJackson(entity));
			ValidationUtils.validObject(photo);

			entity.setMsttype(0);
			if (photo.size() > 1) {
				entity.setMsttype(1);
			}

			entity.setMststate1(0);
			entity.setMststate2(0);
			entity.setVotes(0.0);

			Pgymatch pgymatch = pgymatchService.queryById(entity.getMtId());
			String code = pgymatch.getCode();// 比赛code
			// 取当天最大序号
			Integer maxcode = pgymanuscriptService.queryMaxCode(code);
			maxcode++;
			code += String.format("%06d", maxcode); // 序号
			entity.setCode(code);

			CommandEntity mtAddEntity = super.doExecuteCommand(request, operator, entity);
			if (mtAddEntity.getStatus().equals(HttpStatus.SC_OK) && mtAddEntity.getCode().equals(Mars.SUCCESS)) {
				// 继续后面的添加
				String mstdbid = mtAddEntity.getExtraCode();
				if (mstdbid == null || mstdbid.length() == 0) {
					log.error("比赛添加失败ID返回空");
					throw new MarsException("添加失败.");
				}

				int tabindex = 0;
				for (Pgymstphoto ads : photo) {
					ads.setMstId(mstdbid);
					ads.setMtId(entity.getMtId());
					ads.setTabIndex(tabindex);
					String commandBeanId = ads.getClass().getSimpleName() + "." + operator;
					log.info("{} Find Command bean : {} ", Mars.LOG_PRE, commandBeanId);
					ServiceCommand<Pgymstphoto, String> command = SpringContextHolder.getBean(commandBeanId);
					pgymstphotoService.save(ads, command);
					tabindex++;
				}

				result.setStatus(HttpStatus.SC_OK);
				result.setCode(Mars.SUCCESS);
				result.setExtraCode(mstdbid);
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

	/**
	 * 修改稿件和照片
	 * 
	 * @param CommandModel
	 * @param request
	 * 
	 * @return CommandEntity
	 *         http://localhost:8080/artron-photography/pgymanuscript/mstupdate?format=json&ignore=false
	 */
	@RequestMapping(value = "/mstupdate", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public CommandEntity mstUpdate(@ParameterAttribute(value = "") Pgymanuscript entity, HttpServletRequest request) {

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
				log.error("失败，参数为空.");
				throw new MarsException("修改失败,参数为空.");
			}
			ValidationUtils.validObject(entity);//

			if (entity.getDbId() == null || entity.getDbId().length() == 0) {
				log.error("失败，主键ID为空.");
				throw new MarsException("修改失败,参数ID为空.");
			}

			log.info(entity.getProduction());
			String mstphoto = StringEscapeUtils.unescapeHtml4(entity.getProduction());
			log.info(mstphoto);
			List<Pgymstphoto> photo = FastjsonUtil.JsonToList(mstphoto, Pgymstphoto.class);// 照片列表

			if (photo == null) {
				throw new MarsException("照片不能为空.");
			}
			// System.out.println(mstphoto);
			// System.out.println(JacksonUtil.doJackson(entity));
			ValidationUtils.validObject(photo);

			entity.setMsttype(0);
			if (photo.size() > 1) {
				entity.setMsttype(1);
			}

			CommandEntity mtUpdateEntity = super.doExecuteCommand(request, operator, entity);
			if (mtUpdateEntity.getStatus().equals(HttpStatus.SC_OK) && mtUpdateEntity.getCode().equals(Mars.SUCCESS)) {
				// 继续后面的修改
				String mstdbid = entity.getDbId();
				int tabindex = 0;
				for (Pgymstphoto ads : photo) {
					ads.setMstId(mstdbid);
					ads.setTabIndex(tabindex);
					ads.setMtId(entity.getMtId());
					if (ads.getDbId() == null || ads.getDbId().length() == 0) {
						String commandBeanId = ads.getClass().getSimpleName() + "." + "add";
						log.info("{} Find Command bean : {} ", Mars.LOG_PRE, commandBeanId);
						ServiceCommand<Pgymstphoto, String> command = SpringContextHolder.getBean(commandBeanId);
						pgymstphotoService.save(ads, command);
					} else {
						String commandBeanId = ads.getClass().getSimpleName() + "." + "update";
						log.info("{} Find Command bean : {} ", Mars.LOG_PRE, commandBeanId);
						ServiceCommand<Pgymstphoto, String> command = SpringContextHolder.getBean(commandBeanId);
						pgymstphotoService.update(ads, command);
					}
					tabindex++;
				}

				result.setStatus(HttpStatus.SC_OK);
				result.setCode(Mars.SUCCESS);
			} else {
				result.setStatus(mtUpdateEntity.getStatus());
				result.setCode(mtUpdateEntity.getCode());
				result.setMessage(mtUpdateEntity.getMessage());
			}
		} catch (IllegalArgumentException e) {
			// TODO: handle exception
			e.printStackTrace();
			result.setMessage("修改失败.");
		} catch (MarsException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result.setMessage(e.getMessage());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			result.setMessage("修改失败.");
		}
		return result;
	}

	/**
	 * 查询稿件及照片信息
	 * 
	 * @param id
	 * @param extraCode
	 * @param request
	 * @return http://localhost:8080/artron-photography/pgymanuscript/getmst?format=json&ignore=false&dbid=
	 */
	@RequestMapping(value = "/getmst", method = RequestMethod.GET, produces = "application/json; charset=UTF-8") //
	@ResponseBody
	public ResultEntity<Pgymanuscript> queryById(String dbid, HttpServletRequest request) {
		ResultEntity<Pgymanuscript> result = new ResultEntity<Pgymanuscript>();
		result.setCommand("GetModel");
		result.setCommandTitle("取稿件信息");
		result.setStatus(HttpStatus.SC_INTERNAL_SERVER_ERROR);
		result.setCode(Mars.FAIL);
		try {
			if (dbid == null || dbid.length() == 0) {
				log.error("参数为空");
				throw new MarsException("查询失败,参数错误");
			}
			Pgymanuscript mst = pgymanuscriptService.queryById(dbid);
			Pgymstphoto mstphoto = new Pgymstphoto();
			mstphoto.setMstId(dbid);
			List<Pgymstphoto> photos = pgymstphotoService.queryAll(mstphoto);
			mst.setMstphotos(photos);

			result.setData(mst);
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
	 * 稿件详情页
	 * 
	 * @param mtid
	 * @param request
	 * @return
	 * 
	 * @apiExample http://localhost:8080/artron-photography/pgymanuscript/getselectinfo?format=json&ignore=false&mtid=dsa
	 * 
	 */
	@RequestMapping(value = "manuscriptDetail", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public ResultEntity<Map<String, Object>> manuscriptDetail(String mtid, HttpServletRequest request) {
		Map<String, Object> result = Maps.newHashMap();
		Pgymanuscript manuscript = pgymanuscriptService.queryById(mtid);
		Pgymstphoto pgymstphoto = new Pgymstphoto();
		pgymstphoto.setMstId(mtid);
		List<Pgymstphoto> allPhoto = pgymstphotoService.queryAll(pgymstphoto);
		result.put("manuscript", manuscript);
		result.put("photos", allPhoto);
		return new ResultEntity<Map<String, Object>>(result, 200);

	}

	/**
	 * 整理结果评审数据查询 查看初评结果 查看初步终评结果 开始初步终评数据查询
	 * 
	 * @apiExample http://localhost:8080/artron-photography/pgymanuscript/getMstPsge?format=json&ignore=false&statenum=1&mtid=1045565034580672512&mtgpid=&pageNum=1&pageSize=50&tab=
	 * 
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "getMstPage", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	public PageModelHelper<Pgymanuscript> getMstPage(String mtid, Integer statenum, String mtgpid, Integer pageNum,
			Integer pageSize, Integer tab, HttpServletRequest request) {
		try {
			if (statenum == null || statenum < 1 || statenum > 2)
				return null;
			PageModel<Pgymanuscript> pm = new PageModel<Pgymanuscript>();
			Pgymanuscript ent = new Pgymanuscript();
			ent.setStatenum(statenum);
			ent.setMtId(mtid);
			ent.setMtGpId(mtgpid);
			ent.setTab(tab);
			pm.setQueryParam(ent);
			if (pageNum != null)
				pm.setPageNum(pageNum);
			if (pageSize != null)
				pm.setPageSize(pageSize);
			pm = this.queryPgymanuscriptByPage(request, pm);
			if (mtgpid == null)
				mtgpid = "";
			PendingCount pendingcount = pgymanuscriptService.queryCount(mtid, statenum.toString(), mtgpid);
			PageModelHelper<Pgymanuscript> result = new PageModelHelper<Pgymanuscript>();
			result.setDscount(pendingcount.getDscount());
			result.setTgcount(pendingcount.getTgcount());
			result.setWtgcount(pendingcount.getWtgcount());
			result.setAllcount(pendingcount.getAllcount());
			result.setPageSize(pm.getPageSize());
			result.setPageNum(pm.getPageNum());
			result.setTotal(pm.getTotal());
			result.setTotalPage(pm.getTotalPage());
			result.setRows(pm.getRows());
			result.setQueryParam(null);
			return result;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}

	public PageModel<Pgymanuscript> queryPgymanuscriptByPage(HttpServletRequest request,
			PageModel<Pgymanuscript> pageModel) {
		return this.doQueryPgymanuscriptPage(request, pageModel,
				new Command<PageModel<Pgymanuscript>, List<Pgymanuscript>>() {

					private static final long serialVersionUID = 1L;

					@Override
					public List<Pgymanuscript> execute(PageModel<Pgymanuscript> pageModel) throws CmdException {
						if (pgymanuscriptService != null) {

							return pgymanuscriptService.queryMstByPage(pageModel);
						}

						return null;
					}
				});
	}

	protected PageModel<Pgymanuscript> doQueryPgymanuscriptPage(HttpServletRequest request,
			PageModel<Pgymanuscript> pageModel, Command<PageModel<Pgymanuscript>, List<Pgymanuscript>> command) {
		try {

			List<Pgymanuscript> list = command.execute(pageModel);
			if (list != null && !list.isEmpty()) {
				// pageModel.setResults(list);
				pageModel.setRows(list);
				pageModel.setTotal(pageModel.getTotal());
			}

			return pageModel;
		} catch (CmdException e) {
			log.error(e.getMessage(), e);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		pageModel.setPageNum(1);
		pageModel.setTotalPage(0);
		pageModel.setTotal(0);
		// pageModel.setTotalRecord(0);
		return pageModel;
	}

	/**
	 * 评分评审页列表数据
	 * 
	 * @param request
	 * @param entity
	 * @return http://localhost:8080/artron-photography/pgymanuscript/open/getmstall?format=json&ignore=false&mtId=
	 */
	@RequestMapping(value = "/open/getmstall", method = RequestMethod.GET, produces = "application/json; charset=UTF-8") //
	@ResponseBody
	public List<Pgymanuscript> queryMstAll(HttpServletRequest request,
			@ParameterAttribute(value = "") Pgymanuscript entity) {
		try {
			return pgymanuscriptService.queryMstAll(entity);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	
	}
	

	/**
	 * 评分评审页按DBID或CODE查询
	 * 
	 * @param request
	 * @param entity
	 * @return http://localhost:8080/artron-photography/pgymanuscript/open/mst?format=json&ignore=false&dbId=&code=
	 */
	@RequestMapping(value = "/open/mst", method = RequestMethod.GET, produces = "application/json; charset=UTF-8") //
	@ResponseBody
	public Pgymanuscript queryMst(HttpServletRequest request,
			@ParameterAttribute(value = "") Pgymanuscript entity) {
		Pgymanuscript mst=new Pgymanuscript();
		try {
			mst= pgymanuscriptService.queryMst(entity);
			if(mst!=null) {
			Pgymstphoto photo = new Pgymstphoto();
			photo.setMstId(mst.getDbId());
			List<Pgymstphoto> mstphotos = pgymstphotoService.queryAll(photo);// 照片列表
			mst.setMstphotos(mstphotos);
			Pgymstscore score= new Pgymstscore();
			score.setMstId(mst.getDbId());
			List<Pgymstscore> mstscore =pgymstscoreService.queryAll(score);
			mst.setMstscores(mstscore);
			}
			return mst;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}

	}
}
