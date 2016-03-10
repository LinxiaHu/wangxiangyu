package control;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.RequestContext;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;

import util.Info;

import dao.CommDAO;

public class MainCtrl extends HttpServlet {

	public MainCtrl() {

		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void go(String url, HttpServletRequest request, HttpServletResponse response) {
		try {
			request.getRequestDispatcher(url).forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void gor(String url, HttpServletRequest request, HttpServletResponse response) {
		try {
			response.sendRedirect(url);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String ac = request.getParameter("ac");
		if (ac == null)
			ac = "";
		CommDAO dao = new CommDAO();
		String date = Info.getDateStr();
		String today = date.substring(0, 10);
		String tomonth = date.substring(0, 7);

		// 登录
		if (ac.equals("login")) {
			String username = request.getParameter("uname");
			String password = request.getParameter("upass");
			String utype = request.getParameter("utype");
			String sql = "select * from sysuser where uname='" + username + "' and upass='" + password + "' and utype='"
					+ utype + "'";
			List<HashMap> userlist = dao.select(sql);
			if (userlist.size() != 1) {
				request.setAttribute("error", "");
				go("/index.jsp", request, response);
			} else {
				request.getSession().setAttribute("user", userlist.get(0));
				gor("/fzsalessys/admin/index.jsp", request, response);
			}
		}

		if (ac.equals("uploaddoc")) {
			try {
				String filename = "";
				request.setCharacterEncoding("utf-8");
				RequestContext requestContext = new ServletRequestContext(request);
				if (FileUpload.isMultipartContent(requestContext)) {

					DiskFileItemFactory factory = new DiskFileItemFactory();
					factory.setRepository(new File(request.getRealPath("/upfile/") + "/"));
					ServletFileUpload upload = new ServletFileUpload(factory);
					upload.setSizeMax(100 * 1024 * 1024);
					List items = new ArrayList();

					items = upload.parseRequest(request);

					FileItem fileItem = (FileItem) items.get(0);
					if (fileItem.getName() != null && fileItem.getSize() != 0) {
						if (fileItem.getName() != null && fileItem.getSize() != 0) {
							File fullFile = new File(fileItem.getName());
							filename = Info.generalFileName(fullFile.getName());
							File newFile = new File(request.getRealPath("/upfile/") + "/" + filename);
							try {
								fileItem.write(newFile);
							} catch (Exception e) {
								e.printStackTrace();
							}
						} else {
						}
					}
				}

				go("/js/uploaddoc.jsp?docname=" + filename, request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}

		// 登录
		if (ac.equals("flogin")) {
			String username = request.getParameter("uname");
			String password = request.getParameter("upass");
			String utype = request.getParameter("utype");
			String sql = "select * from sysuser where uname='" + username + "' and upass='" + password + "' ";
			List<HashMap> userlist = dao.select(sql);
			if (userlist.size() != 1) {
				request.setAttribute("error", "");
				go("/login.jsp", request, response);
			} else {
				request.getSession().setAttribute("user", userlist.get(0));
				gor("index.jsp", request, response);
			}
		}

		// 修改密码
		if (ac.equals("uppass")) {
			String pass = request.getParameter("pass");
			String id = request.getParameter("id");
			String sql = "update sysuser set upass='" + pass + "' where id=" + id;
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/admin/uppass.jsp", request, response);
		}

		if (ac.equals("addjsy")) {
			String xinmin = request.getParameter("xinmin");
			String gonghao = request.getParameter("gonghao");
			String filename = request.getParameter("filename");
			String xinbie = request.getParameter("xinbie");
			String xueli = request.getParameter("xueli");
			String senri = request.getParameter("senri");
			String jiguan = request.getParameter("jiguan");
			String dianhua = request.getParameter("dianhua");
			String souji = request.getParameter("souji");
			String sql = "insert into yudiinfo values('" + xinmin + "','" + gonghao + "','" + filename + "','" + xinbie
					+ "','" + xueli + "','" + senri + "','" + jiguan + "','场馆','" + souji + "')";
			HashMap extmap = new HashMap();
			extmap.put("dianhua", "场馆");
			dao.insert(request, response, "yudiinfo", extmap, false, false);
			request.setAttribute("suc", "");
			go("/admin/jsydj.jsp", request, response);
		}

		if (ac.equals("updatejsy")) {
			String id = request.getParameter("id");
			String xinmin = request.getParameter("xinmin");
			String gonghao = request.getParameter("gonghao");
			String filename = request.getParameter("filename");
			String xinbie = request.getParameter("xinbie");
			String xueli = request.getParameter("xueli");
			String senri = request.getParameter("senri");
			String jiguan = request.getParameter("jiguan");
			String dianhua = request.getParameter("dianhua");
			String souji = request.getParameter("souji");
			String sql = "update yudiinfo set xinmin='" + xinmin + "',gonghao='" + gonghao + "',filename='" + filename
					+ "',xinbie='" + xinbie + "',xueli='" + xueli + "',senri='" + senri + "',jiguan='" + jiguan
					+ "',dianhua='" + dianhua + "',souji='" + souji + "' where id=" + id;
			dao.commOper(sql);
			request.setAttribute("suc", "");
			request.setAttribute("suc", "");
			go("/admin/jsydj.jsp", request, response);
		}

		if (ac.equals("addcl")) {
			String cheph = request.getParameter("cheph");
			String pinpai = request.getParameter("pinpai");
			String xinhao = request.getParameter("xinhao");
			String filename = request.getParameter("filename");
			String fadjh = request.getParameter("fadjh");
			String dipanhao = request.getParameter("dipanhao");
			String yanse = request.getParameter("yanse");
			String jijiaoqih = request.getParameter("jijiaoqih");
			String goumaije = request.getParameter("goumaije");
			String sencangrq = request.getParameter("sencangrq");
			String goumairq = request.getParameter("goumairq");
			String sql = "insert into stuinfo values('" + cheph + "','" + pinpai + "','" + xinhao + "','" + filename
					+ "','" + fadjh + "','" + dipanhao + "','" + yanse + "','" + jijiaoqih + "','" + goumaije + "','"
					+ sencangrq + "','" + goumairq + "','" + date + "')";
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/admin/cldj.jsp", request, response);
		}

		if (ac.equals("upcl")) {
			String id = request.getParameter("id");
			String cheph = request.getParameter("cheph");
			String pinpai = request.getParameter("pinpai");
			String xinhao = request.getParameter("xinhao");
			String filename = request.getParameter("filename");
			String fadjh = request.getParameter("fadjh");
			String dipanhao = request.getParameter("dipanhao");
			String yanse = request.getParameter("yanse");
			String jijiaoqih = request.getParameter("jijiaoqih");
			String goumaije = request.getParameter("goumaije");
			String sencangrq = request.getParameter("sencangrq");
			String goumairq = request.getParameter("goumairq");
			String sql = "update stuinfo set cheph='" + cheph + "',pinpai='" + pinpai + "',xinhao='" + xinhao
					+ "',filename='" + filename + "',fadjh='" + fadjh + "',dipanhao='" + dipanhao + "',yanse='" + yanse
					+ "',jijiaoqih='" + jijiaoqih + "',goumaije='" + goumaije + "',sencangrq='" + sencangrq
					+ "',goumairq='" + goumairq + "' where id=" + id;
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/admin/cldj.jsp", request, response);
		}

		if (ac.equals("addqj")) {
			String jiasy = request.getParameter("jiasy");
			String qinjlx = request.getParameter("qinjlx");
			String kaissj = request.getParameter("kaissj");
			String jiessj = request.getParameter("jiessj");
			String tians = request.getParameter("tians");
			String bei = request.getParameter("bei");
			String sql = "insert into qjinfo values('" + jiasy + "','" + qinjlx + "','" + kaissj + "','" + jiessj
					+ "','" + tians + "','" + bei + "','" + Info.getDateStr() + "')";
			dao.commOper(sql);
			go("/admin/qjjl.jsp", request, response);
		}

		if (ac.equals("upqj")) {
			String id = request.getParameter("id");
			String jiasy = request.getParameter("jiasy");
			String qinjlx = request.getParameter("qinjlx");
			String kaissj = request.getParameter("kaissj");
			String jiessj = request.getParameter("jiessj");
			String tians = request.getParameter("tians");
			String bei = request.getParameter("bei");
			String sql = "update qjinfo set jiasy='" + jiasy + "' ,qinjlx='" + qinjlx + "', kaissj='" + kaissj
					+ "' ,jiessj='" + jiessj + "', tians='" + tians + "', bei='" + bei + "' where id=" + id;
			dao.commOper(sql);
			go("/admin/qjjl.jsp", request, response);
		}

		if (ac.equals("addhs")) {
			String cheph = request.getParameter("cheph");
			String haoslx = request.getParameter("haoslx");
			String biaoyr = request.getParameter("biaoyr");
			String jiasy = request.getParameter("jiasy");
			String biaoysj = request.getParameter("biaoysj");
			String shiyou = request.getParameter("shiyou");
			String bei = request.getParameter("bei");

			String sql = "insert into hsinfo values('" + cheph + "','" + haoslx + "','" + biaoyr + "','" + jiasy + "','"
					+ biaoysj + "','" + shiyou + "','" + bei + "','" + Info.getDateStr() + "','1')";
			dao.commOper(sql);
			go("/admin/hsjl.jsp", request, response);
		}

		if (ac.equals("uphs")) {
			String id = request.getParameter("id");
			String cheph = request.getParameter("cheph");
			String haoslx = request.getParameter("haoslx");
			String biaoyr = request.getParameter("biaoyr");
			String jiasy = request.getParameter("jiasy");
			String biaoysj = request.getParameter("biaoysj");
			String shiyou = request.getParameter("shiyou");
			String bei = request.getParameter("bei");

			String sql = "update hsinfo set  cheph='" + cheph + "',haoslxc='" + haoslx + "',biaoyr='" + biaoyr
					+ "',jiasy='" + jiasy + "',biaoysj='" + biaoysj + "',shiyou='" + shiyou + "',bei='" + bei
					+ "' where id=" + id;
			dao.commOper(sql);
			go("/admin/hsjl.jsp", request, response);
		}

		if (ac.equals("addts")) {
			String cheph = request.getParameter("cheph");
			String haoslx = request.getParameter("haoslx");
			String biaoyr = request.getParameter("biaoyr");
			String jiasy = request.getParameter("jiasy");
			String biaoysj = request.getParameter("biaoysj");
			String shiyou = request.getParameter("shiyou");
			String bei = request.getParameter("bei");

			String sql = "insert into hsinfo values('" + cheph + "','" + haoslx + "','" + biaoyr + "','" + jiasy + "','"
					+ biaoysj + "','" + shiyou + "','" + bei + "','" + Info.getDateStr() + "','2')";
			dao.commOper(sql);
			go("/admin/tsjl.jsp", request, response);
		}

		if (ac.equals("upts")) {
			String id = request.getParameter("id");
			String cheph = request.getParameter("cheph");
			String haoslx = request.getParameter("haoslx");
			String biaoyr = request.getParameter("biaoyr");
			String jiasy = request.getParameter("jiasy");
			String biaoysj = request.getParameter("biaoysj");
			String shiyou = request.getParameter("shiyou");
			String bei = request.getParameter("bei");

			String sql = "update hsinfo set cheph='" + cheph + "',haoslxc='" + haoslx + "',biaoyr='" + biaoyr
					+ "',jiasy='" + jiasy + "',biaoysj='" + biaoysj + "',shiyou='" + shiyou + "',bei='" + bei
					+ "' where id=" + id;
			dao.commOper(sql);
			go("/admin/tsjl.jsp", request, response);
		}

		if (ac.equals("uprj")) {
			String id = request.getParameter("id");
			String kaisgl = request.getParameter("kaisgl");
			String yinjyysr = request.getParameter("yinjyysr");
			String jiesgl = request.getParameter("jiesgl");
			String koujfy = request.getParameter("koujfy");
			String sjgl = request.getParameter("sjgl");
			String sjje = request.getParameter("sjje");
			String kousuo = request.getParameter("kousuo");
			String bei = request.getParameter("bei");
			String sql = "update mrdjinfo set kaisgl='" + kaisgl + "', kaisgl='" + kaisgl + "', jiesgl='" + jiesgl
					+ "', koujfy='" + koujfy + "', sjgl='" + sjgl + "', sjje='" + sjje + "', kousuo='" + kousuo
					+ "', bei='" + bei + "' where id=" + id;
			dao.commOper(sql);
			String type = request.getParameter("type");
			if (type.equals(""))
				type = "/admin/gcldd.jsp";
			if (type.equals("jk"))
				type = "/admin/gjkdj.jsp";

			go(type, request, response);
		}

		if (ac.equals("upyj")) {
			String yinjsj = request.getParameter("yinjsj");
			String shijsj = request.getParameter("shijsj");
			String bei = request.getParameter("bei");
			String guanlf = request.getParameter("guanlf");
			String shuis = request.getParameter("shuis");
			String gpsf = request.getParameter("gpsf");
			String ffbz = request.getParameter("ffbz");
			String yinjhj = request.getParameter("yinjhj");
			String shijje = request.getParameter("shijje");
			String chae = request.getParameter("chae");
			String id = request.getParameter("id");
			String sql = "update yjkdj set yinjsj='" + yinjsj + "', shijsj='" + shijsj + "', bei='" + bei
					+ "', guanlf='" + guanlf + "', shuis='" + shuis + "', gpsf='" + gpsf + "', ffbz='" + ffbz
					+ "', yinjhj='" + yinjhj + "', shijje='" + shijje + "', chae='" + chae + "' where id=" + id;
			dao.commOper(sql);

			String type = request.getParameter("type");
			if (type == null)
				type = "";
			if (type.equals(""))
				type = "/admin/scldd.jsp";
			if (type.equals("jk"))
				type = "/admin/sjkdj.jsp";

			go(type, request, response);
		}

		if (ac.equals("addwxjl")) {
			String cheph = request.getParameter("cheph");
			String weixjs = request.getParameter("weixjs");
			String weixsj = request.getParameter("weixsj");
			String weixgs = request.getParameter("weixgs");
			String weixjl = request.getParameter("weixjl");
			String weixc = request.getParameter("weixc");
			String weixje = request.getParameter("weixje");
			String jiasy = request.getParameter("jiasy");
			String bei = request.getParameter("bei");
			String guak = request.getParameter("guak");
			String beiz = request.getParameter("beiz");
			String sql = "insert into wxinfo values('" + cheph + "','" + weixjs + "','" + weixsj + "','" + weixgs
					+ "','" + weixjl + "','" + weixc + "','" + weixje + "','" + jiasy + "','" + bei + "','" + guak
					+ "','" + beiz + "')";
			dao.commOper(sql);
			go("/admin/wxjl.jsp", request, response);
		}

		if (ac.equals("upwxjl")) {
			String id = request.getParameter("id");
			String cheph = request.getParameter("cheph");
			String weixjs = request.getParameter("weixjs");
			String weixsj = request.getParameter("weixsj");
			String weixgs = request.getParameter("weixgs");
			String weixjl = request.getParameter("weixjl");
			String weixc = request.getParameter("weixc");
			String weixje = request.getParameter("weixje");
			String jiasy = request.getParameter("jiasy");
			String bei = request.getParameter("bei");
			String guak = request.getParameter("guak");
			String beiz = request.getParameter("beiz");
			String sql = "update wxinfo set cheph='" + cheph + "',weixjs='" + weixjs + "',weixsj='" + weixsj
					+ "',weixgs='" + weixgs + "',weixjl='" + weixjl + "',weixc='" + weixc + "',weixje='" + weixje
					+ "',jiasy='" + jiasy + "',bei='" + bei + "',guak='" + guak + "',beiz='" + beiz + "' where id="
					+ id;
			dao.commOper(sql);
			go("/admin/wxjl.jsp", request, response);
		}

		if (ac.equals("addtbjl")) {
			String cheph = request.getParameter("cheph");
			String baoxlx = request.getParameter("baoxlx");
			String baoxgs = request.getParameter("baoxgs");
			String baodh = request.getParameter("baodh");
			String taobsj = request.getParameter("taobsj");
			String baoxje = request.getParameter("baoxje");
			String taobed = request.getParameter("taobed");
			String xiactbsj = request.getParameter("xiactbsj");
			String bei = request.getParameter("bei");
			String sql = "insert into tbinfo values( '" + cheph + "','" + baoxlx + "','" + baoxgs + "','" + baodh
					+ "','" + taobsj + "','" + baoxje + "','" + taobed + "','" + xiactbsj + "','" + bei + "','" + date
					+ "')";
			System.out.println(sql);

			dao.commOper(sql);
			go("/admin/tbjl.jsp", request, response);
		}

		if (ac.equals("uptbjl")) {
			String id = request.getParameter("id");
			String cheph = request.getParameter("cheph");
			String baoxlx = request.getParameter("baoxlx");
			String baoxgs = request.getParameter("baoxgs");
			String baodh = request.getParameter("baodh");
			String taobsj = request.getParameter("taobsj");
			String baoxje = request.getParameter("baoxje");
			String taobed = request.getParameter("taobed");
			String xiactbsj = request.getParameter("xiactbsj");
			String bei = request.getParameter("bei");
			String sql = "update tbinfo set cheph='" + cheph + "',baoxlx='" + baoxlx + "',baoxgs='" + baoxgs
					+ "',baodh='" + baodh + "',taobsj='" + taobsj + "',baoxje='" + baoxje + "',taobed='" + taobed
					+ "',xiactbsj='" + xiactbsj + "',bei='" + bei + "' where id=" + id;
			System.out.println(sql);

			dao.commOper(sql);
			go("/admin/tbjl.jsp", request, response);
		}

		if (ac.equals("addjfjl")) {
			String cheph = request.getParameter("cheph");
			String jiaoflx = request.getParameter("jiaoflx");
			String shoufdw = request.getParameter("shoufdw");
			String jiaofh = request.getParameter("jiaofh");
			String jiaofsj = request.getParameter("jiaofsj");
			String jiaofje = request.getParameter("jiaofje");
			String jiasy = request.getParameter("jiasy");
			String xiacjfsj = request.getParameter("xiacjfsj");
			String bei = request.getParameter("bei");
			String sql = "insert into jfinfo values( '" + cheph + "','" + jiaoflx + "','" + shoufdw + "','" + jiaofh
					+ "','" + jiaofsj + "','" + jiaofje + "','" + jiasy + "','" + xiacjfsj + "','" + bei + "','" + date
					+ "')";
			System.out.println(sql);

			dao.commOper(sql);
			go("/admin/jfjl.jsp", request, response);
		}

		if (ac.equals("upjfjl")) {
			String id = request.getParameter("id");
			String cheph = request.getParameter("cheph");
			String jiaoflx = request.getParameter("jiaoflx");
			String shoufdw = request.getParameter("shoufdw");
			String jiaofh = request.getParameter("jiaofh");
			String jiaofsj = request.getParameter("jiaofsj");
			String jiaofje = request.getParameter("jiaofje");
			String jiasy = request.getParameter("jiasy");
			String xiacjfsj = request.getParameter("xiacjfsj");
			String bei = request.getParameter("bei");
			String sql = "update jfinfo set cheph='" + cheph + "',jiaoflx='" + jiaoflx + "',shoufdw='" + shoufdw
					+ "',jiaofh='" + jiaofh + "',jiaofsj='" + jiaofsj + "',jiaofje='" + jiaofje + "',jiasy='" + jiasy
					+ "',xiacjfsj='" + xiacjfsj + "',bei='" + bei + "' where id=" + id;
			System.out.println(sql);
			dao.commOper(sql);
			go("/admin/jfjl.jsp", request, response);
		}

		if (ac.equals("addlsjl")) {
			String cheph = request.getParameter("cheph");
			String liansdj = request.getParameter("liansdj");
			String lianssj = request.getParameter("lianssj");
			String liansje = request.getParameter("liansje");
			String xiaclssj = request.getParameter("xiaclssj");
			String bei = request.getParameter("bei");
			String sql = "insert into lsinfo values( '" + cheph + "','" + liansdj + "','" + lianssj + "','" + liansje
					+ "','" + xiaclssj + "','" + bei + "','" + date + "')";
			System.out.println(sql);

			dao.commOper(sql);
			go("/admin/lsjl.jsp", request, response);
		}

		if (ac.equals("uplsjl")) {
			String id = request.getParameter("id");
			String cheph = request.getParameter("cheph");
			String liansdj = request.getParameter("liansdj");
			String lianssj = request.getParameter("lianssj");
			String liansje = request.getParameter("liansje");
			String xiaclssj = request.getParameter("xiaclssj");
			String bei = request.getParameter("bei");
			String sql = "update lsinfo set cheph='" + cheph + "',liansdj='" + liansdj + "',lianssj='" + lianssj
					+ "',liansje='" + liansje + "',xiaclssj='" + xiaclssj + "',bei='" + bei + "' where id=" + id;
			System.out.println(sql);
			dao.commOper(sql);
			go("/admin/lsjl.jsp", request, response);
		}

		if (ac.equals("addsgjl")) {
			String cheph = request.getParameter("cheph");
			String shiglx = request.getParameter("shiglx");
			String jiasy = request.getParameter("jiasy");
			String shigsj = request.getParameter("shigsj");
			String fasdz = request.getParameter("fasdz");
			String duifjsy = request.getParameter("duifjsy");
			String duifcph = request.getParameter("duifcph");
			String duiflxfs = request.getParameter("duiflxfs");
			String gongscdje = request.getParameter("gongscdje");
			String gercdje = request.getParameter("gercdje");
			String duifcdje = request.getParameter("duifcdje");
			String baoxcdje = request.getParameter("baoxcdje");

			String bei = request.getParameter("bei");
			String sql = "insert into sginfo values( '" + cheph + "'," + "'" + shiglx + "'," + "'" + jiasy + "'," + "'"
					+ shigsj + "'," + "'" + fasdz + "'," + "'" + duifjsy + "'," + "'" + duifcph + "'," + "'" + duiflxfs
					+ "'," + "'" + gongscdje + "'," + "'" + gercdje + "'," + "'" + duifcdje + "'," + "'" + baoxcdje
					+ "'," + "'" + bei + "'," + "'" + date + "')";
			System.out.println(sql);

			dao.commOper(sql);
			go("/admin/sgjl.jsp", request, response);
		}

		if (ac.equals("upsgjl")) {
			String id = request.getParameter("id");
			String cheph = request.getParameter("cheph");
			String shiglx = request.getParameter("shiglx");
			String jiasy = request.getParameter("jiasy");
			String shigsj = request.getParameter("shigsj");
			String fasdz = request.getParameter("fasdz");
			String duifjsy = request.getParameter("duifjsy");
			String duifcph = request.getParameter("duifcph");
			String duiflxfs = request.getParameter("duiflxfs");
			String gongscdje = request.getParameter("gongscdje");
			String gercdje = request.getParameter("gercdje");
			String duifcdje = request.getParameter("duifcdje");
			String baoxcdje = request.getParameter("baoxcdje");
			String bei = request.getParameter("bei");
			String sql = "update sginfo set           cheph=    '" + cheph + "'," + "shiglx='" + shiglx + "',"
					+ "jiasy='" + jiasy + "'," + "shigsj='" + shigsj + "'," + "fasdz='" + fasdz + "'," + "duifjsy='"
					+ duifjsy + "'," + "duifcph='" + duifcph + "'," + "duiflxfs='" + duiflxfs + "'," + "gongscdje='"
					+ gongscdje + "'," + "gercdje='" + gercdje + "'," + "duifcdje='" + duifcdje + "'," + "baoxcdje='"
					+ baoxcdje + "'," + "bei='" + bei + "' where id='" + id + "'";
			System.out.println(sql);
			dao.commOper(sql);
			go("/admin/sgjl.jsp", request, response);
		}

		if (ac.equals("addwzjl")) {
			String cheph = request.getParameter("cheph");
			String weizxm = request.getParameter("weizxm");
			String weizdz = request.getParameter("weizdz");
			String jiasy = request.getParameter("jiasy");
			String weizsj = request.getParameter("weizsj");
			String fakje = request.getParameter("fakje");
			String bei = request.getParameter("bei");
			String sql = "insert into wzinfo values( '" + cheph + "'," + "'" + weizxm + "'," + "'" + weizdz + "'," + "'"
					+ jiasy + "'," + "'" + weizsj + "'," + "'" + fakje + "'," + "'" + bei + "'," + "'" + date + "')";
			System.out.println(sql);

			dao.commOper(sql);
			go("/admin/wzjl.jsp", request, response);
		}

		if (ac.equals("upwzjl")) {
			String id = request.getParameter("id");
			String cheph = request.getParameter("cheph");
			String weizxm = request.getParameter("weizxm");
			String weizdz = request.getParameter("weizdz");
			String jiasy = request.getParameter("jiasy");
			String weizsj = request.getParameter("weizsj");
			String fakje = request.getParameter("fakje");
			String bei = request.getParameter("bei");
			String sql = "update wzinfo set           cheph=    '" + cheph + "'," + "weizxm='" + weizxm + "',"
					+ "weizdz='" + weizdz + "'," + "jiasy='" + jiasy + "'," + "weizsj='" + weizsj + "'," + "fakje='"
					+ fakje + "'," + "bei='" + bei + "' where id='" + id + "'";
			System.out.println(sql);
			dao.commOper(sql);
			go("/admin/wzjl.jsp", request, response);
		}

		if (ac.equals("addfyzc")) {
			String cheph = request.getParameter("cheph");
			String zhiclx = request.getParameter("zhiclx");
			String zhicsj = request.getParameter("zhicsj");
			String zhicje = request.getParameter("zhicje");
			String jiasy = request.getParameter("jiasy");
			String bei = request.getParameter("bei");
			String sql = "insert into fyzcinfo values( '" + cheph + "'," + "'" + zhiclx + "'," + "'" + zhicsj + "',"
					+ "'" + zhicje + "'," + "'" + jiasy + "'," + "'" + bei + "'," + "'" + date + "')";
			System.out.println(sql);

			dao.commOper(sql);
			go("/admin/fyzc.jsp", request, response);
		}

		if (ac.equals("upfyzc")) {
			String id = request.getParameter("id");
			String cheph = request.getParameter("cheph");
			String zhiclx = request.getParameter("zhiclx");
			String zhicsj = request.getParameter("zhicsj");
			String zhicje = request.getParameter("zhicje");
			String jiasy = request.getParameter("jiasy");
			String bei = request.getParameter("bei");
			String sql = "update fyzcinfo set           cheph=    '" + cheph + "'," + "zhiclx='" + zhiclx + "',"
					+ "zhicsj='" + zhicsj + "'," + "zhicje='" + zhicje + "'," + "jiasy='" + jiasy + "'," + "bei='" + bei
					+ "' where id='" + id + "'";
			System.out.println(sql);
			dao.commOper(sql);
			go("/admin/fyzc.jsp", request, response);
		}

		if (ac.equals("addqtsr")) {
			String cheph = request.getParameter("cheph");
			String shourlx = request.getParameter("shourlx");
			String shoursj = request.getParameter("shoursj");
			String shourje = request.getParameter("shourje");
			String jiasy = request.getParameter("jiasy");
			String bei = request.getParameter("bei");
			String sql = "insert into qtsrinfo values( '" + cheph + "'," + "'" + shourlx + "'," + "'" + shoursj + "',"
					+ "'" + shourje + "'," + "'" + jiasy + "'," + "'" + bei + "'," + "'" + date + "')";
			System.out.println(sql);

			dao.commOper(sql);
			go("/admin/qtsr.jsp", request, response);
		}

		if (ac.equals("upqtsr")) {
			String id = request.getParameter("id");
			String cheph = request.getParameter("cheph");
			String shourlx = request.getParameter("shourlx");
			String shoursj = request.getParameter("shoursj");
			String shourje = request.getParameter("shourje");
			String jiasy = request.getParameter("jiasy");
			String bei = request.getParameter("bei");
			String sql = "update qtsrinfo set           cheph=    '" + cheph + "'," + "shourlx='" + shourlx + "',"
					+ "shoursj='" + shoursj + "'," + "shourje='" + shourje + "'," + "jiasy='" + jiasy + "'," + "bei='"
					+ bei + "' where id='" + id + "'";
			System.out.println(sql);
			dao.commOper(sql);
			go("/admin/qtsr.jsp", request, response);
		}

		if (ac.equals("adduser")) {
			String uname = request.getParameter("uname");
			String upass = request.getParameter("upass");
			String utype = request.getParameter("utype");
			int i = dao.getInt("select count(*) from sysuser where uname='" + uname + "'");
			if (i == 0) {
				String sql = "insert into sysuser values('" + uname + "','" + upass + "','" + date + "','" + utype
						+ "')";
				dao.commOper(sql);
			}
			gor("/fzsalessys/admin/adduser.jsp?suc=suc", request, response);
		}

		if (ac.equals("upuser")) {
			String id = request.getParameter("id");
			String upass = request.getParameter("upass");
			String utype = request.getParameter("utype");

			String sql = "update sysuser set upass='" + upass + "',utype='" + utype + "' where id=" + id;
			dao.commOper(sql);

			go("/admin/upuser.jsp?suc=suc", request, response);
		}

		if (ac.equals("uploadimg")) {
			try {
				String filename = "";
				request.setCharacterEncoding("utf-8");
				RequestContext requestContext = new ServletRequestContext(request);
				if (FileUpload.isMultipartContent(requestContext)) {

					DiskFileItemFactory factory = new DiskFileItemFactory();
					factory.setRepository(new File(request.getRealPath("/upfile/") + "/"));
					ServletFileUpload upload = new ServletFileUpload(factory);
					upload.setSizeMax(100 * 1024 * 1024);
					List items = new ArrayList();

					items = upload.parseRequest(request);

					FileItem fileItem = (FileItem) items.get(0);
					if (fileItem.getName() != null && fileItem.getSize() != 0) {
						if (fileItem.getName() != null && fileItem.getSize() != 0) {
							File fullFile = new File(fileItem.getName());
							filename = Info.generalFileName(fullFile.getName());
							File newFile = new File(request.getRealPath("/upfile/") + "/" + filename);
							try {
								fileItem.write(newFile);
							} catch (Exception e) {
								e.printStackTrace();
							}
						} else {
						}
					}
				}

				go("/js/uploadimg.jsp?filename=" + filename, request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}

		if (ac.equals("addkcfiles")) {
			try {
				String filename = "";
				String fileurl = "";
				String filebei = "";
				request.setCharacterEncoding("utf-8");
				RequestContext requestContext = new ServletRequestContext(request);
				if (FileUpload.isMultipartContent(requestContext)) {

					DiskFileItemFactory factory = new DiskFileItemFactory();
					factory.setRepository(new File(request.getRealPath("/upfile/") + "/"));
					ServletFileUpload upload = new ServletFileUpload(factory);
					upload.setSizeMax(100 * 1024 * 1024);
					List items = new ArrayList();

					filename = ((FileItem) items.get(0)).getString();
					filename = Info.getUTFStr(filename);

					filebei = ((FileItem) items.get(2)).getString();
					filebei = Info.getUTFStr(filebei);

					FileItem fileItem = (FileItem) items.get(1);
					if (fileItem.getName() != null && fileItem.getSize() != 0) {
						if (fileItem.getName() != null && fileItem.getSize() != 0) {
							File fullFile = new File(fileItem.getName());
							fileurl = Info.generalFileName(fullFile.getName());
							File newFile = new File(request.getRealPath("/upfile/") + "/" + fileurl);
							try {
								fileItem.write(newFile);
							} catch (Exception e) {
								e.printStackTrace();
							}
						} else {
						}
					}
				}

				String sql = "insert into kcfiles values('" + filename + "','" + fileurl + "','" + filebei + "')";
				dao.commOper(sql);

				go("/admin/kcfiles.jsp", request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}

		if (ac.equals("uploadimg")) {
			try {
				String filename = "";
				request.setCharacterEncoding("utf-8");
				RequestContext requestContext = new ServletRequestContext(request);
				if (FileUpload.isMultipartContent(requestContext)) {

					DiskFileItemFactory factory = new DiskFileItemFactory();
					factory.setRepository(new File(request.getRealPath("/upfile/") + "/"));
					ServletFileUpload upload = new ServletFileUpload(factory);
					upload.setSizeMax(100 * 1024 * 1024);
					List items = new ArrayList();

					items = upload.parseRequest(request);

					FileItem fileItem = (FileItem) items.get(0);
					if (fileItem.getName() != null && fileItem.getSize() != 0) {
						if (fileItem.getName() != null && fileItem.getSize() != 0) {
							File fullFile = new File(fileItem.getName());
							filename = Info.generalFileName(fullFile.getName());
							File newFile = new File(request.getRealPath("/upfile/") + "/" + filename);
							try {
								fileItem.write(newFile);
							} catch (Exception e) {
								e.printStackTrace();
							}
						} else {
						}
					}
				}

				go("/js/uploadimg.jsp?filename=" + filename, request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}

		dao.close();
		out.flush();
		out.close();
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
