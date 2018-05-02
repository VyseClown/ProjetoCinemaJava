/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.Usuarios;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author VyseClown
 */
public class UsuariosDAO {
    public void inserir(Usuarios usu) throws SQLException{
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement ps = con.prepareStatement("insert into"
        + " login (usuario, senha) "
        + " values (?,?)");
        
        ps.setString(1, usu.getUsuario());
        ps.setString(2, usu.getSenha());
        ps.execute();
        ps.close();
        con.close();
    }
    
    public void alterar(Usuarios usu) throws SQLException{
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement ps = con.prepareStatement("update "
                + " login set usuario=?, senha=? "
                + " where codigo = ?");
        //passagem de valores de parametros
        ps.setString(1, usu.getUsuario());
        ps.setString(2, usu.getSenha());
        ps.setInt(3, usu.getCodigo());
         //executar
         ps.execute();
         //fechar comando e conexao
         ps.close();
         con.close();
    }
    public Usuarios logar(String usuario, String senha) throws SQLException{
        Connection con  = ConnectionFactory.getConnection();
        Usuarios usu = null;
        PreparedStatement ps = con.prepareStatement("select * "
                + " from login where usuario = ? AND senha = ?");
        ps.setString(1, usuario);
        ps.setString(2, senha);
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            usu = new Usuarios(rs.getString("usuario"),
                    rs.getString("senha"), rs.getInt("id"));
        }
        ps.close();
        con.close();
        return usu;
    }
    public Usuarios selecionar(int codigo) throws SQLException{
        Connection con  = ConnectionFactory.getConnection();
        Usuarios usu = null;
        PreparedStatement ps = con.prepareStatement("select * "
                + " from login where id = ?");
        ps.setInt(1, codigo);
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            usu = new Usuarios(rs.getString("usuario"),
                    rs.getString("senha"),codigo);
        }
        ps.close();
        con.close();
        return usu;
    }
        public int selecionarIdComLoginSenha(String login, String senha) throws SQLException{
        Connection con  = ConnectionFactory.getConnection();
        Usuarios usu = null;
        PreparedStatement ps = con.prepareStatement("select * "
                + " from login where usuario = ? AND senha = ?");
        ps.setString(1, login);
        ps.setString(2, senha);
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            usu = new Usuarios(rs.getString("usuario"),
                    rs.getString("senha"), rs.getInt("id"));
        }
        ps.close();
        con.close();
        return usu.getCodigo();
    }
}
