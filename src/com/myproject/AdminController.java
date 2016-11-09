package com.myproject;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.util.List;

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
	@RequestMapping(value="downloadTimeTable")
	public String timeTablecls(Model model){
		String path = servletContext.getRealPath("/images/");
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
	
	@RequestMapping(value="createButton")	
	public String createButton(Model model , HttpServletRequest request){
		String email = request.getParameter("email");
		model.addAttribute("email",email);
		String name = request.getParameter("name");
		model.addAttribute("name",name);
		homeDao.saveStudentInfo(email ,name);
		return "index4";
		}
	
	@RequestMapping(value="emailupdate")
	public String updateEmail(Model model,HttpServletRequest request){
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		System.out.println("Application started");
		model.addAttribute("email",email);
		model.addAttribute("name",name);
		return "updateEmail";
	}
	
	
	@RequestMapping(value="update")
	public String update(HttpServletRequest request,Model model){
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		homeDao.update(email,name);
		return start(model);
	}
	@RequestMapping(value="delete")
	public String delete(HttpServletRequest request,Model model){
		String email = request.getParameter("email");
		homeDao.delete(email);
		return start(model);
	}

	@RequestMapping(value="showUpload")
	public String showUpload(){
		return "uploadTest";
	}
	@RequestMapping(value = "uploadFile", method = RequestMethod.POST)
	public String uploadFileHandler(@RequestParam("file") MultipartFile file,Model model, HttpServletRequest request) {
		System.out.println("Already uploaded!");
		String orgFileName = file.getOriginalFilename();
		String folder = servletContext.getRealPath("/images/");
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
				return start(model);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			return null;
		}
		return null;
	}
	
}
