package com.test;

import java.util.ArrayList;
import com.jfinal.core.Controller;


public class ListTest extends Controller{

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		ArrayList<Student> list= new ArrayList<Student>();

		list.add(new Student(2,"李四",4));
		list.add(new Student(4,"小明",2));
		list.add(new Student(5,"小黑",1));
		list.add(new Student(3,"王五",3));
		list.add(new Student(1,"张三",5));
		
		
		ListSort<Student> listSort= new ListSort<Student>();
		listSort.Sort(list, "getId", "null","desc");
		for(Student s:list){
			System.out.println(s.getId()+s.getName()+s.getAge("1"));
		}

	}
	
	

}

