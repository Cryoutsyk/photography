package ${packageStr};
 
import javax.annotation.Resource;  
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import net.artron.command.operate.AddCommand;
import net.mars.core.log.MarsLog;
 import net.mars.core.command.OperateCommand;
import net.mars.exception.MarsException;
import net.mars.common.Mars;

import ${packageName}.model.${capitalModelName};
import ${packageName}.service.${capitalModelName}Service;

/**
 * 添加操作实现类.
 *
 * @author 
 */ 
@Slf4j 
@Service(value = "${capitalModelName}.add")
@SuppressWarnings("serial")
public class ${capitalModelName}AddCommand extends AddCommand<${capitalModelName},  ${primaryKeyJavaType}> {
	/**
	 * 注入Service类对象.
	 */
	@Resource(name = "${modelName}Service")
	${capitalModelName}Service ${modelName}Service; 
	
	/**
	 * 操作名称.
	 */
	@Override
	protected void preExecuteService(${capitalModelName} entity)throws MarsException {
		super.preExecuteService(entity);
	}
	
	/**
	 * 操作名.
	 */
	@Override
	public OperateCommand getOperateCommand() {
		return super.getOperateCommand();
	}
	
	/**
	 * 执行添加操作并记录日志.
	 */
	@MarsLog
	@Override
	public ${capitalModelName} doExecuteService(${capitalModelName} entity) throws MarsException {
		if (log.isDebugEnabled()) {
			log.debug("{} ${capitalModelName}.add ", Mars.LOG_PRE);
		}
		
		return super.doExecuteService(entity);
	}
}
