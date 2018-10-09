package net.artron.cms.pgyuser.controller;
 
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qq.connect.QQConnectException;
import com.qq.connect.api.OpenID;
import com.qq.connect.api.qzone.UserInfo;
import com.qq.connect.javabeans.AccessToken;
import com.qq.connect.javabeans.qzone.UserInfoBean;
import com.qq.connect.oauth.Oauth;

import lombok.extern.slf4j.Slf4j;
import net.artron.cms.ogzuser.service.OgzuserService;
import net.artron.cms.pgyhostunit.model.Pgyhostunit;
import net.artron.cms.pgyhostunit.service.PgyhostunitService;
import net.artron.cms.pgymanuscript.service.PgymanuscriptService;
import net.artron.cms.pgymatch.model.Pgymatch;
import net.artron.cms.pgymatch.service.PgymatchService;
import net.artron.cms.pgyrater.model.Pgyrater;
import net.artron.cms.pgyrater.service.PgyraterService;
import net.artron.cms.pgyuser.model.CommandUser;
import net.artron.cms.pgyuser.model.LoginEntity;
import net.artron.cms.pgyuser.model.Pgyuser;
import net.artron.cms.pgyuser.model.WeixinOauth2Token;
import net.artron.cms.pgyuser.service.PgyuserService;
import net.artron.cms.pgyuser.util.CommandResultUtil;
import net.artron.cms.pgyuser.util.VerifyCodeUtils;
import net.artron.cms.pgyuser.util.WeiXinUtil;
import net.artron.cms.util.ResultEntity;
import net.mars.Entity;
import net.mars.PageModel;
import net.mars.boot.web.mvc.parameter.ParameterAttribute;
import net.mars.common.Mars;
import net.mars.common.cmd.CmdException;
import net.mars.common.util.LocaleUtil;
import net.mars.common.util.URLUtil;
import net.mars.core.ApplicationUtil;
import net.mars.core.command.CommandEntity;
import net.mars.core.controller.ApplicationController;
import net.mars.exception.MarsException;
import net.sf.json.JSONObject;


@Slf4j 
@Controller
@RequestMapping("/pgyuser")
public class PgyuserController extends ApplicationController<Pgyuser>  {
	
	@Resource(name = "pgyuserService")
	PgyuserService pgyuserService;
	
	@Resource(name = "pgymatchService")
	PgymatchService pgymatchService;
	
	
	@Resource(name = "pgymanuscriptService")
	PgymanuscriptService pgymanuscriptService;
	
	@Resource(name = "pgyraterService")
	PgyraterService pgyraterService;
	
	@Resource(name = "pgyhostunitService")
	PgyhostunitService pgyhostunitService;
	
	@Resource(name = "ogzuserService")
	OgzuserService ogzuserService;
	
	//密码格式
	private final String regex = "^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$";
	//身份证号码格式
	private final String regular = "(^[1-9]\\d{5}(18|19|20)\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{3}[0-9Xx]$)|" +
            "(^[1-9]\\d{5}\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{3}$)";
	private final String ADD = "add";
	private final String UPDATE = "update";
	private final String SELECT = "select";
	/*private final Pattern pattern = Pattern.compile("[0-9]*");*/
	//邮箱格式
	private final String expr = "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})$";
	//用户名格式
	private final String validateStr = "^[\\w\\-－＿[０-９]\u4e00-\u9fa5\uFF21-\uFF3A\uFF41-\uFF5A]+$";
	//验证手机号码
	public static boolean isMobileNO(String mobiles){
		Pattern p = Pattern.compile("^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$");
		Matcher m = p.matcher(mobiles);
		return m.matches();
		}
	
	/**
	 * 获取qq登录返回地址
	 * @param request
	 * @return
	 */
	@RequestMapping(value="open/qqlogin",method={RequestMethod.POST})
	@ResponseBody
	public CommandEntity getQQLoginPage(HttpServletRequest request){
		String loginUrl= null;
		try {
			loginUrl=new Oauth().getAuthorizeURL(request);
		} catch (QQConnectException e) {
			log.info("qq登录错误",e);
		}
		loginUrl=new StringBuffer("redirect:").append(loginUrl).toString();
		return CommandResultUtil.resultJson(request, Mars.SUCCESS, SELECT, HttpStatus.SC_OK, loginUrl);
	}
	
