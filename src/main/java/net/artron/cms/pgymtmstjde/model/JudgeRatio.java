package net.artron.cms.pgymtmstjde.model;

import lombok.Getter;
import lombok.Setter;

/**
 * 评委完成比例
 * @author Administrator
 *
 */
@Getter
@Setter
public class JudgeRatio {
	/**
	 * 数据库主键
	 */
	protected String dbId;
	/**
     * 头像.
     */
    private String imgUrl;
	 /**
     * 姓名.
     */
    private String name;
    
    /**
     * 评审总数
     */
    private Integer allcount;
    /**
     * 已完成数
     */
    private Integer yishenhe;
    /**
     * 完成百分比
     */
    private String bfb;
}
