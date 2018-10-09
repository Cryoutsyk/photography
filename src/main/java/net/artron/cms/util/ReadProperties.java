package net.artron.cms.util;

import java.io.InputStream;
import java.util.Properties;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ReadProperties {
	public static String pathPrefix = null;
	// 类加载后就执行,在需要的地方直接用类名.属性名即可，如ReadProperties.host，其他类要使用时需要将属性定义成public的，或者提供get方法
	static {
		loads();
	}

	/**
	 * 读取properties
	 */
	public static void loads() {
		if (pathPrefix == null || pathPrefix == null) {
			InputStream is = ReadProperties.class.getResourceAsStream("/app.properties");
			Properties dbProps = new Properties();
			try {
				dbProps.load(is);
				pathPrefix = dbProps.getProperty("pathPrefix");		
			} catch (Exception e) {
				log.error("不能读取属性文件. " + "请确保app.properties在CLASSPATH指定的路径中");
			}
		}
	}

	/**
	 * 上传文件路径前缀
	 * 也可以调方法获取值，这样更万无一失,强烈建议用此方法，防止jvm内存回收后数据为空（看网上说静态属性是不会被回收的，除非类被回收）
	 * 
	 * @return
	 */
	public static String getPathPrefix() {
		if (pathPrefix == null) {
			loads();
		}
		return pathPrefix;
	}


	public static void main(String[] args) {
		System.out.println(ReadProperties.pathPrefix  );
		getPathPrefix();
		System.out.println(ReadProperties.pathPrefix );
	}

}
