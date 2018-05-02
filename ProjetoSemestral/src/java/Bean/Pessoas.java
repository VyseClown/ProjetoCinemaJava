/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

/**
 *
 * @author alessandrogentil
 */
public class Pessoas {
    private String nome;
    private String cpf;
    private int codigo;
    private int idLogin;

    public Pessoas(String nome, String cpf, int codigo, int idLogin) {
        this.nome = nome;
        this.cpf = cpf;
        this.codigo = codigo;
        this.idLogin = idLogin;
    }

    public Pessoas() {
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public int getIdLogin() {
        return idLogin;
    }

    public void setIdLogin(int idLogin) {
        this.idLogin = idLogin;
    }
    
    
    
}
