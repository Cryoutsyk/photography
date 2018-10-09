package net.artron.cms.pgymtawardsinfo.command;
 
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import net.mars.common.Mars;
import net.artron.command.operate.UpdateCommand;
import net.mars.core.command.OperateCommand;
import net.mars.exception.MarsException;
import net.mars.core.log.MarsLog;

import net.artron.cms.pgymtawardsinfo.model.Pgymtawardsinfo;
import net.artron.cms.pgymtawardsinfo.service.PgymtawardsinfoService;

/**
 * 修改操作实现类.
 *
 * @author 
 */
@Slf4j 
@SuppressWarnings("serial")
@Service(value = "Pgymtawardsinfo.update")
public class PgymtawardsinfoUpdateCommand extends UpdateCommand<Pgymtawardsinfo, String> {
    /**
	 * 注入Service类对象.
	 */
	@Resource(name = "pgymtawardsinfoService")
	PgymtawardsinfoService pgymtawardsinfoService;
 
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
	public Pgymtawardsinfo doExecuteService(Pgymtawardsinfo entity) throws MarsException {
		if (log.isDebugEnabled()) {
			log.debug("{} Pgymtawardsinfo.update ", Mars.LOG_PRE);
		}
		
		return super.doExecuteService(entity);
	}
}
