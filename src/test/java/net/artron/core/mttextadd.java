package net.artron.core;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import net.artron.cms.pgymttext.model.Pgymttext;
import net.mars.boot.SpringContextApplication;
import net.mars.boot.SpringContextBeanInitializer;
import net.mars.boot.akka.AkkaApplication;
import net.mars.common.util.http.HttpClientUtil;
import net.mars.core.boot.SpringBeanApplication;

@RunWith(SpringRunner.class)
@ContextConfiguration(classes = { AkkaApplication.class, SpringBeanApplication.class,
		SpringContextBeanInitializer.class, SpringContextApplication.class })
public class mttextadd {

	@Test
	public void textadd() {
		try {

			System.out.println("add");
			String url = "http://localhost:8080/artron-photography/pgymttext/add/command";// ?format=json&ignore=false&version=0";

			// Pgymttext entity = new Pgymttext();
			// entity.setCreatedBy("ziji");
			// entity.setUpdatedBy("yeshiziji");
			// entity.setTabIndex(0);
			// entity.setVersion(0);
			// // entity.setDbId("db___id");
			// entity.setMtId("mtId001");
			// entity.setTexttype("1");
			// entity.setTextcontent("neisadrong");

			Map<String, String> map = new HashMap<>();
			map.put("format", "json");
			map.put("ignore", "false");
			map.put("version", "0");
			
			map.put("createdBy", "ziji");
			map.put("updatedBy", "yeshiziji");
			map.put("tableindex", "0");
			map.put("mtId", "mtId001");
			map.put("texttype", "1");
			map.put("textcontent", "neisadrong");
			
			// map.put("entity", entity.toJson());

			String result = HttpClientUtil.post(url, map);
			System.out.println(result);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
