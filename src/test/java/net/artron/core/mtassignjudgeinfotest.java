package net.artron.core;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import net.artron.cms.pgymatch.model.CommandModel;
import net.artron.cms.util.EnumRole;
import net.artron.cms.util.PathUtil;
import net.mars.common.util.JacksonUtil;
import net.mars.exception.MarsException;

public class mtassignjudgeinfotest {

	@SuppressWarnings("unused")
	private String[] arrs;

	// FileUtil.getContextPath();//得到当前上下文路径目录
	// //D:\java\apache-tomcat-9.0.7\webapps\artron-photography\
	// System.out.println(FileUtil.home());//C:\Users\Administrator //当前账户的主目录全路径 //
	// FileUtil.getCurrentJavaWorkDir();//java工作目录//D:\java\eclipse20171016
	// System.out.println("得到当前上下文路径目录"+FileUtil.getContextPath());
	
//	@Value("${pathPrefix}")
//	private String pathPrefix;
	
	@Test
	public void test() {
	System.out.println(PathUtil.GetPathPrefix());	;
		
		
		System.out.println(EnumRole.admin.getCode());
        System.out.println(EnumRole.admin.getName());
        System.out.println(EnumRole.hostunit.getCode());
        System.out.println(EnumRole.hostunit.getName());
        System.out.println(EnumRole.rater);
		
		
		String aaaaa="[\"1036863248374169600\",\"1036866881190887424\"]";
		arrs = JacksonUtil.convertJson2Bean(aaaaa, String[].class);
		
		
		List<Integer> pgymanuscript = new ArrayList<Integer>();
		for (int i = 0; i < 10; i++) {
			pgymanuscript.add(i, i);
		}
		int pws = 6;// ids.length;//评委数
		int gjs = pgymanuscript.size();// 稿件数

		int pjs = gjs / pws;// 平均数		
		System.out.println("平均数:"+pjs);
		int yushu=gjs % pws;//余数		
		System.out.println("余数:"+yushu);
		List<Integer> tmp = null;
		for (int i = 0; i < pws; i++) {
				tmp = pgymanuscript.subList(i * pjs, pjs * (i + 1) );
				for (Integer ii : tmp) {
					System.out.println("整除:"+ii);
					
				}
			System.out.println("--------");
		}
		if(yushu>0)
		{
			tmp = pgymanuscript.subList(pws * pjs, gjs );
			for (Integer ii : tmp) {
				System.out.println("余量:"+ii);
				
			}
		System.out.println("--------");
		}

		
	
	}
	

