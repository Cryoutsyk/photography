package net.artron.view.pgyuser.command;
 
import javax.annotation.Resource;  
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import net.artron.command.operate.AddCommand;
import net.mars.core.log.MarsLog;
 import net.mars.core.command.OperateCommand;
import net.mars.exception.MarsException;
import net.mars.common.Mars;

import net.artron.view.pgyuser.model.Pgyuser;
import net.artron.view.pgyuser.service.PgyuserService;

/**
 * 娣诲姞鎿嶄綔瀹炵幇绫�.
 *
 * @author 
 */ 
@Slf4j 
@Service(value = "Pgyuser.add")
@SuppressWarnings("serial")
public class PgyuserAddCommand extends AddCommand<Pgyuser,  > {
	/**
	 * 娉ㄥ叆Service绫诲璞�.
	 */
	@Resource(name = "pgyuserService")
	PgyuserService pgyuserService; 
	
	/**
	 * 鎿嶄綔鍚嶇О.
	 */
	@Override
	protected void preExecuteService(Pgyuser entity)throws MarsException {
		super.preExecuteService(entity);
	}
	
	/**
	 * 鎿嶄綔鍚�.
	 */
	@Override
	public OperateCommand getOperateCommand() {
		return super.getOperateCommand();
	}
	
	/**
	 * 鎵ц娣诲姞鎿嶄綔骞惰褰曟棩蹇�.
	 */
	@MarsLog
	@Override
	public Pgyuser doExecuteService(Pgyuser entity) throws MarsException {
		if (log.isDebugEnabled()) {
			log.debug("{} Pgyuser.add ", Mars.LOG_PRE);
		}
		
		return super.doExecuteService(entity);
	}
}
