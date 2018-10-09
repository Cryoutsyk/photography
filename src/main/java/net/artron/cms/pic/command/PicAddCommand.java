package net.artron.cms.pic.command;
 
import javax.annotation.Resource;  
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import net.artron.command.operate.AddCommand;
import net.mars.core.log.MarsLog;
 import net.mars.core.command.OperateCommand;
import net.mars.exception.MarsException;
import net.mars.common.Mars;

import net.artron.cms.pic.model.Pic;
import net.artron.cms.pic.service.PicService;

/**
 * 添加操作实现类.
 *
 * @author 
 */ 
@Slf4j 
@Service(value = "Pic.add")
@SuppressWarnings("serial")
public class PicAddCommand extends AddCommand<Pic,  String> {
	/**
	 * 注入Service类对象.
	 */
	@Resource(name = "picService")
	PicService picService; 
	
	/**
	 * 操作名称.
	 */
	@Override
	protected void preExecuteService(Pic entity)throws MarsException {
		//把数据库其它数据的状态设置为不可用
		Pic pic = new Pic();
		pic.setStatus(2);
		picService.update(pic);
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
	public Pic doExecuteService(Pic entity) throws MarsException {
		if (log.isDebugEnabled()) {
			log.debug("{} Pic.add ", Mars.LOG_PRE);
		}
		
		return super.doExecuteService(entity);
	}
}
