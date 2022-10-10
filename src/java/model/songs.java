/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Mai
 */
public class songs {

    private int id;
    private String name, songUrl;
    private int pubYear;
    private String authorName, Lyrics;
    private int albumId;

    public songs() {
    }

    public songs(int id, String name, String songUrl, int pubYear, String authorName, String Lyrics, int albumId) {
        this.id = id;
        this.name = name;
        this.songUrl = songUrl;
        this.pubYear = pubYear;
        this.authorName = authorName;
        this.Lyrics = Lyrics;
        this.albumId = albumId;
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

    public String getSongUrl() {
        return songUrl;
    }

    public void setSongUrl(String songUrl) {
        this.songUrl = songUrl;
    }

    public int getPubYear() {
        return pubYear;
    }

    public void setPubYear(int pubYear) {
        this.pubYear = pubYear;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public String getLyrics() {
        return Lyrics;
    }

    public void setLyrics(String Lyrics) {
        this.Lyrics = Lyrics;
    }

    public int getAlbumId() {
        return albumId;
    }

    public void setAlbumId(int albumId) {
        this.albumId = albumId;
    }

    @Override
    public String toString() {
        return "songs{" + "id=" + id + ", name=" + name + ", songUrl=" + songUrl + ", pubYear=" + pubYear + ", authorName=" + authorName + ", Lyrics=" + Lyrics + ", albumId=" + albumId + '}';

    }


}
