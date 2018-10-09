package net.artron.cms.pgyuser.model;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;

import lombok.Getter;
import lombok.Setter;
import net.artron.organization.Organization;
import net.mars.Entity;


/**
 * Pgyuser.(性别,年龄,居住国家,擅长题材,详细地址)
 *
 * @author 
 *
 */
@Getter
@Setter
@SuppressWarnings("serial")
public class Pgyuser extends Organization {
    /**
     * 登录账号(手机号).
     */
    private String number;
    /**
     * 登录密码.
     */
    private String password;
    /**
     * 绑定手机号.
     */
    private String phone;
    /**
     * 用户姓名.
     */
    private String name;
    /**
     * 居住地.
     */
    private String area;
    /**
     * 身份证号码.
     */
    private String idCard;
    /**
     * 电子邮箱.
     */
    private String email;
    /**
     * 备注.
     */
    private String remark;
    /**
     * 第三方id.
     */
    private String openId;
    /**
     * 账号类型(P:手机号 Q:qq号 W:微信号).
     */
    private String type;
    /**
     * 额外参数
     */
    private String extra;
    /**
     * 创建时间.
     */
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")  
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private java.util.Date createDt;
    /**
     * 修改时间
     */
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")  
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private java.util.Date updateDt;
}
