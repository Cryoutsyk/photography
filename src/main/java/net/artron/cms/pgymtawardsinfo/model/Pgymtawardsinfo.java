package net.artron.cms.pgymtawardsinfo.model;

import lombok.Getter;
import lombok.Setter;
import net.mars.Entity;


/**
 * Pgymtawardsinfo.
 *
 * @author 
 *
 */
@Getter
@Setter
@SuppressWarnings("serial")
public class Pgymtawardsinfo extends Entity {

    /**
     * 奖项ID,.
     */
    private String adId;
    /**
     * 稿件ID,.
     */
    private String mstId;
}
