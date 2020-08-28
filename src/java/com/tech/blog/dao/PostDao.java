
package com.tech.blog.dao;
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;

public class PostDao {
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    public ArrayList<Category> getCategories()
    {
        ArrayList<Category> list=null;
        try
        {
            String query="select * from categories";
            Statement st=this.con.createStatement();
            ResultSet set=st.executeQuery(query);
            while(set.next())
            {
                int cid=set.getInt("cid");
                String name=set.getString("name");
                String description=set.getString("description");
                Category c=new Category(cid,name,description);
                list.add(c);
            }
        }
        catch(Exception e)
        {
        e.printStackTrace();
        }
        
        return list;
    }
    public boolean savePost(Post p)
    {
        boolean f=false;
        try
        {
            String q="insert into posts(ptitle,pcontent,pcode,ppic,catId,userId) value(?,?,?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(q);
            ps.setString(1,p.getpTitle());
            ps.setString(2,p.getpContent());
            ps.setString(3,p.getpCode());
            ps.setString(4,p.getpPic());
            ps.setInt(5,p.getCatId());
            ps.setInt(6,p.getUserId());
            ps.executeUpdate();
            f=true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
}
