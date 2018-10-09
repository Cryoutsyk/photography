package net.artron.cms.util;

/**
 * 角色枚举
 * 
 * @author sunmingsheng
 *
 */
public enum EnumRole {
	admin(1, "超级管理员"), hostunit(2, "主办方"), rater(3, "评委");
	private int code;
	private String name;

	private EnumRole(int code, String name) {
		this.code = code;
		this.name = name();
	}

	public int getCode() {
		return code;
	}

	public String getName() {
		return name;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return this.getName();// +"---"+this.getCode();
	}
}
