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
public class Venda {
    private int id;
    private int IDpessoa;
    private int IDsessao;
    private int quantidade;

    public Venda() {
    }

    public Venda(int id, int IDpessoa, int IDsessao, int quantidade) {
        this.id = id;
        this.IDpessoa = IDpessoa;
        this.IDsessao = IDsessao;
        this.quantidade = quantidade;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIDpessoa() {
        return IDpessoa;
    }

    public void setIDpessoa(int IDpessoa) {
        this.IDpessoa = IDpessoa;
    }

    public int getIDsessao() {
        return IDsessao;
    }

    public void setIDsessao(int IDsessao) {
        this.IDsessao = IDsessao;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }
    
    
}
