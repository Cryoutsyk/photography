package net.artron.view.pgyuser.model;

import lombok.Getter;
import lombok.Setter;
import net.mars.Entity;


/**
 * Pgyuser.
 *
 * @author 
 *
 */
@Getter
@Setter
@SuppressWarnings("serial")
public class Pgyuser extends Entity {
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
     * 创建时间.
     */
    private java.util.Date createDt;
}
