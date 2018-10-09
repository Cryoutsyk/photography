package net.artron.cms.pgymtgroup.model;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;
import net.mars.Entity;


/**
 * Pgymtgroup.
 *
 * @author 
 *
 */
@Getter
@Setter
@SuppressWarnings("serial")
public class Pgymtgroup extends Entity {

    /**
     * 比赛ID,.
     */
    private String mtId;
    /**
     * 分组名称,分组名称最多10个字.
     */
    @NotBlank(message = "分组名称不能为null")
	@Length(min = 1, max = 20, message = "分组名称不能为空,最多10个字")
    private String name;
}
