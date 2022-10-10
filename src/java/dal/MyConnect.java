
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import model.*;

/**
 *
 * @author Mai
 */
public class MyConnect extends DBContext {

    //Xu li thong tin lien quan den albums:
    public List<albums> getAlbumList() {
        List<albums> albumList = new ArrayList<>();
        String sql = "select * from albums_HE163253";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String describe = rs.getString("describe");
                String imgUrl = rs.getString("imgUrl");
                albums a = new albums(id, name, imgUrl, describe);
                albumList.add(a);
            }
        } catch (Exception e) {
            System.out.println("loi 2: " + e);
        }
        return albumList;
    }
    
     public List<albums> getAlbumListByPage(List<albums> allList, int start, int end) {
        List<albums> albumList = new ArrayList<>();
        for (int i = start; i < end; i++) {
            albumList.add(allList.get(i));
        }
        return albumList;
    }

    public albums getAlbumById(int id) {
        String sql = "select * from albums_HE163253 where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                albums al = new albums(id, rs.getString(2), rs.getString(4), rs.getString(3));
                return al;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateAlbum(albums al) {
        String sql = "update albums_HE163253 set name = ?, imgUrl = ?, describe = ? where id = ?";
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, al.getName());
            ps.setString(2, al.getImgUrl());
            ps.setString(3, al.getDescribe());
            ps.setInt(4, al.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
        }

    }

    public void addAlbum(albums al) {
        String sql = "insert into albums_HE163253(id,[name],imgUrl,describe) values(?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, al.getId());
            ps.setString(2, al.getName());
            ps.setString(3, al.getImgUrl());
            ps.setString(4, al.getDescribe());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteAlbum(int id) {
        String sql = "delete from albums_HE163253 where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //----------------------------------------------------
//  Xu li thong tin lien quan den songs:
    //load tat ca bai hat
    public List<songs> getSongList() {
        List<songs> songList = new ArrayList<>();
        String sql = "select * from songs_HE163253";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int pubYear = rs.getInt("pubYear");
                String name = rs.getString("name");
                String songUrl = rs.getString("songUrl");
                String authorName = rs.getString("authorName");
                String lyrics = rs.getString("lyrics");
                int albumId = rs.getInt("albumId");
                songs s = new songs(id, name, songUrl, pubYear, authorName, lyrics, albumId);
                songList.add(s);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return songList;
    }

    public List<songs> getSongListByPage(List<songs> allList, int start, int end) {
        List<songs> songList = new ArrayList<>();
        for (int i = start; i < end; i++) {
            songList.add(allList.get(i));
        }
        return songList;
    }

    //tim bai hat bang id
    public songs getSongById(int id) {
        String sql = "select * from songs_HE163253 where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                songs s = new songs(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getInt(7));
                return s;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //load cac bai hat cua 1 album
    public List<songs> getSongsInAlbum(int albumId) {
        List<songs> songsInAlbum = new ArrayList<>();
        String sql = "select * from songs_HE163253 where albumId=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, albumId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int pubYear = rs.getInt("pubYear");
                String name = rs.getString("name");
                String songUrl = rs.getString("songUrl");
                String authorName = rs.getString("authorName");
                String lyrics = rs.getString("lyrics");
                songs s = new songs(id, name, songUrl, pubYear, authorName, lyrics, albumId);
                songsInAlbum.add(s);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return songsInAlbum;
    }

    //lay ten cac ca sy cua 1 bai hat
    public HashMap<Integer, String> getHmSinger_Song(int songId) {
        HashMap<Integer, String> hmSinger_Song = new HashMap<Integer, String>();
        String sql = "select sg.id as id, sg.[name] as name from performedBy_HE163253 p, singers_HE163253 sg, songs_HE163253 s where s.id=p.songId and sg.id = p.singerId and s.id =?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, songId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                System.out.println("id=" + id + "  name=" + name);
                hmSinger_Song.put(id, name);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return hmSinger_Song;
    }

    public void updateSong(songs s) {
        String sql = "update songs_HE163253 set name = ?, songUrl = ?, pubYear = ?, authorName = ?, lyrics = ?, albumId = ? where id = ?";
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, s.getName());
            ps.setString(2, s.getSongUrl());
            ps.setInt(3, s.getPubYear());
            ps.setString(4, s.getAuthorName());
            ps.setString(5, s.getLyrics());
            if (s.getAlbumId() == -1) {
                ps.setString(6, null);
            } else {
                ps.setInt(6, s.getAlbumId());
            }
            ps.setInt(7, s.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addSong(songs s) {
        String sql = "INSERT INTO [songs_HE163253]([id],[name],[songUrl],[pubYear],[authorName],[lyrics],[albumId]) "
                + "VALUES( ? , ? , ? , ? , ? , ? , ? )";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, s.getId());
            ps.setString(2, s.getName());
            ps.setString(3, s.getSongUrl());
            if (s.getPubYear() == -1) {
                ps.setString(4, null);
            } else {
                ps.setInt(4, s.getPubYear());
            }
            ps.setString(5, s.getAuthorName());
            ps.setString(6, s.getLyrics());
            if (s.getAlbumId() == -1) {
                ps.setString(7, null);
            } else {
                ps.setInt(7, s.getAlbumId());
            }
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteSong(int id) {
        String sql = "delete from songs_HE163253 where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

//    ---------------------------------------------------------------------------------
//    Xu li thong tin lien quan den singers:
    public List<singers> getSingerList() {
        List<singers> singerList = new ArrayList<>();
        String sql = "select * from singers_HE163253";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String imgUrl = rs.getString(3);
                String describe = rs.getString(4);
                boolean gender = rs.getBoolean(5);
                Date dob = rs.getDate(6);
                singerList.add(new singers(id, name, imgUrl, describe, gender, dob));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return singerList;
    }

    public singers getSingerById(int id) {
        String sql = "select * from singers_HE163253 where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                singers s = new singers(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getBoolean(5), rs.getDate(6));

                return s;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void addSinger(singers s) {
        String sql = "insert into singers_HE163253(id,[name],imgUrl,describe,gender,dob) values(?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, s.getId());
            ps.setString(2, s.getName());
            ps.setString(3, s.getImgUrl());
            ps.setString(4, s.getDescribe());
            ps.setBoolean(5, s.isGender());
            ps.setDate(6, s.getDob());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateSinger(singers s) {
        String sql = "update singers_HE163253 set name = ?, imgUrl = ?, describe = ?, gender = ?, dob = ? where id = ?";
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, s.getName());
            ps.setString(2, s.getImgUrl());
            ps.setString(3, s.getDescribe());
            ps.setBoolean(4, s.isGender());
            ps.setDate(5, s.getDob());
            ps.setInt(6, s.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteSinger(int id) {
        String sql = "delete from singers_HE163253 where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
//    ---------------------------------------------------------------------------------
//    Xu li thong tin lien quan den users:

    public List<users> getUserList() {
        List<users> userList = new ArrayList<>();
        String sql = "select * from users_HE163253 where role!=0";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String userName = rs.getString(1);
                String fname = rs.getString(2);
                String lname = rs.getString(3);
                boolean gender = rs.getBoolean(4);
                String email = rs.getString(5);
                String phone = rs.getString(6);
                String address = rs.getString(7);
                String imgUrl = rs.getString(8);
                String pass = rs.getString(9);
                byte role = rs.getByte(10);
                boolean active = rs.getBoolean(11);
                userList.add(new users(userName, fname, lname, gender, email, phone, address, imgUrl, pass, role, active));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return userList;
    }

    public users getUserByUName(String userName) {
        String sql = "select * from users_HE163253 where userName = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, userName);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                users u = new users(rs.getString(1), rs.getString(2), rs.getString(3), rs.getBoolean(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getByte(10), rs.getBoolean(11));
                return u;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public users getUserByUName_PW(String userName, String pass) {
        String sql = "select * from users_HE163253 where userName = ? and pass = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, userName);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                users u = new users(rs.getString(1), rs.getString(2), rs.getString(3), rs.getBoolean(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getByte(10), rs.getBoolean(11));
                return u;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public void deleteUser(String userName) {
        String sql = "delete from users_HE163253 where userName = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, userName);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addUser(users u) {
        String sql = "insert into users_HE163253(userName, fname, lname,gender,email, phone,"
                + " address, imgUrl, pass, role, active) "
                + "values(?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, u.getUserName());
            ps.setString(2, u.getFname());
            ps.setString(3, u.getLname());
            ps.setBoolean(4, u.isGender());
            ps.setString(5, u.getEmail());
            ps.setString(6, u.getPhone());
            ps.setString(7, u.getAddress());
            ps.setString(8, u.getImgUrl());
            ps.setString(9, u.getPass());
            ps.setByte(10, u.getRole());
            ps.setBoolean(11, u.isActive());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateUser(users u) {
        String sql = "update users_HE163253 set fname = ?, lname = ? , gender = ? , email = ? , phone = ? ,"
                + " address = ? , imgUrl = ? where userName = ?";
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, u.getFname());
            ps.setString(2, u.getLname());
            ps.setBoolean(3, u.isGender());
            ps.setString(4, u.getEmail());
            ps.setString(5, u.getPhone());
            ps.setString(6, u.getAddress());
            ps.setString(7, u.getImgUrl());
            ps.setString(8, u.getUserName());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void changePass(String userName, String newPass)
    {
        String sql = "update users_HE163253 set pass = ? where userName = ?";
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, newPass);
            ps.setString(2, userName);
            ps.executeUpdate();
        } catch (SQLException e) {
//            System.out.println("dayyyyyyyyyy");
            System.out.println(e);
        }
    }

    //---------------------------------------------------
//    public static void main(String[] args) {
//        MyConnect mycon = new MyConnect();
//        songs s = mycon.getSongById(1);
//        System.out.println(s);
//
//    }

}
