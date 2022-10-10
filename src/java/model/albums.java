/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
//import java.util.Objects;

/**
 *
 * @author Mai
 */
public class albums {
    private int id;
    private String name, imgUrl, describe;

    public albums() {
    }

    public albums(int id, String name, String imgUrl, String describe) {
        this.id = id;
        this.name = name;
        this.imgUrl = imgUrl;
        this.describe = describe;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
       
    }

    @Override
    public String toString() {
        return "albums{" + "id=" + id + ", name=" + name + ", imgUrl=" + imgUrl + ", describe=" + describe + '}';
    }
//    
//    public static void main(String[] args) {
//        albums a = new albums();
//        a.setDescribe("hii");
//    }
}
