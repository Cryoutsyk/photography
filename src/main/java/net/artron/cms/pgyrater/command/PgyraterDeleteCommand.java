package net.artron.cms.pgyrater.command;
 
import javax.annotation.Resource; 
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import net.artron.command.operate.DeleteCommand;
import net.mars.common.Mars;
import net.mars.core.command.OperateCommand;
import net.mars.exception.MarsException;
import net.mars.core.log.MarsLog;
 
import net.artron.cms.pgyrater.model.Pgyrater;
import net.artron.cms.pgyrater.service.PgyraterService;

/**
 * 删除操作实现类.
 *
 * @author 
 */
@Slf4j 
@SuppressWarnings("serial")
@Service(value = "Pgyrater.delete")
public class PgyraterDeleteCommand extends DeleteCommand<Pgyrater, String> {
	/**
	 * 注入Service类对象.
	 */
	@Resource(name = "pgyraterService")
	PgyraterService pgyraterService;
	
	/**
	 * 操作名称.
	 */
	@Override
	public OperateCommand getOperateCommand() {
		return super.getOperateCommand();
	}
	
	/**
	 * 执行删除操作并记录日志.
	 */
	@MarsLog
	@Override
	public Pgyrater doExecuteService(Pgyrater entity) throws MarsException {
		if (log.isDebugEnabled()) {
			log.debug("{} Pgyrater.delete ", Mars.LOG_PRE);
		}
		
		return super.doExecuteService(entity);
	}
}
