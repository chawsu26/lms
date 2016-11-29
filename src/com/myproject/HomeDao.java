package com.myproject;

import java.util.List;


import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.slf4j.Marker;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myproject.bean.ExamReportDto;
import com.myproject.bean.ExamResult;
import com.myproject.bean.SectionMaterial;
import com.myproject.bean.StudentInfo;
import com.myproject.bean.Subject;
import com.myproject.bean.TimeTable;


@Repository("homeDao")
@Transactional(value = "transactionManager",propagation = Propagation.REQUIRES_NEW)
public class HomeDao {
	@PersistenceContext
	private EntityManager entityManager;
	

		public void update(String email,String name,String fathername,String dob,String address,String classname,String password , String confirmpassword) {
			StudentInfo student =  (StudentInfo)entityManager.createNativeQuery("select * from student_info where email='"+email+"'",StudentInfo.class).getSingleResult();
			student.name=name;
			student.fathername=fathername;
			student.dob=dob;
			student.address=address;
			student.classname = classname;
			student.password=password;
			student.confirmpassword=confirmpassword;
			entityManager.merge(student);
		}
		public void delete(String email) {
			StudentInfo student =  (StudentInfo)entityManager.createNativeQuery("select * from student_info where email='"+email+"'",StudentInfo.class).getSingleResult();
			entityManager.remove(student);
		}
		public void deleteClass(String class_name) {
			TimeTable classtimetable =  (TimeTable)entityManager.createNativeQuery("select * from time_table where class_name='"+class_name+"'",TimeTable.class).getSingleResult();
			entityManager.remove(classtimetable);
		}
		
		public void deleteMaterial(String filename) {
			SectionMaterial sectionSM =  (SectionMaterial)entityManager.createNativeQuery("select * from section_material where filename='"+filename+"'",SectionMaterial.class).getSingleResult();
			entityManager.remove(sectionSM);
		}
		public void deleteER() {
			ExamResult er =  (ExamResult)entityManager.createNativeQuery("select * from exam_result",ExamResult.class).getSingleResult();
			entityManager.remove(er);
		}
		public void saveStudentInfo(String email ,String name,String fathername,String dob,String address,String classname,String password,String confirmpassword,String type)
		{
			StudentInfo info = new StudentInfo();
			info.email = email;
			info.name = name;
			info.fathername=fathername;
			info.dob=dob;
			info.address=address;
			info.classname=classname;
			info.password = password;
			info.confirmpassword=confirmpassword;
			info.type = type;
			entityManager.persist(info);
		}
		public List<StudentInfo> getAllStudentLists() {
			return entityManager.createNativeQuery("select * from student_info",StudentInfo.class).getResultList();
		}
		
		public TimeTable getTimeTable(String class_name , String file_name) {
			return (TimeTable)entityManager.createNativeQuery("select * from time_table where class_name='"+class_name+"'",TimeTable.class).getSingleResult();
		}
		
		public StudentInfo getStudent(String email,String password) {
			StudentInfo studentInfo = null;
			try{
				 studentInfo = (StudentInfo)entityManager.createNativeQuery("select * from student_info where email='"+email+"' AND password='"+password+"'",StudentInfo.class).getSingleResult();
				
			   }catch(Exception e){
			   
		      }
				return studentInfo;
					
		}
		
		
		public void saveTimeTable(String class_name ,String file_name)
		{
			TimeTable timetable = new TimeTable();
			timetable.class_name = class_name;
			timetable.file_name = file_name;
			entityManager.persist(timetable);
		}
		public void saveSectionMaterial(String classname ,String filename)
		{
			SectionMaterial Sectionmaterials = new SectionMaterial();
			Sectionmaterials.classname = classname;
			Sectionmaterials.filename = filename;
			entityManager.persist(Sectionmaterials);
		}
		
		public Subject getSubjectBySubjectCode(String subjectCode)
		{
			return (Subject)entityManager.createNativeQuery("SELECT * FROM subjects where subject_code='"+subjectCode+"'",Subject.class).getSingleResult();
		}
		
		public void saveExamResult(String email,String subjectCode,String mark)
		{
			ExamResult exmres = new ExamResult();
			exmres.email = email;
			exmres.subject= getSubjectBySubjectCode(subjectCode);
			exmres.mark= mark;
			entityManager.persist(exmres);
		}
		
		public List<SectionMaterial> getAllMaterialLists(String section) {
			return entityManager.createNativeQuery("select * from section_material where classname='"+section+"'",SectionMaterial.class).getResultList();
		}
		public List<SectionMaterial> getMaterialLists(String className) {
			return entityManager.createNativeQuery("select * from section_material where classname='"+className+"'",SectionMaterial.class).getResultList();
		}
		public List<ExamResult> getExamResult(String email){
			return entityManager.createNativeQuery("SELECT er.*,su.subject_name FROM exam_result er INNER JOIN subjects su ON su.subject_code = er.subject_code WHERE email = '"+email+"'",ExamResult.class).getResultList();
		}
		
		/*public List<Subject> getAllSubjects(){
			List<Subject> list =  entityManager.createNativeQuery("SELECT * FROM subjects",Subject.class).getResultList();
			for(Subject l:list){
				for(ExamResult e:l.getExamResults()){
					e.getId();
				}
			}
			return list;
		}*/
		
	/*	public SectionMaterial getSectionMaterial(String classname,String filename) {
			SectionMaterial sectionMaterial = null;
			try{
			sectionMaterial = (SectionMaterial)entityManager.createNativeQuery("select * from section_material where classname='"+classname+"' AND filename='"+filename+"'",SectionMaterial.class).getSingleResult();
				
			   }catch(EmptyResultDataAccessException e){
			   
		      }
				return sectionMaterial;
					
		}*/
		public List<ExamReportDto> getExamReportDtoList(){
			return entityManager.createNativeQuery("SELECT mark,COUNT(mark) AS COUNT FROM exam_result GROUP BY mark",ExamReportDto.class).getResultList();
		}
		public List<TimeTable> getAllClassLists() {
			// TODO Auto-generated method stub
			return entityManager.createNativeQuery("select * from time_table",TimeTable.class).getResultList();
		}
		
}
