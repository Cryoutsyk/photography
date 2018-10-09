package net.artron.cms.pgyrater.command;
 
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import net.artron.cms.pgyrater.model.Pgyrater;
import net.artron.cms.pgyrater.service.PgyraterService;
import net.artron.command.operate.AddCommand;
import net.mars.common.Mars;
import net.mars.core.command.OperateCommand;
import net.mars.core.log.MarsLog;
import net.mars.exception.MarsException;

/**
 * 添加操作实现类.
 *
 * @author 
 */ 
@Slf4j 
@Service(value = "Pgyrater.add")
@SuppressWarnings("serial")
public class PgyraterAddCommand extends AddCommand<Pgyrater,  String> {
	/**
	 * 注入Service类对象.
	 */
	@Resource(name = "pgyraterService")
	PgyraterService pgyraterService; 
	
	/**
	 * 操作名称.
	 */
	@Override
	protected void preExecuteService(Pgyrater entity)throws MarsException {
		/*//特殊字符还原
		if(StringUtils.isNotBlank(entity.getGoodType())){
			entity.setGoodType(org.springframework.web.util.HtmlUtils.htmlUnescape(entity.getGoodType()));
		}*/
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
	public Pgyrater doExecuteService(Pgyrater entity) throws MarsException {
		if (log.isDebugEnabled()) {
			log.debug("{} Pgyrater.add ", Mars.LOG_PRE);
		}
		
		return super.doExecuteService(entity);
	}
}
