package net.artron.cms.pgymtawards.model;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;
import net.mars.Entity;

/**
 * Pgymtawards.
 *
 * @author
 *
 */
@Getter
@Setter
@SuppressWarnings("serial")
public class Pgymtawards extends Entity {

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
}
