package net.artron.cms.pgymtannouncement.model;

import lombok.Getter;
import lombok.Setter;
import net.mars.Entity;


/**
 * Pgymtannouncement.
 *比赛公告
 * @author 
 *
 */
@Getter
@Setter
@SuppressWarnings("serial")
public class Pgymtannouncement extends Entity {

    /**
     * 比赛ID,.
     */
    private String mtId;
    /**
     * 标题,分组名称最多50个字.
     */
    private String title;
    /**
     * 作者,最多十个字.
     */
    private String author;
    /**
     * 富文本内容,.
     */
    private String textcontent;
    /**
     * 是否展示详细获奖列表,0展示,1不展示.
     */
    private Integer detailedaward;
    /**
     * 展示类型,0作品名和作者,1作品照片、作品名和作者.
     */
    private Integer showtype;
	public Pgymtannouncement() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Pgymtannouncement(String mtId) {
		super();
		this.mtId = mtId;
	}
    
    
    
}
