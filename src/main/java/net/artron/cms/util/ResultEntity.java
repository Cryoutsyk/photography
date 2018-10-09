package net.artron.cms.util;

import lombok.Getter;
import lombok.Setter;
import net.mars.core.command.CommandEntity;

@Setter
@Getter
public class ResultEntity<T> extends CommandEntity {
	/**
	* 
	*/
	private static final long serialVersionUID = 1L;
	private T data;
	public ResultEntity() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ResultEntity(T data,Integer status) {
		super();
		this.setStatus(status);
		this.data = data;
	}
	
	
	
	
}
