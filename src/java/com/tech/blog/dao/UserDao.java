
package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.Connection;
import java.sql.*;

public class UserDao {
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
    public boolean saveUser(User user)
    {
        boolean f=false;
        try
        {
            String query="insert into user(name,email,password,gender) values(?,?,?,?)";
            PreparedStatement pstm=this.con.prepareStatement(query);
            pstm.setString(1, user.getName());
            pstm.setString(2,user.getEmail());
            pstm.setString(3,user.getPassword());
            pstm.setString(4,user.getGender());
            pstm.executeUpdate();
            f=true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
    //get user by email and password
    public User getUserByEmailAndPassword(String email,String password)
    {
        User user=null;
        try
        {
            String query="select * from user where email= ? and password= ?";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setString(1, email);
            stmt.setString(2,password);
            ResultSet rst=stmt.executeQuery();
            
            if(rst.next())
            {
                user=new User();
                String name=rst.getString("Name");
                user.setName(name);
                user.setId(rst.getInt("id"));
                user.setEmail(rst.getString("Email"));
                user.setGender(rst.getString("Gender"));
                user.setDateTime(rst.getTimestamp("Reg_date"));
                user.setPassword(rst.getString("Password"));
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return user;
    }
}
