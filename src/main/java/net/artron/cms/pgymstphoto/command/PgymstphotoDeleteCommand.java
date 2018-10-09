package net.artron.cms.pgymstphoto.command;
 
import javax.annotation.Resource; 
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import net.artron.command.operate.DeleteCommand;
import net.mars.common.Mars;
import net.mars.core.command.OperateCommand;
import net.mars.exception.MarsException;
import net.mars.core.log.MarsLog;
 
import net.artron.cms.pgymstphoto.model.Pgymstphoto;
import net.artron.cms.pgymstphoto.service.PgymstphotoService;

/**
 * 删除操作实现类.
 *
 * @author 
 */
@Slf4j 
@SuppressWarnings("serial")
@Service(value = "Pgymstphoto.delete")
public class PgymstphotoDeleteCommand extends DeleteCommand<Pgymstphoto, String> {
	/**
	 * 注入Service类对象.
	 */
	@Resource(name = "pgymstphotoService")
	PgymstphotoService pgymstphotoService;
	
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
	public Pgymstphoto doExecuteService(Pgymstphoto entity) throws MarsException {
		if (log.isDebugEnabled()) {
			log.debug("{} Pgymstphoto.delete ", Mars.LOG_PRE);
		}
		
		return super.doExecuteService(entity);
	}
}
