package net.artron.cms.pgymtmstjde.model;

import lombok.Getter;
import lombok.Setter;
import net.mars.Entity;

/**
 * 评委稿件-评委评审数据
 * @author sunmingsheng
 *
 */
//@SuppressWarnings("serial")
@Getter
@Setter
@SuppressWarnings("serial")
public class RaterMst extends Entity{
	
	/**
	 *  0待审核,1通过,2不通过   不传是全部 
	 */
	private Integer tab;
	/**
	 * 评委分配稿件-主键
	 */
	private String dbId;
	/**
	 * 比赛ID
	 */
	private String mtid;
	
	/**
	 * 评委ID
	 */
	private String jdeid;
	/**
	 *  审核状态 默认0待审核,1通过,2不通过
	 */
	private Integer auditstate;

	 /**
     * 稿件ID.
     */
    private String mstid;
    
    /**
     * 作品题目
     */
    private String name;
    
    /**
     * 作者
     */
    private String author;
    
    /**
     * 作品简介
     */
    private String details;
    
    /**
     * 分组ID
     */
    private String mtgpid;
   
    /**
     * 单张、组照 0单张,1组照
     */
    private Integer msttype;
    
    /**
     * 渠道
     */
    private Integer channel;
    /**
     * 首张图片地址
     */
    private String photourl;
	
}
