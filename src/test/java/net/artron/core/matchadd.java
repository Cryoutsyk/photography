package net.artron.core;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import net.artron.cms.pgymatch.model.CommandModel;
import net.artron.cms.pgymatch.model.Pgymatch;
import net.artron.cms.pgymtawards.model.Pgymtawards;
import net.artron.cms.pgymtgroup.model.Pgymtgroup;
import net.artron.cms.pgymttext.model.Pgymttext;
import net.mars.boot.SpringContextApplication;
import net.mars.boot.SpringContextBeanInitializer;
import net.mars.boot.akka.AkkaApplication;
import net.mars.common.util.DateUtil;
import net.mars.common.util.JacksonUtil;
import net.mars.common.util.http.HttpClientUtil;
import net.mars.core.boot.SpringBeanApplication;

//@RunWith(SpringRunner.class)
//@ContextConfiguration(classes = { AkkaApplication.class, SpringBeanApplication.class,
//		SpringContextBeanInitializer.class, SpringContextApplication.class })
public class matchadd {

	@Test
	public void testadd() {
		System.out.println(new Date());
		Pgymatch entity = new Pgymatch();
		entity.setName("123");
		entity.setCode("cceshicode");
		entity.setTabIndex(1);
		entity.setIndividuallimit(1);
		entity.setHomebigimg("首页大图");
		entity.setCoverbigimg("封面图");
		entity.setOrganizer("123");
		entity.setCoorganizer("");

		entity.setHighestreward("123");
//		entity.setDraftstarttime(new Date());//DateUtil.toDate("2018-09-13  11:20:30")
//		entity.setDraftendtime(new Date());
		entity.setDraftstime("321312321");
		entity.setDraftetime("321321321");

		List<Pgymtawards> listawards = new ArrayList<Pgymtawards>();
		Pgymtawards awards = new Pgymtawards();
		awards.setTabIndex(1);
		awards.setName("奖项");
		awards.setAwardcount(12);
//		{
//			ArrayList arrayList=new ArrayList<>();
//			arrayList.add("a");
//			awards.setDbIds(arrayList);
//		}
		listawards.add(awards);
		
		List<Pgymtgroup> listgroup=new ArrayList<>();
		Pgymtgroup mtgroup =new Pgymtgroup();
		mtgroup.setTabIndex(1);
		mtgroup.setName("123aqe");
		listgroup.add(mtgroup);
		


		CommandModel cModel = new CommandModel();
		cModel.setMatch(entity);
		cModel.setMtawards(listawards);
		cModel.setMtgroup(listgroup);
		/*cModel.setMttext(listtext);*/
		entity.setCollectioncontents("fsakljfsai");

		entity.setAwards("fsakljfsai");
	
		entity.setDraftrules("fsakljfsai");

		entity.setSubmission("fsakljfsai");
	
		entity.setSchedule("fsakljfsai");
	
		entity.setSpecialdescription("fsakljfsai");


		entity.setMtawards(JacksonUtil.doJackson( listawards));
		entity.setMtgroup(JacksonUtil.doJackson(listgroup));
		
//		List<Pgymtawards> asd=convertJsonToList(entity.getMtawards(),Pgymtawards.class);
//		System.out.println(asd.get(0).getName());

		
		String url = "http://localhost:8080/artron-photography/pgymatch/mtadd?format=json&ignore=false";

		String strjson = JacksonUtil.doJackson(entity);

		Map<String, String> headers =new HashMap<>();
	
		
//		Pgymatch  aaaaa= JacksonUtil.convertJson2Bean(strjson,Pgymatch.class);
//		System.out.println(aaaaa.getName());
		System.out.println(strjson);
//		 headers.put("Content-type", "text/plain;charset=UTF-8");
		 headers.put("Content-type", "application/json; charset=UTF-8");
		String result = HttpClientUtil.post(url, strjson, headers,1000 * 60 * 5);
		System.out.println(result);

	}
	


}
