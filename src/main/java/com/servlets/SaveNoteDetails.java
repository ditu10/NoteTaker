package com.servlets;

import com.entities.Note;
import com.helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

public class SaveNoteDetails extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("SaveNoteDetails's post method hitting..");
        String title = req.getParameter("title");
        String content = req.getParameter("content");
//        System.out.println(title + " : " + content);
        Note note = new Note(title,content,new Date());

        Session s = FactoryProvider.getFactory().openSession();

        Transaction tx = s.getTransaction();
        tx.begin();
        s.persist(note);
        tx.commit();

        PrintWriter out = resp.getWriter();
        resp.setContentType("text/html");
        out.println("<div style='text-align:center'>");
        out.println("<h2>Note is added successfully!</h2>");
        out.println("<h4><a href = 'view_notes.jsp'>view notes</a></h4>");
        out.println("</div>");

        s.close();
    }
}
