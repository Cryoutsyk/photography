package net.artron.cms.pgyhostunit.model;

import lombok.Getter;
import lombok.Setter;
import net.artron.organization.Organization;


/**
 * Pgyhostunit.
 *
 * @author 
 *
 */
@Getter
@Setter
@SuppressWarnings("serial")
public class Pgyhostunit extends Organization {
    /**
     * 单位名称.
     */
    private String companyName;
    /**
     * 联系人姓名.
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
     * 地址.
     */
    private String address;
    /**
     * 账号.
     */
    private String accountNumber;
    /**
     * 密码.
     */
    private String password;
    /**
     * 备注.
     */
    private String remarks;
    /**
     * 创建时间.
     */
    private java.util.Date createdDt;
    /**
     * 序号,比赛序号+000001,从1开始递增,6位不够补0
     */
    private String code;
}
