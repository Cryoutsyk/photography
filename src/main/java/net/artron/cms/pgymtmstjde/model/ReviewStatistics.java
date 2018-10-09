package net.artron.cms.pgymtmstjde.model;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewStatistics {
	private String mt_id;
	private String mst_id;
	private Integer status;
	private List<Statistics> statistics;
}
