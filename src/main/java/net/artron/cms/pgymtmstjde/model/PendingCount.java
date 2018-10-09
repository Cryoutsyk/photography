package net.artron.cms.pgymtmstjde.model;

import lombok.Getter;
import lombok.Setter;

/**
 * 评审页头部数量
 * @author Administrator
 *
 */
@Getter
@Setter
public class PendingCount {

	/**
	 * 待审数
	 */
	public Integer dscount;
	/**
	 * 通过数
	 */
	public Integer tgcount;
	/**
	 * 未通过数
	 */
	public Integer wtgcount;
	/**
	 * 总数
	 */
	public Integer allcount;

}
