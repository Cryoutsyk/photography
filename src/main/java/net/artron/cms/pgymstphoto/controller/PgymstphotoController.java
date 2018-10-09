package net.artron.cms.pgymstphoto.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import org.springframework.ui.Model;
import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import net.mars.Entity;
import net.mars.PageModel;
import net.mars.common.Mars;
import net.mars.common.util.FileUtil;
import net.mars.common.util.MarsStringUtil;
import net.mars.boot.web.mvc.parameter.ParameterAttribute;
import net.mars.core.command.CommandEntity;
import net.mars.core.controller.ApplicationController;
import net.mars.exception.MarsException;
import net.artron.cms.pgymstphoto.model.Pgymstphoto;
import net.artron.cms.pgymstphoto.service.PgymstphotoService;
import net.artron.cms.util.PathUtil;
import net.artron.cms.util.ResultEntity;
import lombok.extern.slf4j.Slf4j;

/**
 * PgymstphotoController. 基类 ApplicationController 中已经定义了一些常用方法 1、页面跳转
 * {pagePath}/toPage 2、跳转到详细页面 {pagePath}/toDetail 3、查询全部数据 queryAll 4、分页查询数据
 * queryByPage 5、增删改等操作 {operator}/command
 * 
 * @author
 */
@Slf4j
@Controller
@RequestMapping("/pgymstphoto")
public class PgymstphotoController extends ApplicationController<Pgymstphoto> {
	/**
	 * 注入Service类对象.
	 */
	@Resource(name = "pgymstphotoService")
	PgymstphotoService pgymstphotoService;

