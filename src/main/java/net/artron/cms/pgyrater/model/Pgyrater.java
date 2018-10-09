
package net.artron.cms.pgyrater.model;

import lombok.Getter;
import lombok.Setter;
import net.artron.organization.Organization;


/**
 * Pgyrater.
 *评委
 * @author 
 *
 */
@Getter
@Setter
@SuppressWarnings("serial")
public class Pgyrater extends Organization {
    /**
     * 姓名.
     */	
    private String name;
    /**
     * 手机号.
     */
    private String telphone;
    /**
     * 邮箱.
     */
    private String email;
    /**
     * 所在单位.
     */
    private String companyName;
    /**
     * 职务.
     */
    private String duties;
    /**
     * 账号.
     */
    private String accountNumber;
    /**
     * 密码.
     */
    private String password;
    /**
     * 头像.
     */
    private String imgUrl;
    /**
     * 擅长类型.
     */
    private String goodType;
    /**
     * 备注.
     */
    private String remarks;
    /**
     * 主办单位id.
     */
    private String hostUnitId;
    /**
     * 创建时间.
     */
    private java.util.Date createdDt;
}

