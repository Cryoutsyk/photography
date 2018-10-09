package net.artron.cms.pgymtmstjde.model;

import lombok.Getter;
import lombok.Setter;
import net.mars.PageModel;
@Getter
@Setter
@SuppressWarnings({ "serial", "rawtypes" })
public class PageModelHelper<T> extends PageModel {
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
