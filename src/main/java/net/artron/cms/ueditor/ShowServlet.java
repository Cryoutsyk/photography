package net.artron.cms.ueditor;

import net.artron.cms.util.PathUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.util.UriUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

@WebServlet(urlPatterns="/photoUeditor/*",loadOnStartup=1)
public class ShowServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private Logger logger = LoggerFactory.getLogger(getClass());
    public ShowServlet(){
        System.out.print("");
    }
    public void fileOutputStream(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
       // System.out.println(System.getProperty("user.dir"));
        String s  = System.getProperty("catalina.home");
        String rootPath1 = PathUtil.getRootPath(new File(s));

        String path ="";
        String rootPath = req.getSession().getServletContext().getRealPath("/");
        String filepath = req.getRequestURI();  //    "/artron-photography/imagesUeditor/image/20180929/1538218595676029450.jpg"
        String servletPath = req.getServletPath();  //   "/imagesUeditor/image"
        String contextPath = req.getServletContext().getContextPath();  //  /artron-photography
        String substring = filepath.substring(contextPath.length());
        File file1 = new File(rootPath1 + substring);



        try {
            path = UriUtils.decode(rootPath1 + substring, "UTF-8");
        } catch (UnsupportedEncodingException e1) {
            logger.error(String.format("解释文件路径失败，URL地址为%s", path), e1);
        }
        File file = new File(path);

        try {
			/*resp.setHeader("Accept-Ranges", "bytes");
			resp.setHeader("ETag",req.getRequestURI());*/
            if(file.getName().contains(".jpg") || file.getName().contains(".jpeg") || file.getName().contains(".png")){
            }else if(file.getName().contains(".html")){
                resp.setHeader("Content-Type", "text/html");
            }else{
                resp.setHeader("Content-Type", "application/octet-stream");
            }

            FileCopyUtils.copy(new FileInputStream(file), resp.getOutputStream());
            return;
        } catch (FileNotFoundException e) {
            req.setAttribute("exception", new FileNotFoundException("请求的文件不存在"));
          //  req.getRequestDispatcher("/WEB-INF/views/error/404.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        fileOutputStream(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        fileOutputStream(req, resp);
    }

    @Override
    public void init() throws ServletException {
        super.init();
    }
}
