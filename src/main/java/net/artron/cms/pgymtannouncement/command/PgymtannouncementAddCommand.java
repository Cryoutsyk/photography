package net.artron.cms.pgymtannouncement.command;
 
import javax.annotation.Resource;  
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import net.artron.command.operate.AddCommand;
import net.mars.core.log.MarsLog;
 import net.mars.core.command.OperateCommand;
import net.mars.exception.MarsException;
import net.mars.common.Mars;

import net.artron.cms.pgymtannouncement.model.Pgymtannouncement;
import net.artron.cms.pgymtannouncement.service.PgymtannouncementService;

/**
 * 添加操作实现类.
 *
 * @author 
 */ 
@Slf4j 
@Service(value = "Pgymtannouncement.add")
@SuppressWarnings("serial")
public class PgymtannouncementAddCommand extends AddCommand<Pgymtannouncement,  String> {
	/**
	 * 注入Service类对象.
	 */
	@Resource(name = "pgymtannouncementService")
	PgymtannouncementService pgymtannouncementService; 
	
	/**
	 * 操作名称.
	 */
	@Override
	protected void preExecuteService(Pgymtannouncement entity)throws MarsException {
		//修改比赛状态，稿件状态
		//TODO
		
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
	public Pgymtannouncement doExecuteService(Pgymtannouncement entity) throws MarsException {
		if (log.isDebugEnabled()) {
			log.debug("{} Pgymtannouncement.add ", Mars.LOG_PRE);
		}
		
		return super.doExecuteService(entity);
	}
	
	
}
