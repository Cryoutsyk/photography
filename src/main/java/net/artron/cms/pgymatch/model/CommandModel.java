package net.artron.cms.pgymatch.model;

import java.util.List;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import lombok.Getter;
import lombok.Setter;
import net.artron.cms.pgymtawards.model.Pgymtawards;
import net.artron.cms.pgymtgroup.model.Pgymtgroup;
import net.artron.cms.pgymttext.model.Pgymttext;

@Getter
@Setter
public class CommandModel {

	/*
	 * 比赛对象
	 */
	@NotNull(message="比赛不能为null")
	@Valid
	private Pgymatch match;
	/*
	 * 奖项列表
	 */
	@NotNull(message="奖项列表不能为null")
	@Valid
	private List<Pgymtawards>  mtawards;
	/*
	 * 分组列表
	 */
	@NotNull(message="分组列表不能为null")
	@Valid
	private List<Pgymtgroup>  mtgroup;
//	/*
//	 * 富文本列表
//	 */
//	@NotNull(message="文本列表不能为null")
//	@Valid
//	private List<Pgymttext>  mttext;
}
