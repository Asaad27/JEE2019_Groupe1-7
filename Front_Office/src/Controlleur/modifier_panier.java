
package Controlleur;

import Beans.Produit;
import Model.ProduitDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map.Entry;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class modifier_panier extends HttpServlet {


   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter pr=response.getWriter();
        HttpSession ses=request.getSession();
        ProduitDAO pd=null;
        try {
            pd=new ProduitDAO();
        } 
        catch (SQLException ex) { }
        catch (ClassNotFoundException ex) {}
        HashMap<Produit,Integer> panier=(HashMap<Produit,Integer>) ses.getAttribute("panier");
        String model=request.getParameter("model");
        Integer qte=Integer.parseInt(request.getParameter("qte"));
        for (Entry<Produit, Integer> entry : panier.entrySet()) {
                                    if(entry.getKey().getModel().equals(model))
                                    entry.setValue(qte);
          }
         ses.setAttribute("panier", panier);
              this.getServletContext().getRequestDispatcher("/consulter_panier.jsp?modifier_panier").forward(request, response);
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
