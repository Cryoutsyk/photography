package net.artron.cms.pgymanuscript.command;
 
import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import net.artron.cms.pgy.PgyAppConstant;
import net.artron.cms.pgymanuscript.model.Pgymanuscript;
import net.artron.cms.pgymanuscript.service.PgymanuscriptService;
import net.artron.cms.pgymatch.model.Pgymatch;
import net.artron.cms.pgymatch.service.PgymatchService;
import net.artron.command.operate.UpdateCommand;
import net.mars.common.Mars;
import net.mars.core.command.OperateCommand;
import net.mars.core.log.MarsLog;
import net.mars.exception.MarsException;

/**
 * 修改稿件状态
 *
 * @author 
 */
@Slf4j 
@SuppressWarnings("serial")
@Service(value = "Pgymanuscript.autoUpdateMststate")
public class ManuscriptAutoUpdateMststateCommand extends UpdateCommand<Pgymanuscript, String> {
    /**
	 * 注入Service类对象.
	 */
	@Resource(name = "pgymanuscriptService")
	public PgymanuscriptService pgymanuscriptService;
	
	@Resource(name = "pgymatchService")
	public PgymatchService pgymatchService;
 
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
	public Pgymanuscript doExecuteService(Pgymanuscript entity) throws MarsException {
		
		//获取稿件对象
		Pgymanuscript dbEntity=pgymanuscriptService.queryById(entity.getDbId());
		
		if(entity.getDbId()==null || dbEntity==null) throw new MarsException("稿件对象不存在！！");
		
		
		
		
		//获取比赛状态
		Integer matchStatus=null;
		String mtId = dbEntity.getMtId();//比赛id
		if(StringUtils.isEmpty(mtId)) throw new MarsException("稿件没有比赛dbId");
		Pgymatch match = pgymatchService.queryById(mtId);
		
		if(match==null) throw new MarsException("比赛信息不存在！！");
		matchStatus=match.getStatus();
		if(matchStatus!=null && matchStatus.equals(6)) {//开始初步终评
			if(entity.getMststate()==null || !entity.getMststate().equals(PgyAppConstant.passStatus)) {
				entity.setMststate2(PgyAppConstant.noStatus);
			}
		}else if(matchStatus!=null && matchStatus.equals(3)) {//开始初评
			if(entity.getMststate()==null || !entity.getMststate().equals(PgyAppConstant.passStatus)) {
				entity.setMststate1(PgyAppConstant.noStatus);
			}
		}else {
			throw new MarsException("比赛没有开始初评或终评！！");
		}
		
		return super.doExecuteService(entity);
	}
}
