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

public class DeleteNote extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int noteId = Integer.parseInt(req.getParameter("note_id"));
        System.out.println(noteId);

        Session s = FactoryProvider.getFactory().openSession();

        Transaction tx = s.beginTransaction();
        Note note = s.get(Note.class,noteId);
        s.remove(note);
        tx.commit();

        s.close();
        resp.sendRedirect("view_notes.jsp");
    }
}
