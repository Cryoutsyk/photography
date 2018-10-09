package net.artron.view.pgyuser.controller;
 
import java.util.List;

import javax.annotation.Resource; 
import org.springframework.ui.Model;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller; 
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import net.mars.Entity;
import net.mars.PageModel;
import net.mars.common.Mars;
import net.mars.boot.web.mvc.parameter.ParameterAttribute;
import net.mars.core.command.CommandEntity;
import net.mars.core.controller.ApplicationController; 
import net.artron.view.pgyuser.model.Pgyuser;
import net.artron.view.pgyuser.service.PgyuserService; 
import lombok.extern.slf4j.Slf4j;

/**
 * PgyuserController.
 * 鍩虹被 ApplicationController 涓凡缁忓畾涔変簡涓�浜涘父鐢ㄦ柟娉�
 * 1銆侀〉闈㈣烦杞� {pagePath}/toPage 
 * 2銆佽烦杞埌璇︾粏椤甸潰 {pagePath}/toDetail
 * 3銆佹煡璇㈠叏閮ㄦ暟鎹� queryAll
 * 4銆佸垎椤垫煡璇㈡暟鎹� queryByPage
 * 5銆佸鍒犳敼绛夋搷浣� {operator}/command
 * @author
 */
@Slf4j 
@Controller
@RequestMapping("/pgyuser")
public class PgyuserController extends ApplicationController<Pgyuser>  {
	/**
	 * 娉ㄥ叆Service绫诲璞�.
	 */
	@Resource(name = "pgyuserService")
	PgyuserService pgyuserService;
	
	@RequestMapping("toIndex")
	public String to_index(HttpServletRequest request, Model model) {
		return "pgyuser/index";
	}
	
	/**
	 * 杩涘叆page鐣岄潰涔嬪墠, 鍙缃澶栧弬鏁�.
	 *
	 * @param request
	 */
	@Override 
	protected void beforeGoPage(String page, HttpServletRequest request, Model model) {
		super.beforeGoPage(page, request, model);
	}
	
	/**
	 * 鏌ヨ鎵�鏈夋暟鎹�.
	 * @param request
	 * @return
	 *
	 *
	 * @api {GET} /pgyuser/query 鏌ヨ鍦板潃鎵�鏈夋暟鎹�
	 * @apiVersion 1.0.0
     * @apiName query
     * @apiGroup Pgyuser
     * @apiDescription 鏌ヨ鎵�鏈夋暟鎹�
     * @apiPermission 鏃�
     * 
     * @apiParam {String} version=v1 鐗堟湰鍙�
     * @apiParam {Boolean} format=json 杩斿洖鏁版嵁鏍煎紡
     * @apiParam {Boolean} ignore=true 鏄惁闇�瑕侀獙璇佽闂潈闄�
     * @apiParam {String} number 登录账号(手机号)
     * @apiParam {String} password 登录密码
     * @apiParam {String} phone 绑定手机号
     * @apiParam {String} name 用户姓名
     * @apiParam {String} area 居住地
     * @apiParam {String} idCard 身份证号码
     * @apiParam {String} email 电子邮箱
     * @apiParam {String} remark 备注
     * @apiParam {String} openId 第三方id
     * @apiParam {String} type 账号类型(P:手机号 Q:qq号 W:微信号)
     * @apiParam {java.util.Date} createDt 创建时间
     * 
     * @apiExample 璋冪敤绀轰緥:
     * 	curl -i http://localhost:8080/mars-core/pgyuser/query?format=json&ignore=true&version=v1
     * 
     * @apiSuccess {String}   dbId 鏁版嵁涓婚敭
     * @apiSuccess {String} number 登录账号(手机号)
     * @apiSuccess {String} password 登录密码
     * @apiSuccess {String} phone 绑定手机号
     * @apiSuccess {String} name 用户姓名
     * @apiSuccess {String} area 居住地
     * @apiSuccess {String} idCard 身份证号码
     * @apiSuccess {String} email 电子邮箱
     * @apiSuccess {String} remark 备注
     * @apiSuccess {String} openId 第三方id
     * @apiSuccess {String} type 账号类型(P:手机号 Q:qq号 W:微信号)
     * @apiSuccess {java.util.Date} createDt 创建时间
     * 
     * @apiError NoAccessRight 鍙湁鎺堟潈鐢ㄦ埛鎵嶈兘璁块棶姝ゅ湴鍧�.
     * @apiError NoParamFormat 娌℃湁璁剧疆鍙傛暟format=json.
     * @apiErrorExample  Response (example):
     *     HTTP/1.1 Status 406
     *     {
     *       "error": "NoParamFormat"
     *     }
     * 
     * @apiSampleRequest http://localhost:8080/mars-core/pgyuser/query?format=json&ignore=true&version=v1
     * 
	 */
	@Override
	public List<? extends Entity> queryAll(HttpServletRequest request, @ParameterAttribute(value = "") Pgyuser entity) { 
		return super.queryAll(request, entity);
	}
	  
