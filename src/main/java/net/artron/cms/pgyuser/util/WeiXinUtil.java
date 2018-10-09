package net.artron.cms.pgyuser.util;

import net.artron.cms.pgyuser.model.AccessToken;
import net.artron.cms.pgyuser.model.Pgyuser;
import net.artron.cms.pgyuser.model.WeixinOauth2Token;
import net.sf.json.JSONObject;

public class WeiXinUtil {
	
	public final static String access_token_url="https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";
	public final static String oauth2_1_url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
	public final static String oauth2_2_url = "https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN";
	public final static String get_userInfo_url="https://open.weixin.qq.com/connect/oauth2/authorize?appid=APPID&redirect_uri=REDIRECT_URI&response_type=code&scope=SCOPE&state=STATE#wechat_redirect";
	public final static String get_hangye_url = "https://api.weixin.qq.com/cgi-bin/template/api_set_industry?access_token=ACCESS_TOKEN";
	public final static String appid="";
	public final static String appSecret="";
	
	
	/**
	 * 获取accesstoken
	 * @param appid
	 * @param appSecret
	 * @return
	 */
	public static AccessToken getAccessToken(String appid, String appSecret) {
		String requestUrl = access_token_url.replace("APPID", appid).replace("APPSECRET", appSecret);
		AccessToken accesstoken=new AccessToken();
		//得到json对象
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "GET", null);
		
		//将得到的json对象的属性值，存到accesstoken中
		accesstoken.setToken(jsonObject.getString("access_token"));
		accesstoken.setExpiresIn(jsonObject.getInt("expires_in"));
		return accesstoken;
	} 
	
	
    public static WeixinOauth2Token getOauth2AccessToken(String appId,String appSecret,String code) {
		
		String  requestUrl=oauth2_1_url.replace("APPID", appId).replace("SECRET", appSecret).replace("CODE", code);
		//发送请求获取网页授权凭证
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, EnumMethod.GET.name(), null);
		WeixinOauth2Token   wxo=new WeixinOauth2Token();
		wxo.setAccessToken(jsonObject.getString("access_token"));
		wxo.setExpiresIn(jsonObject.getInt("expires_in"));
		wxo.setRefreshToken(jsonObject.getString("refresh_token"));
		wxo.setOpenId(jsonObject.getString("openid"));
		wxo.setScope(jsonObject.getString("scope"));
		
		return wxo;
		
	}
	
	/**
	 * 获取用户基本信息
	 * @param accessToken
	 * @param openId
	 * @return
	 */
	public static Pgyuser getSNSUserInfo(String accessToken,String openId) {
		String requestUrl=oauth2_2_url.replace("ACCESS_TOKEN", accessToken).replace("OPENID", openId);
		Pgyuser pgyuser=new Pgyuser();
		//通过网页授权获取用户信息
		JSONObject jsonObject=CommonUtil.httpsRequest(requestUrl, EnumMethod.GET.name(), null);
		pgyuser.setOpenId(jsonObject.getString("openid"));
		pgyuser.setName(jsonObject.getString("nickname"));
		pgyuser.setType("W");
		pgyuser.setStatus(1);
		return pgyuser; 
	}
}
