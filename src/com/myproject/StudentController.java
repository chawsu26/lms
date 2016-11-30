package com.myproject;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Properties;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myproject.bean.ExamResult;
import com.myproject.bean.SectionMaterial;
import com.myproject.bean.TimeTable;

@Controller
@RequestMapping(value="/student")
public class StudentController {
	final static Logger logger = Logger.getLogger(AdminController.class);
	@Autowired
	ServletContext servletContext;
	@Autowired
	HomeDao homeDao;
	
	@RequestMapping(value="student")
	public String start(Model model){
		System.out.println("Application started");
        return "start";
	}
	
	@RequestMapping(value="viewtimetable")
	public String timetableView(Model model,HttpServletRequest request){
		String className = request.getParameter("className");
		model.addAttribute("className",className);
		String email = request.getParameter("email");
		model.addAttribute("email", email);
		String Name = request.getParameter("Name");
		model.addAttribute("Name", Name);
        return "timetableview";
	}
	@RequestMapping(value="images")
	public String image(HttpServletRequest request,HttpServletResponse response){
		response.setContentType("image/jpeg");
		String fileName = request.getParameter("fileName");
		String pathToWeb = getImageFolder();
		File f = new File(pathToWeb + fileName);
		try{
			BufferedImage bi = ImageIO.read(f);
			OutputStream out = response.getOutputStream();
			ImageIO.write(bi, "jpg", out);
			out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping(value="downloadFile")
	public void downloadFile(HttpServletRequest request,HttpServletResponse response){
		try{
			String fileName = request.getParameter("fileName");
			String pathToWeb = getImageFolder();
			response.setHeader("Content-disposition","attachment; filename="+fileName);

			OutputStream out = response.getOutputStream();

			FileInputStream in = new FileInputStream(pathToWeb+"/"+fileName);
			byte[] buffer = new byte[4096];
			int length;
			while ((length = in.read(buffer)) > 0){
			    out.write(buffer, 0, length);
			}
			in.close();
			out.flush();
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	
	@RequestMapping(value="timetableview")
	public String timeTablecls(Model model){
		String path = getImageFolder();
		System.out.println(path);
		System.out.println("Application started");
		List<TimeTable> classList = homeDao.getAllClassLists();
		model.addAttribute("classList",classList);
        return "studenttimetableview";
	}
	
	private String getImageFolder(){
		String imageFolder = "";
		try{
			//Changed by Zaw Htut START
			InputStream is =  this.getClass().getResourceAsStream("settings.properties");
			//Changed by Zaw Htut END
			Properties prop = new Properties();
			prop.load(is);
			imageFolder = (String)prop.get("image_folder");
		}catch(Exception e){
			e.printStackTrace();
		}
		return imageFolder;
	}
	
		
	@RequestMapping(value="studentMaterial")
	public String sectionmaterials(HttpServletRequest request , Model model){
		String classname = request.getParameter("className");
		String filename  = request.getParameter("filename");
		String email=request.getParameter("email");
		String Name = request.getParameter("Name");
		model.addAttribute("Name", Name);
		List<SectionMaterial> materiallist = homeDao.getMaterialLists(classname);
		model.addAttribute("materiallist",materiallist);
		model.addAttribute("className",classname);
		model.addAttribute("email",email);
		return "studentmaterial";
	}
	
	@RequestMapping(value="examresultview")
	public String ExamResultView(HttpServletRequest request , Model model){
		String classname = request.getParameter("className");
		model.addAttribute("className",classname);
		String email = request.getParameter("email");
		model.addAttribute("email", email);
		String Name = request.getParameter("Name");
		model.addAttribute("Name", Name);
		List<ExamResult> results = homeDao.getExamResult(email);
		model.addAttribute("examresults", results);
		for(ExamResult res:results){
			System.out.print("Email:"+res.getEmail());
			System.out.print(res.subject.subjectName);
			System.out.println("Mark:"+res.getMark());
			}
			return "viewexamresult";
		}
	
	
	

}