	/**
	 * 鍒嗛〉鏌ヨ鏁版嵁.
	 * @param request
	 * @param pageModel
	 * @return
	 * 
	 * @api {GET} /pgyuser/page 鍒嗛〉鏌ヨ鏁版嵁
	 * @apiVersion 1.0.0
     * @apiName page
     * @apiGroup Pgyuser
     * @apiDescription 鍒嗛〉鏌ヨ鏁版嵁
     * @apiPermission 鏃�
     * 
     * @apiParam {String} version=v1 鐗堟湰鍙�
     * @apiParam {Boolean} format=json 杩斿洖鏁版嵁鏍煎紡
     * @apiParam {Boolean} ignore=true 鏄惁闇�瑕侀獙璇佽闂潈闄�
     * @apiParam {Integer} pageNum=1 褰撳墠椤电爜
     * @apiParam {Integer} pageSize=15 褰撳墠椤垫暟鎹潯鏁�
     * @apiParam {String} order=asc 鎺掑簭鏂瑰紡 "asc" 銆� "desc"
     * @apiParam {String} sort 鎺掑簭瀛楁
     * @apiParam {String} code 缂栫爜
     * @apiParam {String} name 鍚嶇О
     * 
     * @apiExample 璋冪敤绀轰緥:
     * 	curl -i http://localhost:8080/mars-core/pgyuser/page?format=json&ignore=true&version=v1&pageNum=2&pageSize=20
     * 
     * @apiSuccess {List}   results 鏁版嵁鍒楄〃
     * @apiSuccess {Integer} pageNum 椤电爜
     * @apiSuccess {Integer} pageSize 褰撳墠椤垫潯鏁�
     * @apiSuccess {Integer} totalRecord 鎬昏褰曟潯鏁�
     * @apiSuccess {Integer} totalPage 鎬婚〉鏁� 
     * 
     * @apiError NoAccessRight 鍙湁鎺堟潈鐢ㄦ埛鎵嶈兘璁块棶姝ゅ湴鍧�.
     * @apiError NoParamFormat 娌℃湁璁剧疆鍙傛暟format=json.
     * @apiErrorExample  Response (example):
     *     HTTP/1.1 Status 406
     *     {
     *       "error": "NoParamFormat"
     *     }
     * 
     * @apiSampleRequest http://localhost:8080/mars-core/pgyuser/page?format=json&ignore=true&version=v1&pageNum=2&pageSize=20
     *  
	 */
	@Override
	public PageModel<? extends Entity> queryByPage(HttpServletRequest request, 
			@ParameterAttribute(value = "pageModel") PageModel<? extends Entity> pageModel) {
		return super.queryByPage(request, pageModel);
	}
	  
	/**
	 * 璁惧畾涓�浜涘弬鏁板��.
	 * @param request
	 * @param pageModel
	 */
	@Override 
	protected void beforeQueryByPage(HttpServletRequest request, PageModel<? extends Entity> pageModel) {
		//Entity鐨勫睘鎬� createdDt 鏈夐粯璁ゅ�硷紝鏌ヨ鏃堕渶瑕佸幓鎺夋榛樿鍙傛暟鍊�
		Entity ent = pageModel.getQueryParam();
		if (ent != null) {
			ent.setCreatedDt(null);
		}
	}
	
	/**
	 * 澧炲垹鏀规煡绛夋搷浣�.
	 * @param entity 鍙傛暟
	 * @param request 鍙傛暟
	 * @param operator 鎿嶄綔
	 * @return
	 * 
	 * 
	 * @api {POST} /address/{operator}/command 澧炲垹鏀规煡绛夋搷浣�.
	 * @apiVersion 1.0.0
     * @apiName command
     * @apiGroup Pgyuser
     * @apiDescription 澧炲垹鏀规煡绛夋搷浣�
     * @apiPermission 鏃�
     * 
     * @apiParam {String} version=v1 鐗堟湰, 鎸囧畾鍊� : v1
     * @apiParam {Boolean} format=json 杩斿洖鏁版嵁鏍煎紡, 榛樿鍊� : json
     * @apiParam {Boolean} ignore=true 鏄惁闇�瑕侀獙璇佽闂潈闄�, 榛樿鍊� : true
     * @apiParam {String} number 登录账号(手机号)
     * @apiParam {String} password 登录密码
     * @apiParam {String} phone 绑定手机号
     * @apiParam {String} name 用户姓名
     * @apiParam {String} area 居住地
     * @apiParam {String} idCard 身份证号码
     * @apiParam {String} email 电子邮箱
     * @apiParam {String} remark 备注
     * @apiParam {String} openId 第三方id
     * @apiParam {String} type 账号类型(P:手机号 Q:qq号 W:微信号)
     * @apiParam {java.util.Date} createDt 创建时间
     * 
     * @apiExample 璋冪敤绀轰緥:
     * 	curl -d "code=11&name=abc" -i http://localhost:8080/mars-core/pgyuser/add/command?format=json&ignore=true&version=v1
     * 
     * @apiSuccess {String}   code 缁撴灉鐘舵�佺爜, "success" : 鎴愬姛锛� "fail" : 澶辫触
     * @apiSuccess {String}   message 缁撴灉鏂囧瓧鎻忚堪淇℃伅
     * 
     * @apiError NoAccessRight 鍙湁鎺堟潈鐢ㄦ埛鎵嶈兘璁块棶姝ゅ湴鍧�.
     * @apiError NoParamFormat 娌℃湁璁剧疆鍙傛暟format=json.
     * @apiErrorExample  Response (example):
     *     HTTP/1.1 Status 406
     *     {
     *       "error": "NoParamFormat"
     *     }
	 */
	@Override
	public CommandEntity doCommand(@ParameterAttribute(value = "") Pgyuser entity, HttpServletRequest request, @PathVariable String operator) {
		log.debug("{} doCommand : \"{}\" ", Mars.LOG_PRE, operator);
		return super.doCommand(entity, request, operator);
	}
	
	/**
	 * 鎵ц鎿嶄綔鍓嶅彲杩涜棰濆鐨勫弬鏁拌缃�.
	 */
	@Override
	protected void beforeCommand(HttpServletRequest request, Entity entity, String cmdCode) {
	}
	
	/**
	 * 鎵ц鎿嶄綔瀹屾垚鍚庯紝鍙互澧炲姞棰濆杩斿洖鏁版嵁.
	 */
	@Override
	protected void afterCommand(HttpServletRequest request, Entity entity, CommandEntity result, String cmdCode) {
	}
}
