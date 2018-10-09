package net.artron.cms.util;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

//import org.springframework.beans.factory.annotation.Value;

public class PathUtil {

	public static String GetPathPrefix() {
		return ReadProperties.getPathPrefix();
	}
	public static String GetFolderPath () {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String strDate =sdf.format(new Date());
//		 DateUtil.formatDate(new Date());		
		String path = File.separator + "pgyimage" + File.separator + strDate + File.separator;
		return path;
	}
	
	/**
	 * 
	*@author mrshi-admin
	* @Title: getRootPath 
	* @Description: 获取根目录
	* @param path
	* @return    
	* @return String    
	* @throws
	 */
	public static String getRootPath(final File path) {
		while(path.getParentFile()!=null) {
			return getRootPath(path.getParentFile());
		}
		return path.getAbsolutePath();
	}	
}