	@RequestMapping("toIndex")
	public String to_index(HttpServletRequest request, Model model) {
		return "pgymstphoto/index";
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
	 * @api {GET} /pgymstphoto/query 查询地址所有数据
	 * @apiVersion 1.0.0
	 * @apiName query
	 * @apiGroup Pgymstphoto
	 * @apiDescription 查询所有数据
	 * @apiPermission 无
	 * 
	 * @apiParam {String} version=v1 版本号
	 * @apiParam {Boolean} format=json 返回数据格式
	 * @apiParam {Boolean} ignore=true 是否需要验证访问权限
	 * @apiParam {String} updatedBy 编辑人
	 * @apiParam {String} updatedDt 编辑时间
	 * @apiParam {Integer} tabindex 排序
	 * @apiParam {String} mstId 稿件ID,
	 * @apiParam {String} name 照片文件名,
	 * @apiParam {String} photourl 照片地址,
	 * @apiParam {String} md5code MD5码,
	 * 
	 * @apiExample 调用示例: curl -i
	 *             http://localhost:8080/mars-core/pgymstphoto/query?format=json&ignore=true&version=v1
	 * 
	 * @apiSuccess {String} dbId 数据主键
	 * @apiSuccess {String} updatedBy 编辑人
	 * @apiSuccess {String} updatedDt 编辑时间
	 * @apiSuccess {Integer} tabindex 排序
	 * @apiSuccess {String} mstId 稿件ID,
	 * @apiSuccess {String} name 照片文件名,
	 * @apiSuccess {String} photourl 照片地址,
	 * @apiSuccess {String} md5code MD5码,
	 * 
	 * @apiError NoAccessRight 只有授权用户才能访问此地址.
	 * @apiError NoParamFormat 没有设置参数format=json.
	 * @apiErrorExample Response (example): HTTP/1.1 Status 406 { "error":
	 *                  "NoParamFormat" }
	 * 
	 * @apiSampleRequest http://localhost:8080/mars-core/pgymstphoto/query?format=json&ignore=true&version=v1
	 * 
	 */
	@Override
	public List<? extends Entity> queryAll(HttpServletRequest request,
			@ParameterAttribute(value = "") Pgymstphoto entity) {
		return super.queryAll(request, entity);
	}

	/**
	 * 分页查询数据.
	 * 
	 * @param request
	 * @param pageModel
	 * @return
	 * 
	 * @api {GET} /pgymstphoto/page 分页查询数据
	 * @apiVersion 1.0.0
	 * @apiName page
	 * @apiGroup Pgymstphoto
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
	 *             http://localhost:8080/mars-core/pgymstphoto/page?format=json&ignore=true&version=v1&pageNum=2&pageSize=20
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
	 * @apiSampleRequest http://localhost:8080/mars-core/pgymstphoto/page?format=json&ignore=true&version=v1&pageNum=2&pageSize=20
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
	 * @apiGroup Pgymstphoto
	 * @apiDescription 增删改查等操作
	 * @apiPermission 无
	 * 
	 * @apiParam {String} version=v1 版本, 指定值 : v1
	 * @apiParam {Boolean} format=json 返回数据格式, 默认值 : json
	 * @apiParam {Boolean} ignore=true 是否需要验证访问权限, 默认值 : true
	 * @apiParam {String} updatedBy 编辑人
	 * @apiParam {String} updatedDt 编辑时间
	 * @apiParam {Integer} tabindex 排序
	 * @apiParam {String} mstId 稿件ID,
	 * @apiParam {String} name 照片文件名,
	 * @apiParam {String} photourl 照片地址,
	 * @apiParam {String} md5code MD5码,
	 * 
	 * @apiExample 调用示例: curl -d "code=11&name=abc" -i
	 *             http://localhost:8080/mars-core/pgymstphoto/add/command?format=json&ignore=true&version=v1
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
	public CommandEntity doCommand(@ParameterAttribute(value = "") Pgymstphoto entity, HttpServletRequest request,
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
	}

	/**
	 * 上传图片
	 * http://localhost:8080/artron-photography/pgymstphoto/open/uploadimg?format=json&ignore=false
	 */
	@PostMapping("open/uploadimg")
	@ResponseBody
	public ResultEntity<Pgymstphoto> mstuploadimg(@RequestParam("file") MultipartFile file,String mtid, HttpServletRequest request) {
		ResultEntity<Pgymstphoto> result = new ResultEntity<Pgymstphoto>();
		result.setCommand("UpLoad");
		result.setCommandTitle("上传图片");
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
			if (!"image".equals(contentType.substring(0, contentType.indexOf("/")))) {
				throw new MarsException("照片格式错误.");
			}
			// file.getSize();//5*1048576 5M
			if (file.getSize() > 100 * 1048576) {// 限制100M
				throw new MarsException("上传失败，请上传小于100M图片.");
			}
			String imgmd5 = MarsStringUtil.md5(file.getInputStream());
			System.out.println("图片MD5码:" + imgmd5);

			// 生成uuid作为文件名称
			String uuid = UUID.randomUUID().toString().replaceAll("-", "");
			
			String path = PathUtil.GetFolderPath();
			
			System.out.println(path);
			String sqlPathPre=path.replaceAll("\\\\", "/");
			System.out.println(sqlPathPre);
			// 定义文件保存的本地路径
			String localPath =  PathUtil.GetPathPrefix() + path;
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
			System.out.println("sqlPath:"+sqlPath);
			
			Pgymstphoto pt=new Pgymstphoto();
			pt.setName(oldname);
			pt.setMd5code(imgmd5);
			pt.setPhotourl(sqlPath);
			pt.setMtId(mtid);
			result.setData(pt);
//			CommandEntity  commandEntity= super.doCommand(pt, request, "add");
//			result.setStatus(commandEntity.getStatus());
//			result.setCode(commandEntity.getCode());
//			result.setMessage(commandEntity.getMessage());
			result.setStatus(HttpStatus.SC_OK);
			result.setCode(Mars.SUCCESS);
			result.setMessage("http://localhost:8080/artron-photography"+sqlPath);

		} catch (FileNotFoundException e) {
			e.printStackTrace();
			result.setMessage("上传失败");
		} catch (IOException e) {
			e.printStackTrace();
			result.setMessage("上传失败" );
		} catch (MarsException e) {
			e.printStackTrace();
			result.setMessage(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			result.setMessage("上传失败" );
		}
		return result;
	}

}
