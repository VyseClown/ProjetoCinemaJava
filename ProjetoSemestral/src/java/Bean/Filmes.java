/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

import java.sql.Time;

/**
 *
 * @author VyseClown
 */
public class Filmes {
    private String nome;
    private String categoria;
    private String faixaetaria;
    private String descricao;
    private Time duracao;
    private int id;
    private int emCartaz;
    private String img;
    
    public Filmes() {
    }

    public Filmes(String nome, String categoria, String faixaetaria, String descricao, Time duracao, int id, int emCartaz, String img) {
        this.nome = nome;
        this.categoria = categoria;
        this.faixaetaria = faixaetaria;
        this.descricao = descricao;
        this.duracao = duracao;
        this.id = id;
        this.emCartaz = emCartaz;
        this.img = img;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getFaixaetaria() {
        return faixaetaria;
    }

    public void setFaixaetaria(String faixaetaria) {
        this.faixaetaria = faixaetaria;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Time getDuracao() {
        return duracao;
    }

    public void setDuracao(Time duracao) {
        this.duracao = duracao;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getEmCartaz() {
        return emCartaz;
    }

    public void setEmCartaz(int emCartaz) {
        this.emCartaz = emCartaz;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
    
    
    
}
