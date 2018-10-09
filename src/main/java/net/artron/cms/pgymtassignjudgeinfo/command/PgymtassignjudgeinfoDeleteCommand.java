package net.artron.cms.pgymtassignjudgeinfo.command;
 
import javax.annotation.Resource; 
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import net.artron.command.operate.DeleteCommand;
import net.mars.common.Mars;
import net.mars.core.command.OperateCommand;
import net.mars.exception.MarsException;
import net.mars.core.log.MarsLog;
 
import net.artron.cms.pgymtassignjudgeinfo.model.Pgymtassignjudgeinfo;
import net.artron.cms.pgymtassignjudgeinfo.service.PgymtassignjudgeinfoService;

/**
 * 删除操作实现类.
 *
 * @author 
 */
@Slf4j 
@SuppressWarnings("serial")
@Service(value = "Pgymtassignjudgeinfo.delete")
public class PgymtassignjudgeinfoDeleteCommand extends DeleteCommand<Pgymtassignjudgeinfo, String> {
	/**
	 * 注入Service类对象.
	 */
	@Resource(name = "pgymtassignjudgeinfoService")
	PgymtassignjudgeinfoService pgymtassignjudgeinfoService;
	
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
	public Pgymtassignjudgeinfo doExecuteService(Pgymtassignjudgeinfo entity) throws MarsException {
		if (log.isDebugEnabled()) {
			log.debug("{} Pgymtassignjudgeinfo.delete ", Mars.LOG_PRE);
		}
		
		return super.doExecuteService(entity);
	}
}
