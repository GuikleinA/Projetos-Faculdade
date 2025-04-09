/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.PessoaDao;
import java.util.List;
import model.Pessoa;
/**
 *
 * @author guilherme.klein
 */
@WebServlet(name = "controller", urlPatterns = {"/newContato", "/newContatosdb", "/listContatos", "/editContato", "/editContatosbd", "/deleteContato", "/Controller", "/projetoProva"})
public class Controller extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet controller</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet controller at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String action = request.getServletPath();

        if (action.equals("/newContato")) {
            response.sendRedirect("newContato.jsp");
        }
        if (action.equals("/listContatos")) {

            List<Pessoa> lista = PessoaDao.lerTudo();
            request.setAttribute("lista", lista);
            RequestDispatcher dispatcher
                    = request.getRequestDispatcher("listContatos.jsp");
            dispatcher.forward(request, response);

            //response.sendRedirect("li-contatos.jsp");
        }

        if (action.equals("/projetoProva")) {
            //response.sendRedirect("li-contatos.jsp");
            response.sendRedirect("index.jsp");
        }
        
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
            String action = request.getServletPath();
            PessoaDao dao = new PessoaDao();
            Pessoa contato = new Pessoa();
    
            if (action.equals("/newContatosdb")) {
                contato.setNome(request.getParameter("nome"));
                contato.setTelefone(request.getParameter("telefone"));
                contato.setEmail(request.getParameter("email"));
                contato.setCpf(request.getParameter("cpf"));
                if (dao.salvar(contato) == 1) {
                    response.sendRedirect("contSalvo.jsp");
                } else {
                    response.sendRedirect("contErro.jsp");
                }
            }
    
            if (action.equals("/editContato")) {
                log(request.getParameter("id"));
                contato = dao.getContatoPorId(Integer.parseInt(request.getParameter("id")));
                //log("aaaaa: "+ contato.getId());
                if (contato.getId() > 0) {
                    request.setAttribute("contato", contato);
                    request.setAttribute("id", contato.getId());
                    request.setAttribute("nome", contato.getNome());
                    request.setAttribute("telefone", contato.getTelefone());
                    request.setAttribute("email", contato.getEmail());
                    request.setAttribute("cpf", contato.getCpf());
    
                    RequestDispatcher dispatcher
                            = request.getRequestDispatcher("editContato.jsp");
                    dispatcher.forward(request, response);
    
                } else {
                    response.sendRedirect("listContatos.jsp");
                }
            }
    
            if (action.equals("/editContatosbd")) {
    
                contato.setId(Integer.parseInt(request.getParameter("id")));
                contato.setNome(request.getParameter("nome"));
                contato.setTelefone(request.getParameter("telefone"));
                contato.setEmail(request.getParameter("email"));
                contato.setCpf(request.getParameter("cpf"));
                if (dao.atualizar(contato) == 1) {
                    response.sendRedirect("contSalvo.jsp");
                } else {
                    response.sendRedirect("contErro.jsp");
                }
            }
            if (action.equals("/deleteContato")) {
                contato = dao.getContatoPorId(Integer.parseInt(request.getParameter("id")));
                if (dao.deletar(contato) == 1) {
                    response.sendRedirect("contDeleted.jsp");
                } else {
                    response.sendRedirect("contDeletedError.jsp");
                }
    
            }
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
