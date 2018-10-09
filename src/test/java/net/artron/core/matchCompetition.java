package net.artron.core;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;

import net.artron.cms.pgymatch.model.inModel;
import net.mars.common.util.JacksonUtil;
import net.mars.common.util.http.HttpClientUtil;

public class matchCompetition {

	@Test
	public void test() {
		String url="http://localhost:8088/artron-photography/pgymatch/mtcompetition?format=json&ignore=false";//&id=1040414483119341568&version=2&competitionstate=2";
		
		inModel map =new inModel();
		map.setId( "1040414483119341568");
//		map.put("version", "7");
		map.setCompetitionstate( "4");
		
		String strjson = JacksonUtil.doJackson(map);
		System.out.println(strjson);
		
		Map<String, String> headers =new HashMap<>();
//		 headers.put("Content-type", "text/plain;charset=UTF-8");
		 headers.put("Content-type", "application/json; charset=UTF-8");
		String result = HttpClientUtil.post(url, strjson, headers,1000 * 60 * 5);
		System.out.println(result);
	}
}
