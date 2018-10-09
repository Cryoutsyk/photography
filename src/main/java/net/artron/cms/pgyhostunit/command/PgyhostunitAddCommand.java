package net.artron.cms.pgyhostunit.command;
 
import java.util.Date;

import javax.annotation.Resource;  
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import net.artron.command.operate.AddCommand;
import net.mars.core.log.MarsLog;
 import net.mars.core.command.OperateCommand;
import net.mars.exception.MarsException;
import net.mars.common.Mars;

import net.artron.cms.pgyhostunit.model.Pgyhostunit;
import net.artron.cms.pgyhostunit.service.PgyhostunitService;

/**
 * 添加操作实现类.
 *
 * @author 
 */ 
@Slf4j 
@Service(value = "Pgyhostunit.add")
@SuppressWarnings("serial")
public class PgyhostunitAddCommand extends AddCommand<Pgyhostunit,  String> {
	/**
	 * 注入Service类对象.
	 */
	@Resource(name = "pgyhostunitService")
	PgyhostunitService pgyhostunitService; 
	
	/**
	 * 操作名称.
	 */
	@Override
	protected void preExecuteService(Pgyhostunit entity)throws MarsException {
		entity.setCreatedDt(new Date());
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
	public Pgyhostunit doExecuteService(Pgyhostunit entity) throws MarsException {
		if (log.isDebugEnabled()) {
			log.debug("{} Pgyhostunit.add ", Mars.LOG_PRE);
		}
		
		return super.doExecuteService(entity);
	}
}
