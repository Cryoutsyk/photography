package net.artron.cms.pgymtassignjudge.command;
 
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import net.mars.common.Mars;
import net.artron.command.operate.UpdateCommand;
import net.mars.core.command.OperateCommand;
import net.mars.exception.MarsException;
import net.mars.core.log.MarsLog;

import net.artron.cms.pgymtassignjudge.model.Pgymtassignjudge;
import net.artron.cms.pgymtassignjudge.service.PgymtassignjudgeService;

/**
 * 修改操作实现类.
 *
 * @author 
 */
@Slf4j 
@SuppressWarnings("serial")
@Service(value = "Pgymtassignjudge.update")
public class PgymtassignjudgeUpdateCommand extends UpdateCommand<Pgymtassignjudge, String> {
    /**
	 * 注入Service类对象.
	 */
	@Resource(name = "pgymtassignjudgeService")
	PgymtassignjudgeService pgymtassignjudgeService;
 
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
	public Pgymtassignjudge doExecuteService(Pgymtassignjudge entity) throws MarsException {
		if (log.isDebugEnabled()) {
			log.debug("{} Pgymtassignjudge.update ", Mars.LOG_PRE);
		}
		
		return super.doExecuteService(entity);
	}
}
