package net.artron.cms.pgymatch.model;

import java.util.List;

import javax.validation.Valid;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import net.artron.cms.pgymanuscript.model.ChannelStatistics;
import net.artron.cms.pgymtawards.model.Pgymtawards;
import net.artron.cms.pgymtgroup.model.Pgymtgroup;
import net.mars.Entity;

/**
 * Pgymatch.
 *
 * @author
 *
 */
@Getter
@Setter
@SuppressWarnings("serial")
public class Pgymatch extends Entity {

	/**
	 * 序号,8位年月日+4位主办单位编号+2位正整数序号（每日从01开始累计）例如： 20180829002309按创建顺序倒序排列.
	 */
	private String code;
	
	private String huid;//HU_ID
	/**
	 * 比赛名称,比赛名称最多五十个字.
	 */
	@NotBlank(message = "比赛名称不能为null")
	@Length(min = 1, max = 100, message = "比赛名称不能为空,最多50个字")
	private String name;
	/**
	 * 征稿开始时间,.
	 */
//	@NotNull(message = "征稿开始时间不能为null")
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")  
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	private java.util.Date draftstarttime;
	/**
	 * 征稿结束时间,到结束时间后更改比赛状态为征稿结束(自动)，不直接进入初评.
	 */
//	@NotNull(message = "征稿结束时间不能为null")
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")  
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	private java.util.Date draftendtime;
	
	@NotBlank(message = "征稿开始时间不能为null")
	private String draftstime;
	
	@NotBlank(message = "征稿结束时间不能为null")
	private String draftetime;
	
	/**
	 * 首页大图,.
	 */
	@NotBlank(message = "首页大图不能为null")
	@Length(min = 1, max = 200, message = "首页大图不能为空,地址最长为200字符")
	private String homebigimg;
	// /*
	// * 首页大图文件
	// */
	// private MultipartFile filehomebigimg;

	/**
	 * 封面大图,.
	 */
	@NotBlank(message = "封面大图不能为null")
	@Length(min = 1, max = 200, message = "封面大图不能为空,地址最长为200字符")
	private String coverbigimg;
	/**
	 * 主办单位,主办单位名称最多三十个字.
	 */
	@NotBlank(message = "主办单位不能为空")
	@Length(min = 1, max = 60, message = "主办单位最多30个字")
	private String organizer;
	/**
	 * 协办单位,协办单位名称最多一百个字.
	 */
	@Length(max = 200, message = "协办单位最多100个字")
	private String coorganizer;
	/**
	 * 最高奖励,最高奖励最多20个字.
	 */
	@NotBlank(message = "最高奖励不能为空")
	@Length(min = 1, max = 40, message = "最高奖励最多20个字")
	private String highestreward;
	/**
	 * 个人投稿数量限制,0不限制,>0为限制数量,默认0不限制.
	 */
	@NotNull(message = "个人投稿数量限制不能为null")
	@Min(0)
	private Integer individuallimit;
	/**
	 * 在线状态,1在线,0下线,默认0下线.
	 */
	// @Range(min = 0, max = 1, message = "在线状态只能是0/1")
	private Integer onlinestate;
	/**
	 * 比赛状态,取字典,,,默认0未征稿,1征稿中,2征稿结束,3开始初评,4结束初评,5开始终评,6开始初步终评,7开始投分终评,8结束终评,9公示中,10比赛结束;2-8为评选中.
	 */
	// @Pattern(regexp = "[0-10]", message = "在线状态只能为0-10")
	private String competitionstate;
	/*
	 * 在线状态-文字
	 */
	private String onlinestatetext;
	/*
	 * 比赛状态-文字
	 */
	private String competitionstatetext;
	
	/*
	 * 奖项列表
	 */
//	@NotNull(message="奖项列表不能为null")
//	@Valid
//	private List<Pgymtawards>  mtawards;
	/*
	 * 分组列表
	 */
//	@NotNull(message="分组列表不能为null")
//	@Valid
//	private List<Pgymtgroup>  mtgroup;
	
	/*
	 * 奖项列表
	 */
	@NotBlank(message = "奖项不能为null")
	private String mtawards;
	/*
	 * 分组列表
	 */
	@NotBlank(message = "分组不能为null")
	private String  mtgroup;
	
	/**
	 * 征稿渠道统计
	 */
	private ChannelStatistics channelstatistics;
	
	/**
	 * 征集内容
	 */
	@NotBlank(message = "征集内容不能为null")
	@Length(min=1, max = 1000, message = "征集内容最多500个字")
	private String collectioncontents;
	/**
	 * 奖项设置
	 */
	@NotBlank(message = "奖项设置不能为null")
	@Length(min=1, max = 1000, message = "奖项设置最多500个字")
	private String awards;
	/**
	 * 征稿细则
	 */
	@NotBlank(message = "征稿细则不能为null")
	@Length(min=1, max = 1000, message = "征稿细则最多500个字")
	private String draftrules;
	/**
	 * 投稿方式
	 */
	@NotBlank(message = "投稿方式不能为null")
	@Length(min=1, max = 1000, message = "投稿方式最多500个字")
	private String submission;
	/**
	 * 日程安排
	 */
	@Length(max = 1000, message = "日程安排最多500个字")
	private String schedule;
	/**
	 * 特别说明
	 */
	@Length(max = 1000, message = "特别说明最多500个字")
	private String specialdescription;
	
	/**
	 * 上传稿件数
	 */
	private Integer mstcount;
	
	private String date;//用于查询日期
	
	public Pgymatch() {
		super();
	}
	
	public Pgymatch(String dbId) {
		super();
		super.setDbId(dbId);
	}
	
	
	
	
}
