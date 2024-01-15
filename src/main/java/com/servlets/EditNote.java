package com.servlets;

import com.entities.Note;
import com.helper.FactoryProvider;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.IOException;
import java.util.Date;

public class EditNote extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int noteId = Integer.parseInt(req.getParameter("note_id"));
        Session s = FactoryProvider.getFactory().openSession();
        Note note = s.get(Note.class,noteId);


        req.setAttribute("note",note);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("editNote.jsp");
        requestDispatcher.forward(req, resp);

        s.close();

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(req.getParameter("_method"));
        Session s = FactoryProvider.getFactory().openSession();

        Note note = s.get(Note.class,req.getParameter("note_id"));
        note.setTitle(req.getParameter("title"));
        note.setContent(req.getParameter("content"));
        note.setAddedDate(new Date());

        Transaction tx = s.beginTransaction();
        s.persist(note);
        tx.commit();

        resp.sendRedirect("view_notes.jsp");

        s.close();
    }

}
