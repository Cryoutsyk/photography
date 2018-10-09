package net.artron.cms.pgymtmstjde.model;

import lombok.Getter;
import lombok.Setter;
import net.mars.Entity;


/**
 * Pgymtmstjde.
 *评委初评
 * @author 
 *
 */
@Getter
@Setter
@SuppressWarnings("serial")
public class Pgymtmstjde extends Entity {

    /**
     * 比赛ID,.
     */
    private String mtId;
    /**
     * 稿件ID,.
     */
    private String mstId;
    /**
     * 评委ID,.
     */
    private String jdeId;
    /**
     * 审核状态,默认0待审核,1通过,2不通过.
     */
    private Integer auditstate;
}
