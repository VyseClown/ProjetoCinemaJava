/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

/**
 *
 * @author VyseClown
 */
public class Usuarios {
    private String usuario;
    private String senha;
    private int codigo;

    public Usuarios(String usuario, String senha, int codigo) {
        this.usuario = usuario;
        this.senha = senha;
        this.codigo = codigo;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public Usuarios() {
    }

    public Usuarios(String usuario, String senha) {
        this.usuario = usuario;
        this.senha = senha;
    }
    
    
}