	/**
	 * 用户qq登录回调方法
	 * @param request
	 * @param model
	 * @return
	 * @throws QQConnectException
	 */
	@RequestMapping(value="open/afterqqlogin",method={RequestMethod.GET})
	@ResponseBody
	public CommandEntity afterQQLogin(HttpServletRequest request,Model model) throws QQConnectException{
		HttpSession session=request.getSession();
		AccessToken accessTokenObj = null;
		OpenID openIDobj = null;
		Pgyuser pgyuser = new Pgyuser();
        String accessToken = null;
        String openID = null;	
        //验证用户是否登录
        if (session.getAttribute("accessToken")!=null&&session.getAttribute("openid")!=null) {
			accessToken=String.valueOf(session.getAttribute("accessToken"));
			openID=String.valueOf(session.getAttribute("openid"));
			return CommandResultUtil.resultJson(request, Mars.FAIL, SELECT, HttpStatus.SC_INTERNAL_SERVER_ERROR, "系统异常");
		}else {
			//判断是否非法登录
			if ("".equals(accessToken)) {
				log.info("用户非法请求!");
				return CommandResultUtil.resultJson(request, Mars.FAIL, SELECT, HttpStatus.SC_OK, "非法请求,登录失败");
			}else {
				try {
					//获取accesstoken
					accessTokenObj=(new Oauth()).getAccessTokenByRequest(request);
					accessToken=accessTokenObj.getAccessToken();
					//获取openid
					openIDobj = new OpenID(accessToken);
					openID = openIDobj.getUserOpenID();
					session.setAttribute("accessToken", accessToken);
					session.setAttribute("openID", openID);
				} catch (QQConnectException e) {
 					// TODO Auto-generated catch block
					e.printStackTrace();
					log.info("获取openID、accessToken失败,错误信息是:"+e);
					return CommandResultUtil.resultJson(request, Mars.FAIL, SELECT, HttpStatus.SC_INTERNAL_SERVER_ERROR, "系统异常");
				}
			}
			//获取用户信息保存并存储
			UserInfo qzoneUserinfo = new UserInfo(accessToken, openID);
			UserInfoBean userInfoBean;
			userInfoBean = qzoneUserinfo.getUserInfo();
			pgyuser.setUserName(userInfoBean.getNickname());
			pgyuser.setOpenId(openID);
			pgyuser.setType("Q");
			pgyuser.setStatus(1);
			model.addAttribute("userInfoBean", userInfoBean);
			//  进行业务处理   用户登录、 用户注册、验证用户是否注册(单个应用openid相同)
			List<Pgyuser> userlist = pgyuserService.queryAll(pgyuser);
			if (userlist==null&&userlist.size()==0) {
				return this.doExecuteCommand(request, "add", pgyuser);
			}else{
				return CommandResultUtil.resultJson(request, Mars.SUCCESS, SELECT, HttpStatus.SC_OK, "登陆成功");
			}
		}
	}
	
