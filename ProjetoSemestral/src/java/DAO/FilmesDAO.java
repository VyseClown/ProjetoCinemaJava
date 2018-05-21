/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.Filmes;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author VyseClown
 */
public class FilmesDAO {
    public List<Filmes> selecionar() throws SQLException{
        Connection con  = ConnectionFactory.getConnection();
        List<Filmes> fil = new ArrayList<Filmes>();
        PreparedStatement ps = con.prepareStatement("select * "
                + " from filme where emCartaz=1");
        //ps.setInt(1, codigo);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            fil.add(new Filmes(rs.getString("nome"),rs.getString("categoria"), rs.getString("faixaetaria"), rs.getString("descricao"), rs.getTime("duracao"), rs.getInt("id"), rs.getInt("emCartaz"), rs.getString("img")));
        }
        ps.close();
        con.close();
        return fil;
    }
    public Filmes selecionarFilme(int id) throws SQLException{
        Connection con  = ConnectionFactory.getConnection();
        Filmes fil = new Filmes();
        PreparedStatement ps = con.prepareStatement("select * "
                + " from filme where emCartaz=1 AND id = ?");
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            fil = (new Filmes(rs.getString("nome"),rs.getString("categoria"), rs.getString("faixaetaria"), rs.getString("descricao"), rs.getTime("duracao"), rs.getInt("id"), rs.getInt("emCartaz"), rs.getString("img")));
        }
        ps.close();
        con.close();
        return fil;
    }
}
