package net.artron.cms.ogzuser.model;

import lombok.Getter;
import lombok.Setter;
import net.mars.Entity;


/**
 * Ogzuser.
 *
 * @author 
 *
 */
@Getter
@Setter
@SuppressWarnings("serial")
public class Ogzuser extends Entity {
    /**
     * 用户ID，登陆名.
     */
    private String code;
    /**
     * 用户名称.
     */
    private String name;
    /**
     * 用户显示的名称.
     */
    private String displayName;
    /**
     * 用户登陆密码.
     */
    private String userPassword;
    /**
     * TBL_CORE_ORG的主键DB_ID.
     */
    private String orgDbId;
    /**
     * applicationName.
     */
    private String applicationName;
}
