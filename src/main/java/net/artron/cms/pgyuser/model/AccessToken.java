package net.artron.cms.pgyuser.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AccessToken {

	//登录凭证
	private String token;
	//凭证有效时间         单位:秒
	private int expiresIn;
}
