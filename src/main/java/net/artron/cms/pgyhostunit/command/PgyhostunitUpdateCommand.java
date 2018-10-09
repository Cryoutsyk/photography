package net.artron.cms.pgyhostunit.command;
 
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import net.mars.common.Mars;
import net.artron.command.operate.UpdateCommand;
import net.mars.core.command.OperateCommand;
import net.mars.exception.MarsException;
import net.mars.core.log.MarsLog;

import net.artron.cms.pgyhostunit.model.Pgyhostunit;
import net.artron.cms.pgyhostunit.service.PgyhostunitService;

/**
 * 修改操作实现类.
 *
 * @author 
 */
@Slf4j 
@SuppressWarnings("serial")
@Service(value = "Pgyhostunit.update")
public class PgyhostunitUpdateCommand extends UpdateCommand<Pgyhostunit, String> {
    /**
	 * 注入Service类对象.
	 */
	@Resource(name = "pgyhostunitService")
	PgyhostunitService pgyhostunitService;
 
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
	public Pgyhostunit doExecuteService(Pgyhostunit entity) throws MarsException {
		if (log.isDebugEnabled()) {
			log.debug("{} Pgyhostunit.update ", Mars.LOG_PRE);
		}
		
		return super.doExecuteService(entity);
	}
}
