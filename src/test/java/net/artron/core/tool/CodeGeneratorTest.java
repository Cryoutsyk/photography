package net.artron.core.tool;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import net.artron.core.SpringContextApplicationTest;
import net.artron.tools.codegen.CodeGenerator;

public class CodeGeneratorTest extends SpringContextApplicationTest{

	@Autowired
	CodeGenerator codeGenerator;
	@Test
	public void biz_vew_page_cnf(){
	 
		String tableName = "plt_ogz_user";   
		codeGenerator.doExecute(tableName, "net.artron.cms.", "ogzuser");
		
//		String tableName = "sys_dict";   
//	    codeGenerator.doExecute(tableName, "net.artron.cms.", "dict");
		
//		tableName = "cms_pgy_match";   
//		codeGenerator.doExecute(tableName, "net.artron.cms.", "pgymatch");
//		
//		tableName = "cms_pgy_mst_photo";   
//		codeGenerator.doExecute(tableName, "net.artron.cms.", "pgymstphoto");
//		
//		tableName = "cms_pgy_mst_score";   
//		codeGenerator.doExecute(tableName, "net.artron.cms.", "pgymstscore");
//		
//		tableName = "cms_pgy_mt_announcement";   
//		codeGenerator.doExecute(tableName, "net.artron.cms.", "pgymtannouncement");
//		
//		tableName = "cms_pgy_mt_assignjudge";   
//		codeGenerator.doExecute(tableName, "net.artron.cms.", "pgymtassignjudge");
//		
//		tableName = "cms_pgy_mt_assignjudgeinfo";   
//		codeGenerator.doExecute(tableName, "net.artron.cms.", "pgymtassignjudgeinfo");
//		
//		tableName = "cms_pgy_mt_awards";   
//		codeGenerator.doExecute(tableName, "net.artron.cms.", "pgymtawards");
//		
//		tableName = "cms_pgy_mt_awardsinfo";   
//		codeGenerator.doExecute(tableName, "net.artron.cms.", "pgymtawardsinfo");
//		
//		tableName = "cms_pgy_mt_group";   
//		codeGenerator.doExecute(tableName, "net.artron.cms.", "pgymtgroup");
//		
//		tableName = "cms_pgy_mt_mst_jde";   
//		codeGenerator.doExecute(tableName, "net.artron.cms.", "pgymtmstjde");
//		
//		tableName = "cms_pgy_mt_text";   
//		codeGenerator.doExecute(tableName, "net.artron.cms.", "pgymttext");	
	}
	
//	@Test
//	public void biz_vew_page_cnf(){
//		//
//		String tableName = "cms_pgy_match";   
//		codeGenerator.doExecute(tableName, "net.artron.view.", "pgymatch");
//	}
	
//	@Test
//	public void biz_vew_page_cnf(){
//		//机构
//		String tableName = "biz_vew_page_cnf";   
//		codeGenerator.doExecute(tableName, "net.artron.view.", "pagecnf");
//	}


}
