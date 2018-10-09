package net.artron.cms.pgymtassignjudge.model;

import lombok.Getter;
import lombok.Setter;
import net.mars.Entity;

@Getter
@Setter
public class Pgycheckrater {

	private String db_id;
	private String img_url;
	private String name;
	private String good_type;
	private Integer checkrater;
}