	/*
	 * 验证参数
	 */
	@SuppressWarnings("unused")
	private void paraVerify(CommandModel cModel) throws MarsException {
		// if (cModel == null) {
		// throw new MarsException("失败，参数为空.");
		// }
		//
		// Pgymatch entity = cModel.getMatch();// 比赛对象 //
		// JacksonUtil.convertJson2Bean(map.get("match"),
		// // Pgymatch.class);
		// List<Pgymtgroup> mtgroup = cModel.getMtgroup(); // 分组列表
		// List<Pgymtawards> awards = cModel.getMtawards();// 奖项列表 //
		// JacksonUtil.convertJson2Bean(map.get("awards"),//
		// // Pgymtawards.class);
		// List<Pgymttext> mttext = cModel.getMttext(); // 富文本列表
		//
		// if (entity == null) {
		// throw new MarsException("失败，参数为空.");
		// }
		// if (entity.getName() == null || entity.getName().length() == 0) {
		// throw new MarsException("失败，比赛名称为空.");
		// }
		// if (entity.getName().getBytes().length > 100) {
		// throw new MarsException("失败，比赛名称超出50字.");
		// }
		//
		// if (entity.getDraftstarttime() == null) {
		// throw new MarsException("失败，征稿开始时间为空.");
		// }
		// if (entity.getDraftendtime() == null) {
		// throw new MarsException("失败，征稿截止时间为空.");
		// }
		//
		// if (entity.getOrganizer() == null || entity.getOrganizer().length() == 0) {
		// throw new MarsException("失败，主办单位为空.");
		// }
		// if (entity.getOrganizer().getBytes().length > 60) {
		// throw new MarsException("失败，主办单位超出30字.");
		// }
		// if (entity.getHomebigimg() == null || entity.getHomebigimg().length() == 0) {
		// throw new MarsException("失败，首页大图为空.");
		// }
		// if (entity.getCoverbigimg() == null || entity.getCoverbigimg().length() == 0)
		// {
		// throw new MarsException("失败，封面大图为空.");
		// }
		//
		// if (entity.getCoorganizer() != null && entity.getHomebigimg().length() > 200)
		// {
		// throw new MarsException("失败，协办单位超出100字.");
		// }
		//
		// if (entity.getHighestreward() == null || entity.getHighestreward().length()
		// == 0) {
		// throw new MarsException("失败，最高奖励为空.");
		// }
		// if (entity.getHighestreward().getBytes().length > 40) {
		// throw new MarsException("失败，最高奖励超出20字.");
		// }
		//
		// if (entity.getIndividuallimit() == null || entity.getIndividuallimit() < 0) {
		// throw new MarsException("失败，个人投稿数量限制错误.");
		// }
		//
		// if (mtgroup == null || mtgroup.isEmpty()) {
		// throw new MarsException("失败，分组未设置.");
		// } else {
		// if (mtgroup.size() == 0) {
		// throw new MarsException("失败，分组未设置.");
		// }
		// List<Pgymtgroup> namenull = mtgroup.stream().filter(s -> s.getName() == null
		// || s.getName().length() == 0)
		// .collect(Collectors.toList());
		// if (namenull != null && !namenull.isEmpty()) {
		// for (Pgymtgroup mg : namenull) {
		// cModel.getMtgroup().remove(mg);
		// }
		// }
		// if (mtgroup.size() > 10) {
		// throw new MarsException("失败，分组数量超10个.");
		// }
		// List<Pgymtgroup> outLength = mtgroup.stream().filter(s ->
		// s.getName().getBytes().length > 20)
		// .collect(Collectors.toList());
		// if (outLength != null && !outLength.isEmpty()) {
		// throw new MarsException("失败，分组名称超10个字.");
		// }
		//
		// }
		// if (awards == null || awards.isEmpty()) {
		// throw new MarsException("失败，奖项未设置.");
		// } else {
		// if (awards.size() == 0) {
		// throw new MarsException("失败，奖项未设置.");
		// }
		// List<Pgymtawards> namenull = awards.stream().filter(s -> s.getName() == null
		// || s.getName().length() == 0)
		// .collect(Collectors.toList());
		// if (namenull != null && !namenull.isEmpty()) {
		// for (Pgymtawards md : namenull) {
		// cModel.getMtawards().remove(md);
		// }
		// }
		// if (awards.size() > 20) {
		// throw new MarsException("失败，奖项数量超20个.");
		// }
		// List<Pgymtawards> outLength = awards.stream().filter(s ->
		// s.getName().getBytes().length > 20)
		// .collect(Collectors.toList());
		// if (outLength != null && !outLength.isEmpty()) {
		// throw new MarsException("失败，奖项名称超10个字.");
		// }
		// List<Pgymtawards> countnull = awards.stream()
		// .filter(s -> s.getAwardcount() == null || s.getAwardcount() <=
		// 0).collect(Collectors.toList());
		// if (countnull != null && !countnull.isEmpty()) {
		// throw new MarsException("失败，获奖人数错误.");
		// }
		// List<Pgymtawards> tabnull = awards.stream().filter(s -> s.getTabIndex() ==
		// null)
		// .collect(Collectors.toList());
		// if (tabnull != null && !tabnull.isEmpty()) {
		// throw new MarsException("失败，TabIndex为空.");
		// }
		// if (cModel.getMtawards().size() !=
		// cModel.getMtawards().stream().map(Pgymtawards::getTabIndex)
		// .collect(Collectors.toSet()).size()) {
		// throw new MarsException("失败，TabIndex重复.");
		// }
		// }
		//
		// if (mttext == null || mttext.isEmpty()) {
		// throw new MarsException("失败，征集内容为空.");
		// } else {
		// // 1征集内容,2奖项设置,3征稿细则,4投稿方式,5日程安排,6特别说明
		// List<Pgymttext> cjnr = mttext.stream().filter(s -> s.getTexttype() ==
		// "1").collect(Collectors.toList());
		// if (cjnr == null || cjnr.isEmpty() || cjnr.get(0).getTextcontent() == null
		// || cjnr.get(0).getTextcontent().length() == 0) {
		// throw new MarsException("失败，征集内容为空.");
		// }
		// if (cjnr.get(0).getTextcontent().getBytes().length > 1000) {
		// throw new MarsException("失败，征集内容超500字.");
		// }
		//
		// List<Pgymttext> jxsz = mttext.stream().filter(s -> s.getTexttype() ==
		// "2").collect(Collectors.toList());
		// if (jxsz == null || jxsz.isEmpty() || jxsz.get(0).getTextcontent() == null
		// || jxsz.get(0).getTextcontent().length() == 0) {
		// throw new MarsException("失败，奖项设置为空.");
		// }
		// if (jxsz.get(0).getTextcontent().getBytes().length > 1000) {
		// throw new MarsException("失败，奖项设置超500字.");
		// }
		//
		// List<Pgymttext> zggz = mttext.stream().filter(s -> s.getTexttype() ==
		// "3").collect(Collectors.toList());
		// if (zggz == null || zggz.isEmpty() || zggz.get(0).getTextcontent() == null
		// || zggz.get(0).getTextcontent().length() == 0) {
		// throw new MarsException("失败，征稿细则为空.");
		// }
		// if (zggz.get(0).getTextcontent().getBytes().length > 1000) {
		// throw new MarsException("失败，征稿细则超500字.");
		// }
		//
		// List<Pgymttext> tgfs = mttext.stream().filter(s -> s.getTexttype() ==
		// "4").collect(Collectors.toList());
		// if (tgfs == null || tgfs.isEmpty() || tgfs.get(0).getTextcontent() == null
		// || tgfs.get(0).getTextcontent().length() == 0) {
		// throw new MarsException("失败，投稿方式为空.");
		// }
		// if (tgfs.get(0).getTextcontent().getBytes().length > 1000) {
		// throw new MarsException("失败，投稿方式超500字.");
		// }
		//
		// List<Pgymttext> rcap = mttext.stream().filter(s -> s.getTexttype() ==
		// "5").collect(Collectors.toList());
		// if (rcap != null && !rcap.isEmpty() && rcap.get(0).getTextcontent() != null
		// && rcap.get(0).getTextcontent().getBytes().length > 1000) {
		// throw new MarsException("失败，日程安排超500字.");
		// }
		// List<Pgymttext> tbsm = mttext.stream().filter(s -> s.getTexttype() ==
		// "5").collect(Collectors.toList());
		// if (tbsm != null && !tbsm.isEmpty() && tbsm.get(0).getTextcontent() != null
		// && tbsm.get(0).getTextcontent().getBytes().length > 1000) {
		// throw new MarsException("失败，特别说明超500字.");
		// }
		// }
	}
}
