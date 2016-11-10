package com.myproject;

import java.util.List;


import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.myproject.bean.StudentInfo;
import com.myproject.bean.TimeTable;


@Repository("homeDao")
@Transactional(value = "transactionManager",propagation = Propagation.REQUIRES_NEW)
public class HomeDao {
	@PersistenceContext
	private EntityManager entityManager;
	

		public void update(String email,String name,String classname) {
			StudentInfo student =  (StudentInfo)entityManager.createNativeQuery("select * from student_info where email='"+email+"'",StudentInfo.class).getSingleResult();
			student.name=name;
			student.classname = classname;
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
		
		
		public void saveStudentInfo(String email ,String name,String classname)
		{
			StudentInfo info = new StudentInfo();
			info.email = email;
			info.name = name;
			info.classname=classname;
			entityManager.persist(info);
		}
		public List<StudentInfo> getAllStudentLists() {
			return entityManager.createNativeQuery("select * from student_info",StudentInfo.class).getResultList();
		}
		public TimeTable getTimeTable(String class_name , String file_name) {
			return (TimeTable)entityManager.createNativeQuery("select * from time_table where class_name='"+class_name+"'",TimeTable.class).getSingleResult();
		}
		public void saveTimeTable(String class_name ,String file_name)
		{
			TimeTable timetable = new TimeTable();
			timetable.class_name = class_name;
			timetable.file_name = file_name;
			entityManager.persist(timetable);
		}
		public List<TimeTable> getAllClassLists() {
			// TODO Auto-generated method stub
			return entityManager.createNativeQuery("select * from time_table",TimeTable.class).getResultList();
		}
}
