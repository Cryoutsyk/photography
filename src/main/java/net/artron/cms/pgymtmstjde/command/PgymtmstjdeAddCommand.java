package net.artron.cms.pgymtmstjde.command;
 
import javax.annotation.Resource;  
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import net.artron.command.operate.AddCommand;
import net.mars.core.log.MarsLog;
 import net.mars.core.command.OperateCommand;
import net.mars.exception.MarsException;
import net.mars.common.Mars;

import net.artron.cms.pgymtmstjde.model.Pgymtmstjde;
import net.artron.cms.pgymtmstjde.service.PgymtmstjdeService;

/**
 * 添加操作实现类.
 *
 * @author 
 */ 
@Slf4j 
@Service(value = "Pgymtmstjde.add")
@SuppressWarnings("serial")
public class PgymtmstjdeAddCommand extends AddCommand<Pgymtmstjde,  String> {
	/**
	 * 注入Service类对象.
	 */
	@Resource(name = "pgymtmstjdeService")
	PgymtmstjdeService pgymtmstjdeService; 
	
	/**
	 * 操作名称.
	 */
	@Override
	protected void preExecuteService(Pgymtmstjde entity)throws MarsException {
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
	public Pgymtmstjde doExecuteService(Pgymtmstjde entity) throws MarsException {
		if (log.isDebugEnabled()) {
			log.debug("{} Pgymtmstjde.add ", Mars.LOG_PRE);
		}
		
		return super.doExecuteService(entity);
	}
}
