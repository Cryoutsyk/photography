package net.artron.cms.pgyuser.model;

import java.io.Serializable;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import net.artron.organization.user.model.User;
@Getter
@Setter
public class Usermasg implements Serializable{
	private static final long serialVersionUID = 6030140987987727368L;

	/**
	 * 当前登录用户.
	 */
	protected Pgyuser user;
	
	/**
	 * 登录日期
	 */
	protected String loginDate;
	
	/**
	 * 登录IP
	 */
	protected String loginIp;
	
	protected Integer loginTryNum = 0; // 尝试登录的次数
	
	protected volatile Boolean locked = false; // 该帐号是否被锁定
	
	protected Date lockedDate = new Date(); // 被锁定的日期
}