	/**
	 * 用户微信扫码登录回调地址
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(value="open/weixinlogin",method={RequestMethod.GET})
	public CommandEntity WXuserLogin(HttpServletRequest request,HttpServletResponse response,Model model) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		//获取code
		String code = request.getParameter("code");
		WeixinOauth2Token wxot = WeiXinUtil.getOauth2AccessToken(WeiXinUtil.appid, WeiXinUtil.appSecret, code);
		String accessToken = wxot.getAccessToken();
		String openID = wxot.getOpenId();
		Pgyuser pgyuser = WeiXinUtil.getSNSUserInfo(accessToken, openID);
		if (pgyuser==null) {
			return CommandResultUtil.resultJson(request, Mars.FAIL, SELECT, HttpStatus.SC_OK, "获取用户信息失败");
		}else {
			//获取用户信息并注册
			List<Pgyuser> userlist = pgyuserService.queryAll(pgyuser);
			model.addAttribute("pgyuser", pgyuser);
			if (userlist==null&&userlist.size()==0) {
				return this.doExecuteCommand(request, "add", pgyuser);
			}else{
			    return CommandResultUtil.resultJson(request, Mars.SUCCESS, SELECT, HttpStatus.SC_OK, "登陆成功");
			}
		}
	}
	
	
	/**
	 * 获取图片验证码
	 * @param request
	 * @param response
	 * @param session
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(value="open/getverifycation",method={RequestMethod.GET})
	public void Verification(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException{
		//生成验证码
		VerifyCodeUtils verifyCode = new VerifyCodeUtils(160,40,4,150);
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("image/jpeg");
		verifyCode.write(response.getOutputStream());
		//设置超时时间60s
		session.setMaxInactiveInterval(60);
		//将验证码存入session
		session.setAttribute("code"+verifyCode.getCode(), verifyCode.getCode());
		System.out.println(verifyCode.getCode());
	}
	
	
	/**
	 * 获取手机验证码
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="open/getphoneverify",method={RequestMethod.GET})
	public String getphoneverify(HttpServletRequest request){
		String verify = "123";
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("phoneVerify", verify);
		return jsonObject.toString();
	}
	
	
	/**
	 * 普通用户登录方法
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="open/pgyuserlogin",method={RequestMethod.POST})
	public CommandEntity pgyuserLogin(HttpServletRequest request,HttpServletResponse response,HttpSession session ){
		Pgyuser pgyuser = new Pgyuser();
		ResultEntity<Pgyuser> result = new ResultEntity<>();
		pgyuser.setPassword(request.getParameter("password"));
		pgyuser.setNumber(request.getParameter("number"));
		pgyuser.setStatus(null);
		pgyuser.setVersion(null);
		String operatorCommand = "command." + SELECT;
		result.setCommand(SELECT);
		String commandTitle = LocaleUtil.getMessage(request, operatorCommand, new Object[] {});
		result.setCommandTitle(commandTitle);
        result.setCode(Mars.SUCCESS);
        Integer status = null;
		//判断是否传入图片验证码
        String verify = request.getParameter("verify");
		if (verify==null) {
			//验证用户信息
			List<Pgyuser> pgyuserlist = pgyuserService.queryAll(pgyuser);
			for (Pgyuser pgy : pgyuserlist) {
				result.setData(pgy);
				status=pgy.getStatus();
			}
			if (pgyuserlist!=null&&pgyuserlist.size()!=0) {
				if (status.equals(1)) {
					request.setAttribute("usermasg", pgyuserlist);
					result.setMessage("登录");
					result.setStatus(HttpStatus.SC_OK);
					return result;
				}
				return CommandResultUtil.resultJson(request, Mars.FAIL, SELECT, HttpStatus.SC_OK, "账号已被禁用,请联系管理员");
			}
			return CommandResultUtil.resultJson(request, Mars.FAIL, SELECT, HttpStatus.SC_OK, "账号或密码不正确");
		}else {
			//判断图片验证码
			if (request.getParameter("verify").toUpperCase().equals(session.getAttribute("code"+request.getParameter("verify").toUpperCase()))) {
				session.removeAttribute("code"+request.getParameter("verify").toUpperCase());
				//验证用户信息
				List<Pgyuser> pgyuserlist = pgyuserService.queryAll(pgyuser);
				for (Pgyuser pgy : pgyuserlist) {
					result.setData(pgy);
					status=pgy.getStatus();
				}
				if (pgyuserlist!=null&&pgyuserlist.size()!=0) {
					if (status.equals(1)) {
						request.setAttribute("usermasg", pgyuserlist);
						result.setMessage("登录");
						result.setStatus(HttpStatus.SC_OK);
						return result;
					}
					return CommandResultUtil.resultJson(request, Mars.FAIL, SELECT, HttpStatus.SC_OK, "账号已被禁用,请联系管理员");
				}
				return CommandResultUtil.resultJson(request, Mars.FAIL, SELECT, HttpStatus.SC_OK, "账号或密码不正确");
			}
			session.removeAttribute("code"+request.getParameter("verify").toUpperCase());
			return CommandResultUtil.resultJson(request, Mars.FAIL, SELECT, HttpStatus.SC_OK, "验证码不正确");
		}
	}
	
	/**
	 * 普通用户注册方法
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value={"open/pgyuserregister"},method={RequestMethod.POST})
	public CommandEntity pgyuserregister(HttpServletRequest request,HttpSession session){
		//获取手机验证码
		String phoneverify = request.getParameter("phoneVerify");
		Pgyuser pgyuser = new Pgyuser();
		pgyuser.setNumber(request.getParameter("number"));
		pgyuser.setPassword(request.getParameter("password"));
		pgyuser.setPhone(request.getParameter("number"));
		pgyuser.setType("P");
		pgyuser.setStatus(1);
		/*
		if (!request.getParameter("password").matches(regex)) {
			return CommandResultUtil.resultJson(request, Mars.FAIL, SELECT, HttpStatus.SC_OK, "密码必须由数字和字母组成");
		}*/
		//判断是否传入验证码
		String verify = request.getParameter("verify");
		if (verify==null) {
			//判断手机验证码
			if (phoneverify!=null&&"123".equals(phoneverify)) {
				//验证手机号码是否被注册
				Boolean check = pgyuserService.checkPhone(request.getParameter("number"));
				if (check) {
					return super.doExecuteCommand(request, "add", pgyuser);
				}
				return CommandResultUtil.resultJson(request, Mars.FAIL, SELECT, HttpStatus.SC_OK, "此号码已被注册");
			}
			return CommandResultUtil.resultJson(request, Mars.FAIL, SELECT, HttpStatus.SC_OK, "手机验证码错误");
		}else {
			if (request.getParameter("verify").toUpperCase().equals(session.getAttribute("code"+request.getParameter("verify").toUpperCase()))&&"123".equals(phoneverify)) {
				session.removeAttribute("code"+request.getParameter("verify").toUpperCase());
				//验证手机号码是否被注册
				Boolean check = pgyuserService.checkPhone(request.getParameter("number"));
				if (check) {
					return super.doExecuteCommand(request, "add", pgyuser);
				}
				return CommandResultUtil.resultJson(request, Mars.FAIL, SELECT, HttpStatus.SC_OK, "此号码已被注册");
			}
			session.removeAttribute("code"+request.getParameter("verify").toUpperCase());
			return CommandResultUtil.resultJson(request, Mars.FAIL, SELECT, HttpStatus.SC_OK, "验证码不正确");
		}
	}
	
	/**
	 * 手机号码绑定/修改
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(value="open/bindphone",method={RequestMethod.POST})
	@ResponseBody
	public CommandEntity bindphone(HttpServletRequest request,HttpSession session){
		/*if (request.getParameter("version")==null) {
			return CommandResultUtil.resultJson(request, Mars.FAIL, SELECT, HttpStatus.SC_INTERNAL_SERVER_ERROR, "参数有误");
		}*/
		String phoneverify = request.getParameter("phoneVerify");
		Pgyuser pgyuser = new Pgyuser();
		pgyuser.setDbId(request.getParameter("dbid"));
		pgyuser.setPhone(request.getParameter("phone"));
		pgyuser.setNumber(request.getParameter("phone"));
		pgyuser.setVersion(null);
		//验证手机号是否已被绑定 
		Boolean check = pgyuserService.checkPhone(request.getParameter("phone"));
		if (check) {
			//判断是否传入验证码
			String verify = request.getParameter("verify");
			if (verify==null) {
				if (phoneverify!=null&&"123".equals(phoneverify)) {
					try {
						pgyuserService.update(pgyuser);
						return CommandResultUtil.resultJson(request, Mars.SUCCESS, UPDATE, HttpStatus.SC_OK, "绑定成功");
					} catch (MarsException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						log.info("错误信息:"+e);
						return CommandResultUtil.resultJson(request, Mars.FAIL, UPDATE, HttpStatus.SC_INTERNAL_SERVER_ERROR, "系统异常");
					}
				}
				return CommandResultUtil.resultJson(request, Mars.FAIL, UPDATE, HttpStatus.SC_OK, "手机验证码错误");
			}else {
				//判断手机验证码和图片验证码
				if (request.getParameter("verify").toUpperCase().equals(session.getAttribute("code"+request.getParameter("verify").toUpperCase()))&&"123".equals(phoneverify)) {
					session.removeAttribute("code"+request.getParameter("verify").toUpperCase());
					try {
						pgyuserService.update(pgyuser);
						return CommandResultUtil.resultJson(request, Mars.SUCCESS, UPDATE, HttpStatus.SC_OK, "绑定成功");
					} catch (MarsException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						log.info("错误信息:"+e);
						return CommandResultUtil.resultJson(request, Mars.FAIL, UPDATE, HttpStatus.SC_INTERNAL_SERVER_ERROR, "系统异常");
					}
				}
				session.removeAttribute("code"+request.getParameter("verify").toUpperCase());
				return CommandResultUtil.resultJson(request, Mars.FAIL, SELECT, HttpStatus.SC_OK, "验证码错误");
			}
			}
		return CommandResultUtil.resultJson(request, Mars.FAIL, SELECT, HttpStatus.SC_OK, "该手机号已被绑定");
	}
	
	
	/**
	 * 找回密码身份验证
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(value="open/retrievepassword",method={RequestMethod.POST})
	@ResponseBody
	public CommandEntity retrievepassword(HttpServletRequest request,HttpSession session){
		//获取手机验证码
		String phoneverify = request.getParameter("phoneVerify");
		Pgyuser pgyuser = new Pgyuser();
		pgyuser.setPhone(request.getParameter("phone"));
		pgyuser.setVersion(null);
		//判断是否传入验证码
		String verify = request.getParameter("verify");
		if (verify==null) {
			//判断手机验证码
			if (phoneverify!=null&&"123".equals(phoneverify)) {
				List<Pgyuser> userlist = pgyuserService.queryAll(pgyuser);
				if (userlist==null||userlist.size()==0) {
					return CommandResultUtil.resultJson(request, Mars.FAIL, SELECT, HttpStatus.SC_OK, "不存在该账户");
				}
					return CommandResultUtil.resultJson(request, Mars.SUCCESS, SELECT, HttpStatus.SC_OK, "验证成功");
			}
			return CommandResultUtil.resultJson(request, Mars.FAIL, SELECT, HttpStatus.SC_OK, "手机验证码错误");
		}else {
			List<Pgyuser> userlist = pgyuserService.queryAll(pgyuser);
			if (userlist==null||userlist.size()==0) {
				return CommandResultUtil.resultJson(request, Mars.FAIL, SELECT, HttpStatus.SC_OK, "不存在该账户");
			}
			//判断手机验证码和图片验证码
			if (request.getParameter("verify").toUpperCase().equals(session.getAttribute("code"+request.getParameter("verify").toUpperCase()))&&"123".equals(phoneverify)) {
				session.removeAttribute("code"+request.getParameter("verify").toUpperCase());
				return CommandResultUtil.resultJson(request, Mars.SUCCESS, SELECT, HttpStatus.SC_OK, "验证成功");
			}
			session.removeAttribute("code"+request.getParameter("verify").toUpperCase());
			return CommandResultUtil.resultJson(request, Mars.FAIL, SELECT, HttpStatus.SC_OK, "验证码不正确");
		}
	}
	
	
	/**
	 * 修改密码
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(value="open/updatepwd",method={RequestMethod.POST})
	@ResponseBody
	public CommandEntity updatepwd(HttpServletRequest request,HttpSession session){
		/*if (request.getParameter("version")==null) {
			return CommandResultUtil.resultJson(request, Mars.FAIL, SELECT, HttpStatus.SC_INTERNAL_SERVER_ERROR, "参数有误");
		}*/
		Pgyuser pgyuser = new Pgyuser();
		/*pgyuser.setVersion(Integer.valueOf(request.getParameter("version")));*/
		pgyuser.setNumber(request.getParameter("number"));
		pgyuser.setPassword(request.getParameter("oldpassword"));
		pgyuser.setVersion(null);
		//验证用户身份修改密码
		List<Pgyuser> userlist = pgyuserService.queryAll(pgyuser);
		if (userlist!=null&&userlist.size()!=0) {
			pgyuser.setPassword(request.getParameter("newpassword"));
			pgyuserService.updatepwd(pgyuser);
			return CommandResultUtil.resultJson(request, Mars.SUCCESS, UPDATE, HttpStatus.SC_OK, "修改成功");
		}
		return CommandResultUtil.resultJson(request, Mars.FAIL, SELECT, HttpStatus.SC_OK, "密码错误");
	}
	
	/**
	 * 查询主办方客户列表
	 * @param request
	 * @return
	 */
	@RequestMapping(value="unituserlist",method={RequestMethod.POST})
	@ResponseBody
	public ResultEntity<CommandUser> unituserlist(HttpServletRequest request){
		//TODO 需要对身份进行判断,管理员可查看所有用户
		CommandUser cUser = new CommandUser();
		String character =new CommandResultUtil().getCharacter(request);
		//判断是否是管理员
		if (character.equals("admin")) {
			try {
				//分页查询所有用户
				Pgyuser pgyuser = new Pgyuser();
				pgyuser.setExtra(request.getParameter("extra"));
				pgyuser.setVersion(null);
				pgyuser.setStatus(null);
				List<Pgyuser> list = pgyuserService.queryAll(pgyuser);
				cUser.setUList(CommandResultUtil.Pager(Integer.parseInt(request.getParameter("pageSize")), Integer.parseInt(request.getParameter("pageNum")), list));
				cUser.setTotal(list.size());
				cUser.setTotalPage(CommandResultUtil.Calculation(list.size(), Integer.parseInt(request.getParameter("pageSize"))));
			} catch (Exception e) {
				// TODO: handle exception
				log.error("{} ClassCastException");
			}
			return CommandResultUtil.resultJson(request, Mars.SUCCESS, SELECT, HttpStatus.SC_OK, "查询用户列表", cUser);
		}
		Pgyuser pgyuser = new Pgyuser();
		pgyuser.setCode(new CommandResultUtil().getUserid(request));
		pgyuser.setExtra(request.getParameter("extra"));
		//获取主办方下的用户列表
		Set<Pgyuser> pList = pgyuserService.unitlist(pgyuser);
		//去除重复用户
		List<Pgyuser> unlist = pList.stream().collect(
				Collectors.collectingAndThen(
				Collectors.toCollection(() -> new TreeSet<>(Comparator.comparing(Pgyuser::getNumber))), ArrayList::new)
				);
         unlist.forEach(p -> System.out.println(p));
         try {
        	 cUser.setUList(CommandResultUtil.Pager(Integer.parseInt(request.getParameter("pageSize")), Integer.parseInt(request.getParameter("pageNum")), unlist));
        	 cUser.setTotal(unlist.size());
        	 cUser.setTotalPage(CommandResultUtil.Calculation(unlist.size(), Integer.parseInt(request.getParameter("pageSize"))));
         } catch (Exception e) {
			// TODO: handle exception
			log.error("{} ClassCastException");
		}
		return CommandResultUtil.resultJson(request, Mars.SUCCESS, SELECT, HttpStatus.SC_OK, "查询用户列表", cUser);
	}
	
	
	 /**
	  * 修改账号状态
	  * @param request
	  * @return
	  */
	@RequestMapping(value="updatestate",method={RequestMethod.POST})
	@ResponseBody
	 public CommandEntity updatestate(HttpServletRequest request){
		 //TODO 需验证身份,管理员可修改
		 String state = request.getParameter("status");
		 /*String version = request.getParameter("version");*/
		 String character =new CommandResultUtil().getCharacter(request);
		 /*if (version==null) {
			 return CommandResultUtil.resultJson(request, Mars.FAIL, SELECT, HttpStatus.SC_INTERNAL_SERVER_ERROR, "参数有误");
		}*/
			//判断是否是管理员
		 if (character.equals("admin")) {
		 Pgyuser pgyuser = new Pgyuser();
		 pgyuser.setDbId(request.getParameter("dbid"));
		 pgyuser.setVersion(null);
		 if ("1".equals(state)) {
			try {
				//账号禁用
				pgyuser.setStatus(2);
				pgyuserService.update(pgyuser);
			} catch (MarsException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			try {
				//账号启用
				pgyuser.setStatus(1);
				pgyuserService.update(pgyuser);
			} catch (MarsException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		 return CommandResultUtil.resultJson(request, Mars.SUCCESS, UPDATE, HttpStatus.SC_OK, "修改成功");
	 }
		 return CommandResultUtil.resultJson(request, Mars.FAIL, UPDATE, HttpStatus.SC_OK, "无权修改");
	 }
	 
	 
	 
	 
	 
	 /**
	  * 用户信息回显
	  * @param request
	  * @return
	  */
	@RequestMapping(value="open/echomasg",method={RequestMethod.POST})
	@ResponseBody
	 public ResultEntity<Pgyuser> echomasg(HttpServletRequest request){
		ResultEntity<Pgyuser> result = new ResultEntity<>();
        String operatorCommand = "command." + SELECT;
		result.setCommand(SELECT);
		String commandTitle = LocaleUtil.getMessage(request, operatorCommand, new Object[] {});
		result.setCommandTitle(commandTitle);
        result.setCode(Mars.SUCCESS);
        result.setMessage("查询成功");
        result.setStatus(HttpStatus.SC_OK);
		 try {
			 Pgyuser pgyuser = pgyuserService.queryById(request.getParameter("userid"));
			 result.setData(pgyuser);
		} catch (Exception e) {
			// TODO: handle exception
		}
		 return result;
	 }
	 
	 
	 /**
	  * 编辑用户信息
	  * @return
	  */
	@RequestMapping(value="updatemasg",method={RequestMethod.POST})
	@ResponseBody
	 public CommandEntity updatemasg(HttpServletRequest request){
		 //TODO 验证用户身份
		String character =new CommandResultUtil().getCharacter(request);
		//判断是否是管理员
		if (character.equals("admin")) {
		 Pgyuser pgyuser = new Pgyuser();
		 /*String version = request.getParameter("version");*/
		 String number = request.getParameter("number");
		 String name = request.getParameter("name");
		 String email = request.getParameter("email");
		 String idcard = request.getParameter("idcard");
		 String password = request.getParameter("password");
		 boolean checknumber = true;
		 boolean checkemail = true;
		 boolean checkname = true;
		 boolean checkidcard = true;
		 if (number!=null) {
			checknumber = this.isMobileNO(number);
		}
		 if (email!=null) {
			  checkemail = email.matches(expr);
		}
		 if (name!=null) {
			  checkname = name.matches(validateStr);
		}
		 if (idcard!=null) {
			checkidcard = idcard.matches(regular);
		}
		 //验证参数格式
		 if (!checkemail|!checkname|!checkidcard|!checknumber){
				return CommandResultUtil.resultJson(request, Mars.FAIL, SELECT, HttpStatus.SC_INTERNAL_SERVER_ERROR, "参数有误");
		}
		 if (!this.checknumber(number)) {
			 return CommandResultUtil.resultJson(request, Mars.FAIL, SELECT, HttpStatus.SC_INTERNAL_SERVER_ERROR, "账号重复");
		}
		 pgyuser.setDbId(request.getParameter("dbid"));
		 pgyuser.setVersion(null);
		 pgyuser.setNumber(number);
		 pgyuser.setPhone(number);
		 pgyuser.setName(name);
		 pgyuser.setPassword(password);
		 pgyuser.setEmail(email);
		 pgyuser.setIdCard(request.getParameter("idcard"));
		 pgyuser.setArea(request.getParameter("area"));
		 pgyuser.setRemark(request.getParameter("remark"));
		 pgyuser.setStatus(null);
		 try {
			 //修改用户信息
			pgyuserService.update(pgyuser);
		} catch (MarsException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return CommandResultUtil.resultJson(request, Mars.FAIL, UPDATE, HttpStatus.SC_INTERNAL_SERVER_ERROR, "数据异常,修改失败");
		}
		 return CommandResultUtil.resultJson(request, Mars.SUCCESS, UPDATE, HttpStatus.SC_OK, "修改成功");
		}
		//主办方操作(不允许修改账号密码)
		 Pgyuser pgyuser = new Pgyuser();
		 /*String version = request.getParameter("version");*/
		 String name = request.getParameter("name");
		 String email = request.getParameter("email");
		 String idcard = request.getParameter("idcard");
		 boolean checkemail = true;
		 boolean checkname = true;
		 boolean checkidcard = true;
		 if (email!=null) {
			  checkemail = email.matches(expr);
		}
		 if (name!=null) {
			  checkname = name.matches(validateStr);
		}
		 if (idcard!=null) {
			checkidcard = idcard.matches(regular);
		}
		 //验证参数格式
		 if (!checkemail|!checkname|!checkidcard) {
				return CommandResultUtil.resultJson(request, Mars.FAIL, SELECT, HttpStatus.SC_INTERNAL_SERVER_ERROR, "参数有误");
		}
		 pgyuser.setDbId(request.getParameter("dbid"));
		 pgyuser.setVersion(null);
		 pgyuser.setName(name);
		 pgyuser.setEmail(email);
		 pgyuser.setIdCard(idcard);
		 pgyuser.setArea(request.getParameter("area"));
		 pgyuser.setRemark(request.getParameter("remark"));
		 pgyuser.setStatus(null);
		 try {
			 //修改用户信息
			pgyuserService.update(pgyuser);
		} catch (MarsException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return CommandResultUtil.resultJson(request, Mars.FAIL, UPDATE, HttpStatus.SC_INTERNAL_SERVER_ERROR, "数据异常,修改失败");
		}
		 return CommandResultUtil.resultJson(request, Mars.SUCCESS, UPDATE, HttpStatus.SC_OK, "修改成功");
	 }
	
	/**
	 * 后台登录
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value="open/login",method=RequestMethod.POST)
	@ResponseBody
	public ResultEntity<LoginEntity> login(HttpServletRequest request, HttpServletResponse response, Model model){
		LoginEntity loginEntity = new LoginEntity();
		ResultEntity<LoginEntity> lEntity = new ResultEntity<>();
        Map<String, String> params = new HashMap<>();
		Enumeration<String> em = request.getParameterNames();
		while (em.hasMoreElements()) {
			//获取from中所有带name属性的值并存储
			String key = (String) em.nextElement();
			params.put(key, request.getParameter(key));
		}
		params.put("clientip", URLUtil.getClientIp(request));
		//获取用户身份信息判断用户是否存才
		String character = params.get("character");
		if ("rater".equals(character)) {
			pgyraterService.checkrater(params);
		}
		if ("hostunit".equals(character)) {
			pgyhostunitService.checkunit(params);
		}
		if ("admin".equals(character)) {
			ogzuserService.checkadmin(params);
		}
		if (params.get("userid")==null) {
			params.put("status", "500");
			lEntity.setCode("100004");
			lEntity.setStatus(HttpStatus.SC_INTERNAL_SERVER_ERROR);
			String operatorCommand = "command." + SELECT;
			lEntity.setCommand(SELECT);
			String commandTitle = LocaleUtil.getMessage(request, operatorCommand, new Object[] {});
			lEntity.setCommandTitle(commandTitle);
			lEntity.setData(loginEntity);
			lEntity.setMessage("用户名密码不正确");
			return lEntity;
		}
		//创建并获取token和sessionid
		new PgyuserService().loginSuccess(params);
		String code = params.get("code");
		String message = params.get("message");
		message = StringUtils.isBlank(message) ? "成功" : message;
		loginEntity.setCode(code);
		loginEntity.setDbid(params.get("userid"));
		String token = params.get("token");
		loginEntity.setToken(token);
		String sessionId = params.get("sessionId");
		loginEntity.setSessionId(sessionId);
		loginEntity.setMessage(message);
		loginEntity.setCharacter(params.get("character"));
		lEntity.setCode(Mars.SUCCESS);
		String operatorCommand = "command." + SELECT;
		lEntity.setCommand(SELECT);
		String commandTitle = LocaleUtil.getMessage(request, operatorCommand, new Object[] {});
		lEntity.setMessage(message);
		lEntity.setCommandTitle(commandTitle);
		lEntity.setData(loginEntity);
		lEntity.setStatus(HttpStatus.SC_OK);
		return lEntity;
	}
	
	
	/**根据token获取用户部分信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="getmasg",method=RequestMethod.GET)
	@ResponseBody
	public String person(HttpServletRequest request){
		String header = request.getHeader("Authorization");
		if (StringUtils.isBlank(header) || !header.startsWith("Bearer ")) {
			log.error("{} No Authorization Found. ", Mars.LOG_PRE);
			throw new CmdException("000000");
		}
		String token = header.replaceAll("Bearer ", "");
		try {
			token = ApplicationUtil.parseTokenSubject(token);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return token;
	}
	
	
	/**
	 * 获取用户比赛列表
	 * @param request
	 * @return
	 */
	@RequestMapping(value="open/matchList",method=RequestMethod.POST)
	@ResponseBody
	public CommandEntity matchlist(HttpServletRequest request){
		ResultEntity<List<Pgymatch>> result = new ResultEntity<>();
		String userid = request.getParameter("userId");
		result.setCode(Mars.SUCCESS);
		result.setCommand(SELECT);
		String operatorCommand = "command." + SELECT;
		String commandTitle = LocaleUtil.getMessage(request, operatorCommand, new Object[] {});
		result.setMessage("查询成功");
		//查询用户参赛列表
		List<Pgymatch> list = pgyuserService.matchlist(userid);
		for (Pgymatch pgymatch : list) {
			String dbId = pgymatch.getDbId();
			//查询用户获奖信息
			Pgymatch pmh = pgymatchService.queryAwardUser(dbId, userid);
			if (pmh!=null) {
				pgymatch.setCompetitionstate("是");
			}else {
				pgymatch.setCompetitionstate("否");
			}
		}
		result.setCommandTitle(commandTitle);
		result.setData(list);
		return result;
	}
	
	
	/**
	 * 根据比赛ID删除比赛
	 * @param request
	 * @return
	 */
	@RequestMapping(value="removeMatch",method=RequestMethod.POST)
	@ResponseBody
	public CommandEntity removeMatch(HttpServletRequest request){
		String match = request.getParameter("matchId");
		Pgymatch pgymatch = new Pgymatch();
		pgymatch.setDbId(match);
		try {
			//移除比赛
			pgymatchService.delete(pgymatch);
		} catch (MarsException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return CommandResultUtil.resultJson(request, Mars.FAIL, "delete", HttpStatus.SC_INTERNAL_SERVER_ERROR, "系统异常,删除失败");
		}
		return CommandResultUtil.resultJson(request, Mars.SUCCESS, "delete", HttpStatus.SC_OK, "删除成功");
	}
	
	@Override 
	protected void beforeGoPage(String page, HttpServletRequest request, Model model) {
		
		super.beforeGoPage(page, request, model);
	}
	
	/**
	 * 
	 * @param request
	 * @return
	 *
	 *
	 * @api {GET} /pgyuser/query 
	 * @apiVersion 1.0.0
     * @apiName query
     * @apiGroup Pgyuser
     * @apiDescription 
     * @apiPermission 
     * 
     * @apiParam {String} version=v1 
     * @apiParam {Boolean} format=json 
     * @apiParam {Boolean} ignore=true 
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
     * @apiExample 
     * 	curl -i http://localhost:8080/mars-core/pgyuser/query?format=json&ignore=true&version=v1
     * 
     * @apiSuccess {String}   dbId 
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
     * @apiError NoAccessRight 
     * @apiError NoParamFormat format=json.
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
	 * 
	 * @param request
	 * @param pageModel
	 * @return
	 * 
	 * @api {GET} /pgyuser/page 
	 * @apiVersion 1.0.0
     * @apiName page
     * @apiGroup Pgyuser
     * @apiDescription 
     * @apiPermission 
     * 
     * @apiParam {String} version=v1 
     * @apiParam {Boolean} format=json 
     * @apiParam {Boolean} ignore=true 
     * @apiParam {Integer} pageNum=1 
     * @apiParam {Integer} pageSize=15 
     * @apiParam {String} order=asc 
     * @apiParam {String} sort 
     * @apiParam {String} code 
     * @apiParam {String} name 
     * 
     * @apiExample :
     * 	curl -i http://localhost:8080/mars-core/pgyuser/page?format=json&ignore=true&version=v1&pageNum=2&pageSize=20
     * 
     * @apiSuccess {List}   results 
     * @apiSuccess {Integer} pageNum 
     * @apiSuccess {Integer} pageSize 
     * @apiSuccess {Integer} totalRecord 
     * @apiSuccess {Integer} totalPage 
     * 
     * @apiError NoAccessRight 
     * @apiError NoParamFormat format=json.
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
	  
	
	@Override 
	protected void beforeQueryByPage(HttpServletRequest request, PageModel<? extends Entity> pageModel) {
		Entity ent = pageModel.getQueryParam();
		if (ent != null) {
			ent.setCreatedDt(null);
		}
	}
	
	
	@Override
	public CommandEntity doCommand(@ParameterAttribute(value = "") Pgyuser entity, HttpServletRequest request, @PathVariable String operator) {
		log.debug("{} doCommand : \"{}\" ", Mars.LOG_PRE, operator);
		return super.doCommand(entity, request, operator);
	}
	
	
	@Override
	protected void beforeCommand(HttpServletRequest request, Entity entity, String cmdCode) {
	}
	
	
	@Override
	protected void afterCommand(HttpServletRequest request, Entity entity, CommandEntity result, String cmdCode) {
	}
	
	
	//验证手机号码是否可用
	protected boolean checknumber(String number){
		Pgyuser pgyuser = new Pgyuser();
		pgyuser.setNumber(number);
		List<Pgyuser> pList = pgyuserService.queryAll(pgyuser);
		if (pList==null||pList.size()==0) {
			return true;
		}
		return false;
	}
}
