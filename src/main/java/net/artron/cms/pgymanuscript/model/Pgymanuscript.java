package net.artron.cms.pgymanuscript.model;

import java.util.List;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;
import net.artron.cms.pgymstphoto.model.Pgymstphoto;
import net.artron.cms.pgymstscore.model.Pgymstscore;
import net.mars.Entity;


/**
 * Pgymanuscript.
 *稿件
 * @author 
 *
 */
@Getter
@Setter
@SuppressWarnings("serial")
public class Pgymanuscript extends Entity {

	/**
	 * 奖项ID
	 */
	private String adid;
	/**
	 * 单张/组照-文本
	 */
	private String msttypetext;
	/**
	 * 渠道-文本
	 */
	private String channeltext;
	
	/**
	 * 获奖情况
	 */
	private String adname;
	/**
	 * 参赛组
	 */
	private String gpname;
	/**
	 * 张数
	 */
	private Integer ptcount;
	
	/**
	 * 作品照片
	 */
	private String firstpturl;
	
	/**
	 * 上传账号
	 */
	private String upusername;
    /**
     * 序号,比赛序号+000001,从1开始递增,6位不够补0 例如： 20180829002309000001.
     */
    private String code;
    /**
     * 比赛ID,.
     */
    @NotBlank(message = "比赛ID不能为空")
    private String mtId;
    /**
     * 作品题目,最多二十字.
     */
    @NotBlank(message = "作品题目不能为空")
	@Length( max = 40, message = "作品题目最多20个字")
    private String name;
    /**
     * 作者,最多十个字.
     */
    @NotBlank(message = "作者不能为空")
	@Length( max = 20, message = "作者最多10个字")
    private String author;
    /**
     * 作品简介,最多一百字.
     */
    private String details;
    /**
     * 参赛组ID,.
     */
    @NotBlank(message = "参赛组ID不能为空")
    private String mtGpId;
    /**
     * 单张、组照,0单张,1组照.
     */
    private Integer msttype;
    /**
     * 渠道,0当前渠道,1上传.
     */
    @NotNull(message = "渠道不能为空")
    private Integer channel;
    /**
     * 前端用户id,前端账号ID.
     */
    private String userId;
    
    /**
     * 稿件状态-初评,默认0待审核,1通过,2不通过
     */
    private Integer mststate;
    
    /**
     * 稿件状态-初评,默认0待审核,1通过,2不通过；初评结果.
     */
    private Integer mststate1;
    /**
     * 稿件状态-初步终评,默认0待审核,1通过,2不通过；初步中评结果.
     */
    private Integer mststate2;
    /**
     * 得分数,保留两位小数.
     */
    private Double votes;
    
    /**
     * 照片列表
     */
    private List<Pgymstphoto>  mstphotos;
    
    
    /**
     * 得分列表
     */
    private List<Pgymstscore> mstscores;
    /**
     * 照片json数组信息
     */
    private String production;
    
    /**
     * 照片原始名不带-和后缀
     */
    private String photoname;// PHOTONAME
    
    /**
     * 查询状态标识1为整理结果状态1,2为初步中评状态2
     */
    private Integer statenum;
    /**
	 *  0待审核,1通过,2不通过   不传是全部 
	 */
	private Integer tab;
	
	/**
	 * 前端当前要评审的状态
	 */
	private Integer auditstate;
	
	/**
	 * 第一张照片
	 */
	private String photourl;
	
	/**
	 * 不传为全部,0为评分,1已评分
	 */
	private Integer score;
}
