/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author Viet
 */
public class Movie {
    private int movieid;
    private String title;   
    private String imageurl;
    private Date releasedate;
    private String director;
    private String actor;
    private int length;
    private String sypnosis;    
    private String genre;
    public Movie() {
    }

    public Movie(int movieid, String title, String imageurl, Date releasedate, String director, String actor, int length, String sypnosis, String genre) {
        this.movieid = movieid;
        this.title = title;
        this.imageurl = imageurl;
        this.releasedate = releasedate;
        this.director = director;
        this.actor = actor;
        this.length = length;
        this.sypnosis = sypnosis;
        this.genre = genre;
    }

    

    public int getMovieid() {
        return movieid;
    }

    public void setMovieid(int movieid) {
        this.movieid = movieid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImageurl() {
        return imageurl;
    }

    public void setImageurl(String imageurl) {
        this.imageurl = imageurl;
    }

    public Date getReleasedate() {
        return releasedate;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public void setReleasedate(Date releasedate) {
        this.releasedate = releasedate;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getActor() {
        return actor;
    }

    public void setActor(String actor) {
        this.actor = actor;
    }

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
    }

    public String getSypnosis() {
        return sypnosis;
    }

    public void setSypnosis(String sypnosis) {
        this.sypnosis = sypnosis;
    }
    
}
