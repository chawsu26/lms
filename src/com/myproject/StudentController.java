package com.myproject;

import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.Properties;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.myproject.bean.StudentInfo;
import com.myproject.bean.TimeTable;

@Controller
@RequestMapping(value="/student")
public class StudentController {
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
	
		
}
