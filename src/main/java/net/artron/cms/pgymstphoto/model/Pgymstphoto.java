package net.artron.cms.pgymstphoto.model;

import org.hibernate.validator.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;
import net.mars.Entity;


/**
 * Pgymstphoto.
 *稿件图片
 * @author 
 *
 */
@Getter
@Setter
@SuppressWarnings("serial")
public class Pgymstphoto extends Entity {

    /**
     * 比赛ID,.
     */
    private String mtId;
    /**
     * 稿件ID,.
     */
    private String mstId;
    /**
     * 照片文件名,.
     */
    @NotBlank(message = "照片文件名不能为空")
    private String name;
    /**
     * 照片地址,.
     */
    @NotBlank(message = "照片地址不能为空")
    private String photourl;
    /**
     * MD5码,.
     */
    @NotBlank(message = "照片编码不能为空")
    private String md5code;
}
