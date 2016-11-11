package com.myproject;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myproject.bean.StudentInfo;

@Controller
@RequestMapping(value="/home")
public class HomeController {
	@Autowired
	ServletContext servletContext;
	@Autowired
	HomeDao homeDao;
/*@RequestMapping(path="hello",produces="application/json")
	@ResponseBody List<Human> hello(){
		List<Human> list = new ArrayList<Human>();
		list.add(new Human("La min Mo MO",12));
		list.add(new Human("Min Thein Kha",21));
	return list;
}*/
	
	@RequestMapping(value="showLogin")
	public String showLogin(){
		return "show_login";
	}
	
	@RequestMapping(value="executelogin")
	public void executelogin(HttpServletRequest request,HttpServletResponse response,Model model){
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		StudentInfo studentInfo = homeDao.getStudent(email,password);
		try{
			if(studentInfo!=null){
					request.getSession().setAttribute("user",email);
					if(studentInfo.getType().equals("admin")){
						response.sendRedirect("/LMS/admin/student/");
					}else{
						response.sendRedirect("/LMS/student/viewtimetable?className="+studentInfo.getClassname());
					}
					return;
				}
		
		response.sendRedirect("/LMS/home/showLogin");
		
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
