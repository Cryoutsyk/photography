package net.artron.cms.pgyuser.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LoginEntity {
	
	/**
	 * 用户主键
	 */
	private String dbid;
	/**
	 * 状态编码.
	 */
	private String code;

	/**
	 * 状态信息描述.
	 */
	private String message;

	/**
	 * 会话ID.
	 */
	private String sessionId;
	
	/**
	 * token.
	 */
	private String token;
	
	/**
	 * 状态码.
	 */
	private Integer status;
	
	/**
	 * 角色
	 */
	private String character;
}
