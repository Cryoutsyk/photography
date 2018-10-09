package net.artron.cms.pgymttext.command;
 
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import net.mars.common.Mars;
import net.artron.command.operate.UpdateCommand;
import net.mars.core.command.OperateCommand;
import net.mars.exception.MarsException;
import net.mars.core.log.MarsLog;

import net.artron.cms.pgymttext.model.Pgymttext;
import net.artron.cms.pgymttext.service.PgymttextService;

/**
 * 修改操作实现类.
 *
 * @author 
 */
@Slf4j 
@SuppressWarnings("serial")
@Service(value = "Pgymttext.update")
public class PgymttextUpdateCommand extends UpdateCommand<Pgymttext, String> {
    /**
	 * 注入Service类对象.
	 */
	@Resource(name = "pgymttextService")
	PgymttextService pgymttextService;
 
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
	public Pgymttext doExecuteService(Pgymttext entity) throws MarsException {
		if (log.isDebugEnabled()) {
			log.debug("{} Pgymttext.update ", Mars.LOG_PRE);
		}
		
		return super.doExecuteService(entity);
	}
}
