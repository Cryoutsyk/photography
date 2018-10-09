package ${packageStr};

import lombok.Getter;
import lombok.Setter;
import net.mars.Entity;


/**
 * ${capitalModelName}.
 *
 * @author 
 *
 */
@Getter
@Setter
@SuppressWarnings("serial")
public class ${capitalModelName} extends Entity {
	<#list beanColumns as column>
    /**
     * ${column.columnComment}.
     */
    private ${column.javaType} ${column.beanName};
	</#list> 
}
