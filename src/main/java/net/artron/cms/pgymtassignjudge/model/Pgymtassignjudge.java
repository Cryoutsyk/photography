package net.artron.cms.pgymtassignjudge.model;

import lombok.Getter;
import lombok.Setter;
import net.mars.Entity;


/**
 * Pgymtassignjudge.
 *
 * @author 
 *
 */
@Getter
@Setter
@SuppressWarnings("serial")
public class Pgymtassignjudge extends Entity {

    /**
     * 比赛ID,.
     */
    private String mtId;
    /**
     * 评委ID,.
     */
    private String jdeId;
    /**
     * 评审状态,默认0开始评审,结束终评后状态为1评审结束.
     */
    private Integer reviewstate;
}
