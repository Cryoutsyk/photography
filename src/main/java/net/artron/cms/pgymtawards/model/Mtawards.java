package net.artron.cms.pgymtawards.model;

import java.util.Date;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import net.mars.common.util.JacksonUtil;

/**
 * Pgymtawards.
 *
 * @author
 *
 */
@Getter
@Setter
public class Mtawards  {

	/**
	 * 数据库主键
	 */
	protected String dbId;
	/**
	 * 比赛ID,.
	 */
	private String mtId;
	/**
	 * 奖项名称,奖项名称最多10个字.
	 */
	@NotBlank(message = "奖项名称不能为null")
	@Length(min = 1, max = 20, message = "奖项名称不能为空,最多10个字")
	private String name;
	/**
	 * 获奖人数,.
	 */
	@NotNull(message = "获奖人数不能为null")
	@Min(1)
	private Integer awardcount;
	
	/**
	 * 创建人
	 */
	protected String createdBy;

	/**
	 * 创建时间
	 */
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")  
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	protected Date createdDt = new Date();

	/**
	 * 修改人
	 */
	protected String updatedBy;

	/**
	 * 修改时间
	 */
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")  
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	protected Date updatedDt = new Date();

	/**
	 * 并发控制版本号
	 */
	protected Integer version = 0;

	/**
	 * 顺序
	 */
	protected Integer tabIndex = 0;

	public String toJson() {
		return JacksonUtil.doJackson(this);
	}
	
}
