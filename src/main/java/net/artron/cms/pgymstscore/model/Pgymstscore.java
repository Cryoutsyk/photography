package net.artron.cms.pgymstscore.model;

import lombok.Getter;
import lombok.Setter;
import net.mars.Entity;


/**
 * Pgymstscore.
 *稿件总得分
 * @author 
 *
 */
@Getter
@Setter
@SuppressWarnings("serial")
public class Pgymstscore extends Entity {

    /**
     * 稿件ID,.
     */
    private String mstId;
    /**
     * 得分,.
     */
    private Integer score;
}
