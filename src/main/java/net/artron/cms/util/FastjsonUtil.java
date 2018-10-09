package net.artron.cms.util;

import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.alibaba.fastjson.JSONObject;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class FastjsonUtil {
	/**
	 * json转List<T>
	 * @param json
	 * @param clazz
	 * @return
	 */
	public static <T> List<T> JsonToList(String json, Class<T> clazz) {
		if (StringUtils.isBlank(json)) {
			return null;
		}
		try {
			List<T> gameList = JSONObject.parseArray(json, clazz);
			return gameList;
		} catch (Exception e) {
			// TODO: handle exception
			log.error(e.getMessage());
		}
		return null;
	}

}
