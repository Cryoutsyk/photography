package net.artron.cms.util;

import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringUtils {
	public static boolean isInt(String string) {
		if (string == null)
			return false;

		String regEx1 = "[\\-|\\+]?\\d+";
		Pattern p;
		Matcher m;
		p = Pattern.compile(regEx1);
		m = p.matcher(string);
		if (m.matches())
			return true;
		else
			return false;
	}

	public static String getUUID32() {
		// String uuid = UUID.randomUUID().toString().replace("-", "").toLowerCase();
		// return uuid;
		return UUID.randomUUID().toString().replace("-", "").toLowerCase();
	}

}
