package ${packageStr};
 
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import net.mars.common.Mars;
import net.artron.command.operate.UpdateCommand;
import net.mars.core.command.OperateCommand;
import net.mars.exception.MarsException;
import net.mars.core.log.MarsLog;

import ${packageName}.model.${capitalModelName};
import ${packageName}.service.${capitalModelName}Service;

/**
 * 修改操作实现类.
 *
 * @author 
 */
@Slf4j 
@SuppressWarnings("serial")
@Service(value = "${capitalModelName}.update")
public class ${capitalModelName}UpdateCommand extends UpdateCommand<${capitalModelName}, ${primaryKeyJavaType}> {
    /**
	 * 注入Service类对象.
	 */
	@Resource(name = "${modelName}Service")
	${capitalModelName}Service ${modelName}Service;
 
    /**
	 * 操作名称.
	 */
	@Override
	public OperateCommand getOperateCommand() {
		return super.getOperateCommand();
	}
	
	/**
	 * 执行修改操作并记录日志.
	 */
	@MarsLog
	@Override
	public ${capitalModelName} doExecuteService(${capitalModelName} entity) throws MarsException {
		if (log.isDebugEnabled()) {
			log.debug("{} ${capitalModelName}.update ", Mars.LOG_PRE);
		}
		
		return super.doExecuteService(entity);
	}
}
