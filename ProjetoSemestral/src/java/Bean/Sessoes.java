/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author alessandrogentil
 */
public class Sessoes {
    private int id;
    private int idFilme;
    private Time horarioInicio;
    private int idSala;
    private Date data;
    private int qtdLugares;
    private String nomeFilme;
    private Float valor;

    public Sessoes() {
    }

    public Sessoes(int id, int idFilme, Time horarioInicio, int idSala, Date data, int qtdLugares, String nomeFilme, Float valor) {
        this.id = id;
        this.idFilme = idFilme;
        this.horarioInicio = horarioInicio;
        this.idSala = idSala;
        this.data = data;
        this.qtdLugares = qtdLugares;
        this.nomeFilme = nomeFilme;
        this.valor = valor;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdFilme() {
        return idFilme;
    }

    public void setIdFilme(int idFilme) {
        this.idFilme = idFilme;
    }

    public Time getHorarioInicio() {
        return horarioInicio;
    }

    public void setHorarioInicio(Time horarioInicio) {
        this.horarioInicio = horarioInicio;
    }

    public int getIdSala() {
        return idSala;
    }

    public void setIdSala(int idSala) {
        this.idSala = idSala;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public int getQtdLugares() {
        return qtdLugares;
    }

    public void setQtdLugares(int qtdLugares) {
        this.qtdLugares = qtdLugares;
    }

    public String getNomeFilme() {
        return nomeFilme;
    }

    public void setNomeFilme(String nomeFilme) {
        this.nomeFilme = nomeFilme;
    }

    public Float getValor() {
        return valor;
    }

    public void setValor(Float valor) {
        this.valor = valor;
    }
    
    
}
