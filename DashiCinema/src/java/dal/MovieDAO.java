/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.SQLException;
import java.util.ArrayList;
import model.Movie;

/**
 *
 * @author Viet
 */
public class MovieDAO extends MyDAO{
    public ArrayList<Movie> getAll(){
        ArrayList<Movie> list = new ArrayList<>();
        xSql = "SELECT Movie.MovieID, Title, Imageurl, ReleaseDate, Director, Actor, Length, Sypnosis, STRING_AGG(GenreName, ', ' )AS genre FROM dbo.Movie JOIN dbo.MovieGenres ON MovieGenres.MovieID = Movie.MovieID JOIN dbo.Genre ON Genre.GenreID = MovieGenres.GenreID GROUP BY Movie.MovieID, Title, Imageurl, ReleaseDate, Director, Actor, Length, Sypnosis";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Movie(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getString(8), rs.getString(9)));
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return list;
    }
    public ArrayList<Movie> getByDate(boolean bool){
        ArrayList<Movie> list = new ArrayList<>();
        xSql = "SELECT Movie.MovieID, Title, Imageurl, ReleaseDate, Director, Actor, Length, Sypnosis, STRING_AGG(GenreName, ', ' )AS genre FROM dbo.Movie JOIN dbo.MovieGenres ON MovieGenres.MovieID = Movie.MovieID JOIN dbo.Genre ON Genre.GenreID = MovieGenres.GenreID where GETDATE()"+(bool==true?">=":"<=")+"ReleaseDate GROUP BY Movie.MovieID, Title, Imageurl, ReleaseDate, Director, Actor, Length, Sypnosis order by ReleaseDate";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Movie(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getString(8), rs.getString(9)));
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return list;
    }
    public Movie getMovieByID(int id){
        xSql = "SELECT Movie.MovieID, Title, Imageurl, ReleaseDate, Director, Actor, Length, Sypnosis, STRING_AGG(GenreName, ', ' )AS genre FROM dbo.Movie JOIN dbo.MovieGenres ON MovieGenres.MovieID = Movie.MovieID JOIN dbo.Genre ON Genre.GenreID = MovieGenres.GenreID where Movie.MovieID = ? GROUP BY Movie.MovieID, Title, Imageurl, ReleaseDate, Director, Actor, Length, Sypnosis";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
            rs = ps.executeQuery();            
            if(rs.next())
                return new Movie(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getString(8), rs.getString(9));
        } catch (SQLException e) {
            System.err.println(e);
        }
        return null;
    }

    
}
