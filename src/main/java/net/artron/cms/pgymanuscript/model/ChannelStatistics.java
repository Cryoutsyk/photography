package net.artron.cms.pgymanuscript.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
/**
 * 
* @ClassName: ChannelStatistics 
* @Description: 稿件统计
* @author mrshi-admin
* @date 2018年9月28日 下午4:33:01 
*
 */
@Getter
@Setter
public class ChannelStatistics {
	/**
	 * 全部稿件数
	 */
	private Integer allcount;
	/**
	 * 当前渠道稿件数
	 */
	private Integer dqcount;
	/**
	 * 上传稿件数
	 */
	private Integer sccount;
	/**
	 * 最后一次上传稿件时间
	 */
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")  
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	private Date lastTime;
}
