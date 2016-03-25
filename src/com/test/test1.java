package com.test;

import java.sql.DriverManager;

import com.mysql.jdbc.Connection;

public class test1{
	public static void main(String[] args) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Success loading Mysql Driver");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("Error loading Mysql Driver!");
			e.printStackTrace();
		}
/*		try{
			Connection connect = DriverManager.getConnection("jdbc:mysql://127.0.0.1/asir?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull","root","");
			
		}catch (Exception e){
			System.out.print("get data error!");
		}*/
	}
}
