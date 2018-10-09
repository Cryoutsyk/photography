package net.artron.cms.pgymstphoto.command;
 
import javax.annotation.Resource;  
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import net.artron.command.operate.AddCommand;
import net.mars.core.log.MarsLog;
 import net.mars.core.command.OperateCommand;
import net.mars.exception.MarsException;
import net.mars.common.Mars;

import net.artron.cms.pgymstphoto.model.Pgymstphoto;
import net.artron.cms.pgymstphoto.service.PgymstphotoService;

/**
 * 添加操作实现类.
 *
 * @author 
 */ 
@Slf4j 
@Service(value = "Pgymstphoto.add")
@SuppressWarnings("serial")
public class PgymstphotoAddCommand extends AddCommand<Pgymstphoto,  String> {
	/**
	 * 注入Service类对象.
	 */
	@Resource(name = "pgymstphotoService")
	PgymstphotoService pgymstphotoService; 
	
	/**
	 * 操作名称.
	 */
	@Override
	protected void preExecuteService(Pgymstphoto entity)throws MarsException {
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
	public Pgymstphoto doExecuteService(Pgymstphoto entity) throws MarsException {
		if (log.isDebugEnabled()) {
			log.debug("{} Pgymstphoto.add ", Mars.LOG_PRE);
		}
		
		return super.doExecuteService(entity);
	}
}
