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
@RequestMapping(value="/admin")
public class AdminController {
	@Autowired
	ServletContext servletContext;
	@Autowired
	HomeDao homeDao;
	
	@RequestMapping(value="student")
	public String start(Model model){
		System.out.println("Application started");
		List<StudentInfo> studentList = homeDao.getAllStudentLists();
		model.addAttribute("studentList",studentList);
        return "start";
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
	@RequestMapping(value="downloadTimeTable")
	public String timeTablecls(Model model){
		String path = getImageFolder();
		System.out.println(path);
		System.out.println("Application started");
		List<TimeTable> classList = homeDao.getAllClassLists();
		model.addAttribute("classList",classList);
        return "timetableDownload";
	}


	@RequestMapping(value="register")
	public String createStudent(Model model){
		return "createStudent";
		}
/*@RequestMapping(value="tabletest")
	public String testTable(Model model){
		return "bootstraptabletest";
		}*/
	
	@RequestMapping(value="createButton")	
	public String createButton(Model model , HttpServletRequest request){
		String email = request.getParameter("email");
		model.addAttribute("email",email);
		String name = request.getParameter("name");
		model.addAttribute("name",name);
		String classname = request.getParameter("classname");
		model.addAttribute("classname",classname);
		String password = request.getParameter("password");
		model.addAttribute("password",password);
		homeDao.saveStudentInfo(email ,name ,classname,password);
		return "index4";
		}
	
	@RequestMapping(value="emailupdate")
	public String updateEmail(Model model,HttpServletRequest request){
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String classname = request.getParameter("classname");
		System.out.println("Application started");
		model.addAttribute("email",email);
		model.addAttribute("name",name);
		model.addAttribute("classname",classname);
		return "updateEmail";
	}
	
	
	@RequestMapping(value="update")
	public String update(HttpServletRequest request,Model model){
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String classname = request.getParameter("classname");
		homeDao.update(email,name,classname);
		return start(model);
	}
	@RequestMapping(value="delete")
	public String delete(HttpServletRequest request,Model model){
		String email = request.getParameter("email");
		homeDao.delete(email);
		return start(model);
	}
	@RequestMapping(value="classdelete")
	public String deleteClass(HttpServletRequest request,Model model){
		String class_name = request.getParameter("class_name");
		homeDao.deleteClass(class_name);
		return timeTablecls(model);
	}

	@RequestMapping(value="showUpload")
	public String showUpload(){
		return "uploadTest";
	}
	@RequestMapping(value = "uploadFile", method = RequestMethod.POST)
	public String uploadFileHandler1(@RequestParam("file") MultipartFile file,Model model, HttpServletRequest request) {
		System.out.println("Already uploaded!");
		String orgFileName = file.getOriginalFilename();
		String folder = getImageFolder();
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				// Create the file on server
				File serverFile = new File(folder+orgFileName);
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();
				System.out.println("TimeTable");
				String class_name = request.getParameter("class_name");
				String file_name = request.getParameter("file_name");
				homeDao.saveTimeTable(class_name, orgFileName);
				return timeTablecls(model);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			return null;
		}
		return null;
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
