package net.artron.cms.dict.command;
 
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import net.mars.common.Mars;
import net.artron.command.operate.UpdateCommand;
import net.mars.core.command.OperateCommand;
import net.mars.exception.MarsException;
import net.mars.core.log.MarsLog;

import net.artron.cms.dict.model.Dict;
import net.artron.cms.dict.service.DictService;

/**
 * 修改操作实现类.
 *
 * @author 
 */
@Slf4j 
@SuppressWarnings("serial")
@Service(value = "Dict.update")
public class DictUpdateCommand extends UpdateCommand<Dict, String> {
    /**
	 * 注入Service类对象.
	 */
	@Resource(name = "dictService")
	DictService dictService;
 
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
	public Dict doExecuteService(Dict entity) throws MarsException {
		if (log.isDebugEnabled()) {
			log.debug("{} Dict.update ", Mars.LOG_PRE);
		}
		
		return super.doExecuteService(entity);
	}
}
