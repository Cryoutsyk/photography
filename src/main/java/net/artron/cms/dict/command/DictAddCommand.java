package net.artron.cms.dict.command;
 
import javax.annotation.Resource;  
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import net.artron.command.operate.AddCommand;
import net.mars.core.log.MarsLog;
 import net.mars.core.command.OperateCommand;
import net.mars.exception.MarsException;
import net.mars.common.Mars;

import net.artron.cms.dict.model.Dict;
import net.artron.cms.dict.service.DictService;

/**
 * 添加操作实现类.
 *
 * @author 
 */ 
@Slf4j 
@Service(value = "Dict.add")
@SuppressWarnings("serial")
public class DictAddCommand extends AddCommand<Dict,  String> {
	/**
	 * 注入Service类对象.
	 */
	@Resource(name = "dictService")
	DictService dictService; 
	
	/**
	 * 操作名称.http://localhost:8082/artron-photography/dict/add/command?format=json
	 */
	@Override
	protected void preExecuteService(Dict entity)throws MarsException {
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
	public Dict doExecuteService(Dict entity) throws MarsException {
		if (log.isDebugEnabled()) {
			log.debug("{} Dict.add ", Mars.LOG_PRE);
		}
		
		return super.doExecuteService(entity);
	}
}
