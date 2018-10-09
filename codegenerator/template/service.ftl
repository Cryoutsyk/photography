package ${packageStr};
 
import javax.annotation.Resource;
import org.springframework.stereotype.Service; 

import net.mars.core.service.ApplicationService;

import ${packageName}.model.${capitalModelName};
import ${packageName}.mapper.${capitalModelName}Mapper;

/**
 * Service.
 *
 * @author 
 */
@Service(value = "${modelName}Service")
public class ${capitalModelName}Service extends ApplicationService<${capitalModelName}, ${primaryKeyJavaType}> {
	/**
	 * mapper
	 */
	@Resource(name = "${modelName}Mapper")
	${capitalModelName}Mapper  ${modelName}Mapper;
}
