package net.artron.core;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import org.junit.Test;

import net.artron.cms.pgymatch.model.inModel;
import net.mars.common.util.JacksonUtil;
import net.mars.common.util.http.HttpClientUtil;

public class macthonline {

	@Test
	public void test() {

		
		String url = "http://localhost:8080/artron-photography/pgymatch/mtonline?format=json&ignore=false";//&id=1040414483119341568&version=1";

		inModel map =new inModel();
		map.setId( "1043033128572026880");
//		map.setCompetitionstate("asd");
//		map.put("version", "5");
		
		String strjson =  JacksonUtil.doJackson(map);
		System.out.println(strjson);
		Map<String, String> headers =new HashMap<>();
		//// headers.put("Content-type", "text/plain;charset=UTF-8");
//		 headers.put("Content-type", "application/json; charset=UTF-8");
		String result = HttpClientUtil.post(url, strjson, headers,1000 * 60 * 5);
		System.out.println(result);
	}
}
