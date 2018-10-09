package ${packageStr};

import lombok.Getter;
import lombok.Setter;
import net.mars.core.Entity;


/**
 * ${capitalModelName}
 *
 * @author 
 *
 */
@Getter
@Setter
@SuppressWarnings("serial")
public class ${capitalModelName} extends Entity{

	<#list columns as column>
    /**
     * ${column.columnComment}
     */
    private ${column.javaType} ${column.beanName};
    
    public void set${column.beanName?cap_first}(${column.javaType} ${column.beanName}) {
      this.${column.beanName} = ${column.beanName};
    }  
	
    public ${column.javaType} get${column.beanName?cap_first}() {
      return this.${column.beanName};
    }
    
	<#if column.primaryKeyBeanName?exists>
	/**
	 *主键字段
	 */
    public String getPrimaryKeyCode() {
      return "${column.primaryKeyBeanName}";
    }
    
    </#if> 
	</#list> 
}
