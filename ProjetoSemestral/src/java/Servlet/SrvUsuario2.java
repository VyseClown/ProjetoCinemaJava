/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Bean.Usuarios;
import DAO.UsuariosDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author VyseClown
 */

public class SrvUsuario2 extends HttpServlet{
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    response.setContentType("text/html;charset=UTF-8");
    try(PrintWriter out = response.getWriter()){
        //login
        try{
            if(request.getParameter("btnacessar") != null){
                String usuario = request.getParameter("txtusuario");
                String senha = request.getParameter("txtsenha");
                if(!usuario.equals("") && !senha.equals("")){
                    Usuarios usu = (new UsuariosDAO()).logar(usuario, senha);
                    if(usu!=null){
                        HttpSession sessao = request.getSession();
                        sessao.setAttribute("codigo", usu.getCodigo());
                        response.sendRedirect("index.jsp");
                        
                    }
                    else
                        response.sendRedirect("index.jsp?msg=Login e senha não encontrados");
                }
                //else
            }
        }
        catch (Exception ex)
        {
            response.sendRedirect("index.jsp?msg=Erro!"+ex.getMessage());
        }
        try{
            //pagina de cadastro
            //botao sair
            if(request.getParameter("btnsair")!=null){
                HttpSession sessao = request.getSession();
                sessao.removeAttribute("id");
                response.sendRedirect("index.jsp");
            }
            
            //botao salvar
            if(request.getParameter("btnsalvar")!=null){
                if(!request.getParameter("txtusuario").equals("") && !request.getParameter("txtsenha").equals("")){
                    Usuarios usu = new Usuarios();
                    usu.setUsuario(request.getParameter("txtusuario"));
                    usu.setSenha(request.getParameter("txtsenha"));
                    
                    int codigo = Integer.parseInt(request.getParameter("txtcodigo"));
                    if(codigo==0)
                        (new UsuariosDAO()).inserir(usu);
                    else
                    {
                        usu.setCodigo(codigo);
                        (new UsuariosDAO()).alterar(usu);
                        

                    }
                    response.sendRedirect("index.jsp?msg=Dados salvos !");
                    
                }
                else
                    response.sendRedirect("index.jsp?msg=Informar usuario e senha !");
            }
        }
        catch(Exception ex){
            response.sendRedirect("index.jsp?msg=Erro!"+ex.getMessage());
        }
    }
    }
        // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
