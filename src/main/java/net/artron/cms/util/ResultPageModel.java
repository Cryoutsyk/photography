package net.artron.cms.util;

import lombok.Getter;
import lombok.Setter;
import net.mars.PageModel;
@Setter
@Getter
@SuppressWarnings({ "serial", "rawtypes" })
public class ResultPageModel<T> extends PageModel {

	/**
	 * 比赛状态 0未征稿,1征稿中,2征稿结束,3开始初评,4结束初评,5开始终评,6开始初步终评,7开始评分终评,8结束终评,9公示中,10已结束;2-8为评选中
	 */
	private String mtstatus;
	
}
