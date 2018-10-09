package net.artron.cms.pgyuser.command;
 
import javax.annotation.Resource; 
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import net.artron.cms.pgyuser.model.Pgyuser;
import net.artron.cms.pgyuser.service.PgyuserService;
import net.artron.command.operate.DeleteCommand;
import net.mars.common.Mars;
import net.mars.core.command.OperateCommand;
import net.mars.exception.MarsException;
import net.mars.core.log.MarsLog;

/**
 * 鍒犻櫎鎿嶄綔瀹炵幇绫�.
 *
 * @author 
 */
@Slf4j 
@SuppressWarnings("serial")
@Service(value = "Pgyuser.delete")
public class PgyuserDeleteCommand extends DeleteCommand<Pgyuser, String> {
	/**
	 * 娉ㄥ叆Service绫诲璞�.
	 */
	@Resource(name = "pgyuserService")
	PgyuserService pgyuserService;
	
	/**
	 * 鎿嶄綔鍚嶇О.
	 */
	@Override
	public OperateCommand getOperateCommand() {
		return super.getOperateCommand();
	}
	
	/**
	 * 鎵ц鍒犻櫎鎿嶄綔骞惰褰曟棩蹇�.
	 */
	@MarsLog
	@Override
	public Pgyuser doExecuteService(Pgyuser entity) throws MarsException {
		if (log.isDebugEnabled()) {
			log.debug("{} Pgyuser.delete ", Mars.LOG_PRE);
		}
		
		return super.doExecuteService(entity);
	}
}
