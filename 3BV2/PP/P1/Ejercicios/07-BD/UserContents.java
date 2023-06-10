/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.afloriano.userregistration;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;


 *
/**
 * @author andre
 */
public class UserContents {
    
    public static void seeTable(){
        try {
                    //Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/swing_demo", "root", "root");
                    //Connection connection = DriverManager.getConnection("jdbc:mysql://srvr1.mysql.database.azure.com:3306/pdp?useSSL=true", "caretaker", "svr05232023&");
                    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/pdp?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "caretaker", "server202305&");

                    String query = "SELECT * FROM students";

                    Statement sta = connection.createStatement();
                    ResultSet rs=sta.executeQuery(query);
                    
                    System.out.println("Boleta  Nombre");
                    while(rs.next())
                    {
                        String bol=rs.getString("boleta");
                        String nam=rs.getString("name");
                        
                        System.out.println(bol+" "+nam);
                    }
                    
                    connection.close();
                } catch (Exception exception) {
                    exception.printStackTrace();
                }
    }
    
    public static void main(String[] args)
    {
        seeTable();
    }
    
}
