package net.artron.cms.pgymttext.model;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;
import net.mars.Entity;


/**
 * Pgymttext.
 *
 * @author 
 *
 */
@Getter
@Setter
@SuppressWarnings("serial")
public class Pgymttext extends Entity {

    /**
     * 比赛ID,.
     */
    private String mtId;
    /**
     * 类型,字典表取,,,1征集内容,2奖项设置,3征稿细则,4投稿方式,5日程安排,6特别说明.
     */
	@NotBlank(message = "类型不能为null")
	@Pattern(regexp = "[123456]", message = "类型只能为1或2或3或4或5或6")
    private String texttype;
    /**
     * 文本内容,带格式文本框,最多500字.
     */
	@NotNull(message = "文本内容不能为null")
	@Length(max = 1000, message = "文本内容最多500个字")
    private String textcontent;
}
