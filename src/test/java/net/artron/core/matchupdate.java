package net.artron.core;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import net.artron.cms.pgymatch.model.CommandModel;
import net.artron.cms.pgymatch.model.Pgymatch;
import net.artron.cms.pgymtawards.model.Pgymtawards;
import net.artron.cms.pgymtgroup.model.Pgymtgroup;
import net.artron.cms.pgymttext.model.Pgymttext;
import net.mars.boot.SpringContextApplication;
import net.mars.boot.SpringContextBeanInitializer;
import net.mars.boot.akka.AkkaApplication;
import net.mars.common.util.JacksonUtil;
import net.mars.common.util.http.HttpClientUtil;
import net.mars.core.boot.SpringBeanApplication;

//@RunWith(SpringRunner.class)
//@ContextConfiguration(classes = { AkkaApplication.class, SpringBeanApplication.class,
//		SpringContextBeanInitializer.class, SpringContextApplication.class })
public class matchupdate {
	@Test
	public void testupdate() {
		Pgymatch entity = new Pgymatch();
		entity.setDbId("1040414483119341568");
		entity.setName("ewqeqw");
		entity.setCode("321321ewq");
		entity.setTabIndex(1);
		entity.setIndividuallimit(1);
		entity.setHomebigimg("首页大图");
		entity.setCoverbigimg("封面图");
		entity.setOrganizer("123");
		entity.setCoorganizer("协办单位");
		entity.setHighestreward("123");
		entity.setDraftstarttime(new Date());
		entity.setDraftendtime(new Date());
		entity.setVersion(0);

		List<Pgymtawards> listawards = new ArrayList<Pgymtawards>();
		Pgymtawards awards = new Pgymtawards();
		awards.setTabIndex(1);
		awards.setName("奖项");
		awards.setAwardcount(12);
		awards.setMtId("1040414483119341568");
		listawards.add(awards);
		
		List<Pgymtgroup> listgroup=new ArrayList<>();
		Pgymtgroup mtgroup =new Pgymtgroup();
		mtgroup.setTabIndex(1);
		mtgroup.setName("123aqe");
		mtgroup.setMtId("1040414483119341568");
		listgroup.add(mtgroup);
		
		List<Pgymttext> listtext=new ArrayList<>();
		Pgymttext tt =new Pgymttext();
		tt.setMtId("1040414483119341568");
		tt.setTabIndex(1);
		tt.setTexttype("1");
		tt.setTextcontent("fsakljfsai");
		listtext.add(tt);
		Pgymttext tt2 =new Pgymttext();
		tt2.setMtId("1040414483119341568");
		tt2.setTabIndex(2);
		tt2.setTexttype("2");
		tt2.setTextcontent("fsakljfsai");
		listtext.add(tt2);
		Pgymttext tt3 =new Pgymttext();
		tt3.setMtId("1040414483119341568");
		tt3.setTabIndex(3);
		tt3.setTexttype("3");
		tt3.setTextcontent("fsakljfsai");
		listtext.add(tt3);
		Pgymttext tt4 =new Pgymttext();
		tt4.setMtId("1040414483119341568");
		tt4.setTabIndex(4);
		tt4.setTexttype("4");
		tt4.setTextcontent("fsakljfsai");
		listtext.add(tt4);
		Pgymttext tt5 =new Pgymttext();
		tt5.setMtId("1040414483119341568");
		tt5.setTabIndex(5);
		tt5.setTexttype("5");
		tt5.setTextcontent("fsakljfsai");
		listtext.add(tt5);
		Pgymttext tt6 =new Pgymttext();
		tt6.setMtId("1040414483119341568");
		tt6.setTabIndex(6);
		tt6.setTexttype("6");
		tt6.setTextcontent("fsakljfsai");
		listtext.add(tt6);
		

		CommandModel cModel = new CommandModel();
		cModel.setMatch(entity);
		cModel.setMtawards(listawards);
		cModel.setMtgroup(listgroup);
		
		String url = "http://localhost:8080/artron-photography/pgymatch/mtupdate?format=json&ignore=false";

		String strjson = JacksonUtil.doJackson(cModel);
		System.out.println(strjson);
		Map<String, String> headers =new HashMap<>();
		//// headers.put("Content-type", "text/plain;charset=UTF-8");
		 headers.put("Content-type", "application/json; charset=UTF-8");
		String result = HttpClientUtil.post(url, strjson, headers,1000 * 60 * 5);
		System.out.println(result);

	}
}
