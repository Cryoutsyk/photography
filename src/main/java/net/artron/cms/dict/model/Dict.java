package net.artron.cms.dict.model;

import lombok.Getter;
import lombok.Setter;
import net.mars.Entity;


/**
 * Dict.
 *
 * @author 
 *
 */
@Getter
@Setter
@SuppressWarnings("serial")
public class Dict extends Entity {
    /**
     * 数据值.
     */
    private String value;
    /**
     * 标签名.
     */
    private String label;
    /**
     * 类型.
     */
    private String type;
    /**
     * 描述.
     */
    private String description;
    /**
     * 排序（升序）.
     */
    private Double sort;
    /**
     * 父级编号.
     */
    private String parentId;
    /**
     * 创建者.
     */
    private String createBy;
    /**
     * 创建时间.
     */
    private java.util.Date createDate;
    /**
     * 更新者.
     */
    private String updateBy;
    /**
     * 更新时间.
     */
    private java.util.Date updateDate;
    /**
     * 备注信息.
     */
    private String remarks;
    /**
     * 删除标记.
     */
    private String delFlag;
}
