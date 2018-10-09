package net.artron.core;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.activation.MimetypesFileTypeMap;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;


import net.artron.cms.pgymatch.model.CommandModel;
import net.artron.cms.pgymatch.model.Pgymatch;
import net.artron.cms.pgymtawards.model.Pgymtawards;
import net.mars.boot.SpringContextApplication;
import net.mars.boot.SpringContextBeanInitializer;
import net.mars.boot.akka.AkkaApplication;
import net.mars.common.util.JacksonUtil;
import net.mars.common.util.http.HttpClientUtil;
import net.mars.core.boot.SpringBeanApplication;

@RunWith(SpringRunner.class)
@ContextConfiguration(classes = { AkkaApplication.class, SpringBeanApplication.class,
		SpringContextBeanInitializer.class, SpringContextApplication.class })
//@WebAppConfiguration
public class matchFile {
	@Test
	public void upfile() {
		 String url = "http://localhost:8080/artron-photography/pgymatch/mtupload?format=json&ignore=false";
     String fileName = "F:\\\\6sp照片视频201706252335\\\\106APPLE\\\\IMG_6004.JPG";
	Map<String, String> textMap = new HashMap<String, String>();
	textMap.put("imagetype", "1");
	//文件：设置file的name，路径
	Map<String, String> fileMap = new HashMap<String, String>();
	fileMap.put("file", fileName);
	String contentType = "";//image/png
	String result= formUpload(url, textMap, fileMap,contentType);
	System.out.println(result);
	}

	
//	@Test
//	public void upfile() {
////		 String url = "http://localhost:8080/artron-photography/pgymatch/mtadd";
////	        String fileName = "F:\\\\6sp照片视频201706252335\\\\106APPLE\\\\IMG_6004.JPG";
////		Map<String, String> textMap = new HashMap<String, String>();
////		//普通参数：可以设置多个input的name，value
////		textMap.put("name", "testname");
////		textMap.put("code", "2");
////		//文件：设置file的name，路径
////		Map<String, String> fileMap = new HashMap<String, String>();
////		fileMap.put("filehomebigimg", fileName);
////		String contentType = "";//image/png
////		 formUpload(url, textMap, fileMap,contentType);
//		
////		 FileInputStream fis;
////		 MockMultipartFile multipartFile = null;
////		try {
////			fis = new FileInputStream("F:\\6sp照片视频201706252335\\106APPLE\\IMG_6004.JPG");
////			multipartFile = new  MockMultipartFile("filehomebigimg","IMG_6004.JPG","image/jpeg",fis);
////		} catch (FileNotFoundException e) {
////			// TODO Auto-generated catch block
////			e.printStackTrace();
////		}catch (IOException e) {
////			// TODO Auto-generated catch block
////			e.printStackTrace();
////		}		
//		
//		Pgymatch entity =new Pgymatch();
//		entity.setName("ceshi");
//		entity.setCode("cceshicode");
////		entity.setFilehomebigimg(multipartFile);
//		
//		List<Pgymtawards> listawards=new ArrayList<Pgymtawards>();
//		Pgymtawards awards=new Pgymtawards();
//		awards.setName("奖项");
//		listawards.add(awards);
//		
//		
//		CommandModel cModel=new CommandModel();
//		cModel.setMatch(entity);
//		cModel.setMtawards(listawards);
//		
//	
//	        
//
//		String strjson=JacksonUtil.doJackson(cModel);
//System.out.println(strjson);
//		
////		System.out.println(textMap.toString());
//		
//		 String url = "http://localhost:8080/artron-photography/pgymatch/mtadd?format=json&ignore=false";
////        String fileName = "F:\\\\6sp照片视频201706252335\\\\106APPLE\\\\IMG_6004.JPG";
//		 
//		 Map<String, String> headers=new HashMap<String, String>();
////		 headers.put("Content-type", "text/plain;charset=UTF-8");
//		 headers.put("Content-type", "application/json; charset=UTF-8");
//        HttpClientUtil.post(url,strjson,headers ,1000*60*5);
//        
////	//文件：设置file的name，路径
////	Map<String, String> fileMap = new HashMap<String, String>();
////	fileMap.put("filehomebigimg", fileName);
////	String contentType = "";//image/png
////	 formUpload(url, textMap, fileMap,contentType);
//				
//	}
	
//	  @Autowired private WebApplicationContext wac;
//	    private MockMvc mockMvc;
//
//	    @Before(value = "")
//	    public void setup() {
//	        this .mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();	        // 构造MockMvc
//	    }
//	    
//	    @Test 
//	    public void postUpdateTeamPhotoEditWithStringParameter() throws Exception {
//	        // MockMultipartHttpServletRequest request = new // MockMultipartHttpServletRequest();
//	        final FileInputStream fis = new FileInputStream("F:\\6sp照片视频201706252335\\106APPLE\\IMG_6004.JPG");
//	        // MockMultipartFile multipartFile = new // MockMultipartFile("filehomebigimg","IMG_6004.JPG","image/jpeg",fis);
//	        // request.addFile(multipartFile);
//	        // request.setMethod("POST");
//	        // request.setContentType("multipart/form-data");
//	        // request.addHeader("Content-type", "multipart/form-data");
//	        // request.setRequestURI("http://localhost:8080/artron-photography/pgymatch/mtadd");
//	        // request.setParameter("name","test");
//	        // request.setParameter("code","tttt");
//	        //// int countTeamphoto = teamPhotoDao.getTeamphotoCount();
//	        //// int countTeamphotoclass = teamPhotoDao.getSTeamphotoclassCount();
//	        //// int countSpecification = teamPhotoDao.getSSpecificationCount();
//	        //// new AnnotationMethodHandlerAdapter().handle( request, new // MockHttpServletResponse(), PgymatchController );
//	        //// assertEquals( teamPhotoDao.getSTeamphotoById( TEAMPHOTOID ).getLeader(), // "lzj update" );
//	        //// assertEquals( teamPhotoDao.getTeamphotoCount(), countTeamphoto );
//	        //// assertEquals( teamPhotoDao.getSTeamphotoclassCount(), countTeamphotoclass ) //;
//	        //// assertEquals( teamPhotoDao.getSSpecificationCount(), countSpecification );
//	        // String result = mockMvc.perform(request.getSession((MockHttpSession) getLoginSession())) .andDo(MockMvcResultHandlers.print()).andExpect(MockMvcResultMatchers.status().isOk()).andReturn();
//
//	        
//	        String result = mockMvc.perform(MockMvcRequestBuilders.fileUpload("http://localhost:8080/artron-photography/pgymatch/mtadd")
//	        		.file(new MockMultipartFile("filehomebigimg", "IMG_6004.JPG", ",multipart/form-data", fis)// "hello  upload".getBytes("UTF-8")) 
//	        		).param("name", "test") 
//	        		.param("code", "tttt")) 
//	        		.andExpect(MockMvcResultMatchers.status().isOk()) 
//	        		.andReturn()
//	        		.getResponse()
//	        		.getContentAsString();
//	        System .out.println(result);
//	    }


	    
	    /**
		 * 上传图片
		 * @param urlStr
		 * @param textMap
		 * @param fileMap
		 * @param contentType 没有传入文件类型默认采用application/octet-stream
		 * contentType非空采用filename匹配默认的图片类型
		 * @return 返回response数据
		 */
		@SuppressWarnings("rawtypes")
		public static String formUpload(String urlStr, Map<String, String> textMap,
				Map<String, String> fileMap,String contentType) {
			String res = "";
			HttpURLConnection conn = null;
			// boundary就是request头和上传文件内容的分隔符
			String BOUNDARY = "---------------------------123821742118716"; 
			try {
				URL url = new URL(urlStr);
				conn = (HttpURLConnection) url.openConnection();
				conn.setConnectTimeout(5000);
				conn.setReadTimeout(30000);
				conn.setDoOutput(true);
				conn.setDoInput(true);
				conn.setUseCaches(false);
				conn.setRequestMethod("POST");
				conn.setRequestProperty("Connection", "Keep-Alive");
				conn.setRequestProperty("User-Agent",
						"Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN; rv:1.9.2.6)");
				conn.setRequestProperty("Content-Type",
						"multipart/form-data; boundary=" + BOUNDARY);
				OutputStream out = new DataOutputStream(conn.getOutputStream());
				// text
				if (textMap != null) {
					StringBuffer strBuf = new StringBuffer();
					Iterator iter = textMap.entrySet().iterator();
					while (iter.hasNext()) {
						Map.Entry entry = (Map.Entry) iter.next();
						String inputName = (String) entry.getKey();
						String inputValue = (String) entry.getValue();
						if (inputValue == null) {
							continue;
						}
						strBuf.append("\r\n").append("--").append(BOUNDARY)
								.append("\r\n");
						strBuf.append("Content-Disposition: form-data; name=\""
								+ inputName + "\"\r\n\r\n");
						strBuf.append(inputValue);
						System.out.println(inputName+","+inputValue);
					}
					out.write(strBuf.toString().getBytes());
				}
				// file
				if (fileMap != null) {
					Iterator iter = fileMap.entrySet().iterator();
					while (iter.hasNext()) {
						Map.Entry entry = (Map.Entry) iter.next();
						String inputName = (String) entry.getKey();
						String inputValue = (String) entry.getValue();
						if (inputValue == null) {
							continue;
						}
						File file = new File(inputValue);
						String filename = file.getName();
						
						//没有传入文件类型，同时根据文件获取不到类型，默认采用application/octet-stream
						contentType = new MimetypesFileTypeMap().getContentType(file);
						//contentType非空采用filename匹配默认的图片类型
						if(!"".equals(contentType)){
							if (filename.endsWith(".png")) {
								contentType = "image/png"; 
							}else if (filename.endsWith(".jpg") || filename.endsWith(".jpeg") || filename.endsWith(".jpe")) {
								contentType = "image/jpeg";
							}else if (filename.endsWith(".gif")) {
								contentType = "image/gif";
							}else if (filename.endsWith(".ico")) {
								contentType = "image/image/x-icon";
							}
						}
						if (contentType == null || "".equals(contentType)) {
							contentType = "application/octet-stream";
						}
						StringBuffer strBuf = new StringBuffer();
						strBuf.append("\r\n").append("--").append(BOUNDARY)
								.append("\r\n");
						strBuf.append("Content-Disposition: form-data; name=\""
								+ inputName + "\"; filename=\"" + filename
								+ "\"\r\n");
						System.out.println(inputName+","+filename);
						
						strBuf.append("Content-Type:" + contentType + "\r\n\r\n");
						out.write(strBuf.toString().getBytes());
						DataInputStream in = new DataInputStream(
								new FileInputStream(file));
						int bytes = 0;
						byte[] bufferOut = new byte[1024];
						while ((bytes = in.read(bufferOut)) != -1) {
							out.write(bufferOut, 0, bytes);
						}
						in.close();
					}
				}
				byte[] endData = ("\r\n--" + BOUNDARY + "--\r\n").getBytes();
				out.write(endData);
				out.flush();
				out.close();
				// 读取返回数据
				StringBuffer strBuf = new StringBuffer();
				BufferedReader reader = new BufferedReader(new InputStreamReader(
						conn.getInputStream()));
				String line = null;
				while ((line = reader.readLine()) != null) {
					strBuf.append(line).append("\n");
				}
				res = strBuf.toString();
				reader.close();
				reader = null;
			} catch (Exception e) {
				System.out.println("发送POST请求出错。" + urlStr);
				e.printStackTrace();
			} finally {
				if (conn != null) {
					conn.disconnect();
					conn = null;
				}
			}
			return res;
		}
 
}
