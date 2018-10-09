package net.artron.cms.ueditor.baidu.ueditor.upload;
import java.util.Map;
import net.artron.cms.ueditor.baidu.ueditor.PathFormat;
import net.artron.cms.ueditor.baidu.ueditor.define.AppInfo;
import net.artron.cms.ueditor.baidu.ueditor.define.BaseState;
import net.artron.cms.ueditor.baidu.ueditor.define.FileType;
import net.artron.cms.ueditor.baidu.ueditor.define.State;
import org.apache.commons.codec.binary.Base64;


public final class Base64Uploader {

	public static State save(String content, Map<String, Object> conf) {
		
		byte[] data = decode(content);

		long maxSize = ((Long) conf.get("maxSize")).longValue();

		if (!validSize(data, maxSize)) {
			return new BaseState(false, AppInfo.MAX_SIZE);
		}

		String suffix = FileType.getSuffix("JPG");

		String savePath = PathFormat.parse((String) conf.get("savePath"),
				(String) conf.get("filename"));
		
		savePath = savePath + suffix;
		String physicalPath = (String) conf.get("basePath") + savePath;

		State storageState = StorageManager.saveBinaryFile(data, physicalPath);

		if (storageState.isSuccess()) {
			storageState.putInfo("url", PathFormat.format((String) conf.get("basePath")+savePath));
			storageState.putInfo("type", suffix);
			storageState.putInfo("original", "");
		}

		return storageState;
	}

	private static byte[] decode(String content) {
		return Base64.decodeBase64(content);
	}

	private static boolean validSize(byte[] data, long length) {
		return data.length <= length;
	}
	
}