package com.user.servlet;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import com.dao.AppointmentDAO;
import com.db.DBConnect;
import com.entity.Appointment;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/add_appoint")
public class AppointmentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            int userId = Integer.parseInt(req.getParameter("userid"));
            String fullname = req.getParameter("fullname");
            String gender = req.getParameter("gender");
            String age = req.getParameter("age");
            String appointDate = req.getParameter("appoint_date");
            String email = req.getParameter("email");
            String phno = req.getParameter("phno");
            String diseases = req.getParameter("diseases");
            int doctorId = Integer.parseInt(req.getParameter("doct"));
            String address = req.getParameter("address");

            Appointment appointment = new Appointment(userId, fullname, gender, age, appointDate, email, phno, diseases, doctorId, address, "Pending");

            AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
            HttpSession session = req.getSession();

            if (dao.addAppointment(appointment)) {
                session.setAttribute("succMsg", "Appointment Successfully added!");
                resp.sendRedirect("user_appointment.jsp");
            } else {
                session.setAttribute("errorMsg", "Appointment Failed!");
                resp.sendRedirect("user_appointment.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
    
}
