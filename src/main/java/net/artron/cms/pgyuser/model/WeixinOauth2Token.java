package net.artron.cms.pgyuser.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class WeixinOauth2Token {

private  String accessToken;
	
	//凭证有效时长
	private int expiresIn;
	
	//用于刷新凭证
	private String refreshToken;
	
	//用户标识
	private String openId;
	
	//用户授权作用域
	private String scope;
}
