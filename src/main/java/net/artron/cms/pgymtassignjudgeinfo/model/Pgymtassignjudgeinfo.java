package net.artron.cms.pgymtassignjudgeinfo.model;

import java.util.List;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import net.artron.cms.pgymtassignjudge.model.Pgycheckrater;
import net.mars.Entity;


/**
 * Pgymtassignjudgeinfo.
 *
 * @author 
 *
 */
@Getter
@Setter
@SuppressWarnings("serial")
public class Pgymtassignjudgeinfo extends Entity {

    /**
     * 比赛ID,.
     */
	@NotBlank(message = "比赛ID不能为null")
    private String mtId;
	
    /**
     * 分配方式,0按数量均分,1评审全部作品.
     */
	@NotNull(message = "分配方式不能为null")
//	@Pattern(regexp = "[0-1]", message = "分配方式错误")
    private Integer assigntype;
	
    /**
     * 截止时间,.
     */
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")  
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private java.util.Date endtime;
	
	@NotBlank(message = "截止时间不能为null")
	private String etime;
	
    /**
     * 初审作品总数,.
     */
    private Integer totalworks;
    /**
     * 已选评委数,.
     */
    private Integer checkedjudge;
    /**
     * 每人评审作品数,.
     */
    private Integer averagework;
    /**
     * 备注,.
     */
	@Length( max = 1000, message = "备注最多500个字")
    private String note;
    /**
     * 查询返回选中评委
     */
    private List<Pgycheckrater> pgycheckrater;
    /**
     * 选中评委ID(asd,asd,asd)
     */
    @NotBlank(message = "选中评委不能为空")
    private String checkrater;
}
