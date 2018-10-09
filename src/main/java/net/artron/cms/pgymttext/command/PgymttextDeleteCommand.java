package net.artron.cms.pgymttext.command;
 
import javax.annotation.Resource; 
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import net.artron.command.operate.DeleteCommand;
import net.mars.common.Mars;
import net.mars.core.command.OperateCommand;
import net.mars.exception.MarsException;
import net.mars.core.log.MarsLog;
 
import net.artron.cms.pgymttext.model.Pgymttext;
import net.artron.cms.pgymttext.service.PgymttextService;

/**
 * 删除操作实现类.
 *
 * @author 
 */
@Slf4j 
@SuppressWarnings("serial")
@Service(value = "Pgymttext.delete")
public class PgymttextDeleteCommand extends DeleteCommand<Pgymttext, String> {
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
	 * 执行删除操作并记录日志.
	 */
	@MarsLog
	@Override
	public Pgymttext doExecuteService(Pgymttext entity) throws MarsException {
		if (log.isDebugEnabled()) {
			log.debug("{} Pgymttext.delete ", Mars.LOG_PRE);
		}
		
		return super.doExecuteService(entity);
	}
}
