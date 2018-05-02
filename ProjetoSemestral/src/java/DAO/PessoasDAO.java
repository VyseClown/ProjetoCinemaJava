/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import Bean.Pessoas;
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
public class PessoasDAO {
    public void inserir(Pessoas pes) throws SQLException{
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement ps = con.prepareStatement("insert into"
        + " pessoa (nome, cpf, idLogin) "
        + " values (?,?, ?)");
        
        ps.setString(1, pes.getNome());
        ps.setString(2, pes.getCpf());
        ps.setInt(3, pes.getIdLogin());
        ps.execute();
        ps.close();
        con.close();
    }
    public void alterar(Pessoas usu) throws SQLException{
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement ps = con.prepareStatement("update "
                + " pessoa set nome=?, CPF=? "
                + " where idLogin = ?");
        //passagem de valores de parametros
        ps.setString(1, usu.getNome());
        ps.setString(2, usu.getCpf());
        ps.setInt(3, usu.getIdLogin());
         //executar
         ps.execute();
         //fechar comando e conexao
         ps.close();
         con.close();
    }
}
