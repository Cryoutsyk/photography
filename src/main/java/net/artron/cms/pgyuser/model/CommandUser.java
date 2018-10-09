package net.artron.cms.pgyuser.model;

import java.util.List;
import java.util.Set;

import lombok.Getter;
import lombok.Setter;
import net.mars.Entity;
import net.mars.PageModel;

@Getter
@Setter
public class CommandUser {

	private Pgyuser pgyuser;
	
	private List<Pgyuser> uList;
	
	private Set<Pgyuser> sList;
	
	private PageModel<? extends Entity> list;
	/**
	 * 总条数
	 */
	private int total;
	/**
	 * 总页数
	 */
	private int totalPage;
}
