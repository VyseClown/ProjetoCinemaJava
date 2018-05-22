/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.Filmes;
import Bean.Sessoes;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author alessandrogentil
 */
public class SessaoDAO {
    public List<Sessoes> selecionar(int idFilme) throws SQLException{
        Connection con  = ConnectionFactory.getConnection();
        List<Sessoes> fil = new ArrayList<Sessoes>();
        PreparedStatement ps = con.prepareStatement("select * "
                + " from sessao"
                + " inner join filme on sessao.idFilme = filme.id"
                + " where idFilme=?");
        //ps.setInt(1, codigo);
        ps.setInt(1, idFilme);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            fil.add(new Sessoes(rs.getInt("id"),rs.getInt("idFilme"), rs.getTime("horarioInicio"), rs.getInt("idSala"), rs.getDate("data"), rs.getInt("qtdLugares"), rs.getString("nome"), rs.getFloat("valor")));
        }
        ps.close();
        con.close();
        return fil;
    }
    public Sessoes selecionarSessao(int id) throws SQLException{
        Connection con  = ConnectionFactory.getConnection();
        Sessoes fil = new Sessoes();
        PreparedStatement ps = con.prepareStatement("select * "
                + " from sessao"
                + " inner join filme on sessao.idFilme = filme.id"
                + " where sessao.id = ?");
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            fil = (new Sessoes(rs.getInt("id"),rs.getInt("idFilme"), rs.getTime("horarioInicio"), rs.getInt("idSala"), rs.getDate("data"), rs.getInt("qtdLugares"), rs.getString("nome"), rs.getFloat("valor")));
        }
        ps.close();
        con.close();
        return fil;
    }
    public void diminuirIngresso(int quantidade, int idSessao, int idPessoa) throws SQLException{
        Connection con  = ConnectionFactory.getConnection();
        Sessoes fil = new Sessoes();
        PreparedStatement ps = con.prepareStatement("update sessao "
                + "set qtdLugares = qtdLugares-?"
                + " where sessao.id = ?");
        ps.setInt(1, quantidade);
        ps.setInt(2, idSessao);
        ps.executeUpdate();
        
        PreparedStatement ps2 = con.prepareStatement("insert into venda (pessoa,sessao,quantidade) values (?,?,?)");
        ps2.setInt(1, idPessoa);
        ps2.setInt(2, idSessao);
        ps2.setInt(3, quantidade);
        ps2.execute();
        //while(rs.next()){
        //    fil = (new Sessoes(rs.getInt("id"),rs.getInt("idFilme"), rs.getTime("horarioInicio"), rs.getInt("idSala"), rs.getDate("data"), rs.getInt("qtdLugares"), rs.getString("nome"), rs.getFloat("valor")));
        //}
        ps.close();
        con.close();
        //return fil;
    }
}
