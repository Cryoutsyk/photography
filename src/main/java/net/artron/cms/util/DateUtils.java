package net.artron.cms.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {
	/**
     * 把long 转换成 日期  
     */
    public static Date transferLongToDate( Long millSec) {
        Date date = new Date(millSec);
        return date;
    }
	/**
     * 把long 转换成 日期 再转换成String类型
     */
    public static String transferLongToDate(String dateFormat, Long millSec) {
        SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
        Date date = new Date(millSec);
        return sdf.format(date);
    }
}
