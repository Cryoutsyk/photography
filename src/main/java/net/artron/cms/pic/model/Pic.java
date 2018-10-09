package net.artron.cms.pic.model;

import lombok.Getter;
import lombok.Setter;
import net.mars.Entity;


/**
 * Pic.
 *
 * @author 
 *
 */
@Getter
@Setter
@SuppressWarnings("serial")
public class Pic extends Entity {
    /**
     * 头像.
     */
    private String imgUrl;
    /**
     * 跳转的id值.
     */
    private String urlId;
}
