package net.artron.core;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import net.artron.cms.pgymttext.model.Pgymttext;
import net.artron.cms.pgymttext.service.PgymttextService;
import net.mars.boot.SpringContextApplication;
import net.mars.boot.SpringContextBeanInitializer;
import net.mars.boot.akka.AkkaApplication;
import net.mars.common.util.http.HttpClientUtil;
import net.mars.core.boot.SpringBeanApplication;

@RunWith(SpringRunner.class)
@ContextConfiguration(classes = { AkkaApplication.class, SpringBeanApplication.class,
		SpringContextBeanInitializer.class, SpringContextApplication.class })
public class mttextupdate {

	/**
	 * 注入Service类对象.
	 */
	@Resource(name = "pgymttextService")
	PgymttextService pgymttextService;

	@Test
	public void textupdate() {
		// String
		// url="http://localhost:8080/artron-photography/pgymttext/query?format=json&ignore=false&version=0&dbId=1036461456851206144";
		// String querydata=HttpClientUtil.get(url);
		System.out.println("query");
		Pgymttext mpgymttext = pgymttextService.queryById("1036820926261362688");

		mpgymttext.setUpdatedBy("修改1");
		mpgymttext.setVersion(1);
		mpgymttext.setMtId("mtId0021");
		mpgymttext.setTexttype("21");
		mpgymttext.setTextcontent("xiugaile1");

		System.out.println("update");
		String url = "http://localhost:8080/artron-photography/pgymttext/update/command";

		Map<String, String> map = new HashMap<>();
		map.put("format", "json");
		map.put("ignore", "false");
		map.put("version", mpgymttext.getVersion().toString());
		map.put("dbId", mpgymttext.getDbId());

		// map.put("createdDt", null);//mpgymttext.getCreatedDt().toString());
		map.put("updatedBy", mpgymttext.getUpdatedBy());
		map.put("mtId", mpgymttext.getMtId());
		map.put("texttype", mpgymttext.getTexttype());
		map.put("textcontent", mpgymttext.getTextcontent());

		// map.put("entity", entity.toJson());

		String result = HttpClientUtil.post(url, map);
		System.out.println(result);

		// mpgymttext转map 传mpgymttext

	}
}
