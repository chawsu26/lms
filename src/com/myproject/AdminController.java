package com.myproject;

import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.myproject.bean.ExamReportDto;
import com.myproject.bean.SectionMaterial;
import com.myproject.bean.StudentInfo;
import com.myproject.bean.TimeTable;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	final static Logger logger = Logger.getLogger(AdminController.class);
	@Autowired
	ServletContext servletContext;
	@Autowired
	HomeDao homeDao;
	
	
	
	@RequestMapping(value="student")
	public String start(Model model){
		logger.debug("Application started");
		List<StudentInfo> studentList = homeDao.getAllStudentLists();
		model.addAttribute("studentList",studentList);
        return "start";
	}
	
	@RequestMapping(value="fileimport")
	public String FileImport(Model model)
	{	
		importFile();
		return start(model);
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
		logger.debug(path);
		logger.debug("Application started");
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
		String fathername = request.getParameter("fathername");
		model.addAttribute("fathername",fathername);
		String dob = request.getParameter("dob");
		model.addAttribute("dob",dob);
		String address = request.getParameter("address");
		model.addAttribute("address",address);
		String classname = request.getParameter("classname");
		model.addAttribute("classname",classname);
		String password = request.getParameter("password");
		model.addAttribute("password",password);
		String confirmpassword=request.getParameter("confirmpassword");
		model.addAttribute("confirmpassword", confirmpassword);
		String type = request.getParameter("type");
		model.addAttribute("type",type);
		homeDao.saveStudentInfo(email ,name ,fathername ,dob ,address ,classname,password,confirmpassword,type);
		return start(model);
		}
	
	@RequestMapping(value="emailupdate")
	public String updateEmail(Model model,HttpServletRequest request){
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String fathername = request.getParameter("fathername");
		String dob = request.getParameter("dob");
		String address = request.getParameter("address");
		String classname = request.getParameter("classname");
		String password = request.getParameter("password");
		String confirmpassword = request.getParameter("confirmpassword");
		logger.debug("Application started");
		model.addAttribute("email",email);
		model.addAttribute("name",name);
		model.addAttribute("fathername",fathername);
		model.addAttribute("dob",dob);
		model.addAttribute("address",address);
		model.addAttribute("classname",classname);
		model.addAttribute("password",password);
		model.addAttribute("confirmpassword",confirmpassword);
		try{
			if(email==null || name==null || fathername==null || dob==null || address==null || classname==null || password==null || confirmpassword==null){
				request.getSession().setAttribute("errorMsg","U need to fill all fields!");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return "updateEmail";
	}
	
	
	@RequestMapping(value="update")
	public String update(HttpServletRequest request,Model model){
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String fathername = request.getParameter("fathername");
		String dob = request.getParameter("dob");
		String address = request.getParameter("address");
		String classname = request.getParameter("classname");
		String password = request.getParameter("password");
		String confirmpassword = request.getParameter("confirmpassword");
		homeDao.update(email,name,fathername,dob,address,classname,password,confirmpassword);
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
	@RequestMapping(value="materialdelete")
	public String deleteMaterial(HttpServletRequest request,Model model){
		String classname = request.getParameter("section");
		String filename = request.getParameter("filename");
		model.addAttribute("section", classname);
		homeDao.deleteMaterial(filename);
		return sectionmaterials(model ,request);
	}
	
	
	public void ERdelete(){
		homeDao.deleteER();
	}
	
	@RequestMapping(value="resultdelete")
	public String deleteResult(){
		return "deleteresult";
	}
	
	@RequestMapping(value="showUpload")
	public String showUpload(){
		return "uploadTest";
	}
	@RequestMapping(value="examresultchart")
	public String showExamResult(Model model){
		List<ExamReportDto> list = homeDao.getExamReportDtoList();
		model.addAttribute("examResultList",list);
		return "erChart";
	}
	@RequestMapping(value="showsectionmaterial")
	public String Sectionmaterialview(Model model,HttpServletRequest request){
		String section=request.getParameter("section");

		return "sectionmaterialview";
	}
	@RequestMapping(value="sectionmaterial")
	public String sectionmaterials(Model model,HttpServletRequest request){
		String section=request.getParameter("section");
		model.addAttribute("classname",section);
		List<SectionMaterial>  materiallist= homeDao.getMaterialLists(section);
		model.addAttribute("materiallist",materiallist);
		return "sectionMaterial";
	}
	
	@RequestMapping(value="uploadsectionmaterial")
	public String upload(Model model,HttpServletRequest request){		
		String section=request.getParameter("section");
		model.addAttribute("section",section);
		String filename=request.getParameter("filename");
		model.addAttribute("filename",filename);
		return "sectionmaterialupload";
	}
	
	@RequestMapping(value = "uploadFile", method = RequestMethod.POST)
	public String uploadFileHandler1(@RequestParam("file") MultipartFile file,Model model, HttpServletRequest request) {
		logger.debug("Already uploaded!");
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
	@RequestMapping(value = "uploadSectionMaterial", method = RequestMethod.POST)
	public String uploadMaterialHandler(@RequestParam("filename") MultipartFile file,Model model, HttpServletRequest request) {
		logger.debug("Already uploaded!");
		String orgFileName = file.getOriginalFilename();

		String folder ="d:/lms-images/";
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				// Create the file on server
				File serverFile = new File(folder+orgFileName);
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();
				String classname=request.getParameter("classname");
				model.addAttribute("classname",classname);
				String filename= request.getParameter("filename");
				homeDao.saveSectionMaterial(classname,orgFileName);
				return Sectionmaterialview(model,request);
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
	private String getFileFolder(){
		String imageFolder = "";
		try{
			//Changed by Zaw Htut START
			InputStream is =  this.getClass().getResourceAsStream("settings.properties");
			//Changed by Zaw Htut END
			Properties prop = new Properties();
			prop.load(is);
			imageFolder = (String)prop.get("files_folder");
		}catch(Exception e){
			e.printStackTrace();
		}
		return imageFolder;
	}
	
	public void importFile(){    
		try{
			InputStream inp = new FileInputStream("d:/exam_marks.xlsx");
	    	
		    Workbook wb = WorkbookFactory.create(inp);
		    Sheet sheet = wb.getSheetAt(0);
		    String val = null ,val1=null,val2=null;
		    int index =1;
		    do{
			    
		    	Row row = sheet.getRow(index);
		    	if(row==null){
			    	break;
			    }
		    	// 0 = Email cell
		    	Cell cell = row.getCell(0);
			    //1 subject code
		    	Cell cell1 = row.getCell(1);
		    	//2 mark
		    	Cell cell2 = row.getCell(2);
		    	logger.debug(cell.getStringCellValue());
		    	logger.debug(cell1.getStringCellValue());
		    	logger.debug(cell2.getStringCellValue());
			    val =cell.getStringCellValue();
			    val1 =cell1.getStringCellValue();
			    val2 =cell2.getStringCellValue();
			    homeDao.saveExamResult(val,val1,val2);
			    index++;
		    }while(val!=null);
		    inp.close();
		}catch(Exception e){
			e.printStackTrace();
		}
    }

	
}
