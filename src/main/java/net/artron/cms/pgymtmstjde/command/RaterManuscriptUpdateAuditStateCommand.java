package net.artron.cms.pgymtmstjde.command;
 
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import net.mars.common.Mars;
import net.artron.command.operate.UpdateCommand;
import net.mars.core.command.OperateCommand;
import net.mars.exception.MarsException;
import net.mars.core.log.MarsLog;
import net.artron.cms.pgy.PgyAppConstant;
import net.artron.cms.pgymtmstjde.model.Pgymtmstjde;
import net.artron.cms.pgymtmstjde.service.PgymtmstjdeService;

/**
 * 修改评委稿件状态
 *
 * @author 
 */
@Slf4j 
@SuppressWarnings("serial")
@Service(value = "Pgymtmstjde.updateState")
public class RaterManuscriptUpdateAuditStateCommand extends UpdateCommand<Pgymtmstjde, String> {
    /**
	 * 注入Service类对象.
	 */
	@Resource(name = "pgymtmstjdeService")
	PgymtmstjdeService pgymtmstjdeService;
 
    /**
	 * 操作名称.
	 */
	@Override
	public OperateCommand getOperateCommand() {
		return super.getOperateCommand();
	}
	
	/**
	 * 执行修改操作并记录日志.
	 */
	@MarsLog
	@Override
	public Pgymtmstjde doExecuteService(Pgymtmstjde entity) throws MarsException {
		if (log.isDebugEnabled()) {
			log.debug("{} Pgymtmstjde.update ", Mars.LOG_PRE);
		}
		
		if(entity.getDbId()==null || pgymtmstjdeService.queryById(entity.getDbId())==null) throw new MarsException("比赛不存在！！");
		
		if(entity.getAuditstate()==null || !entity.getAuditstate().equals(PgyAppConstant.passStatus)) {
			entity.setAuditstate(PgyAppConstant.noStatus);
		}
		return super.doExecuteService(entity);
	}
}
