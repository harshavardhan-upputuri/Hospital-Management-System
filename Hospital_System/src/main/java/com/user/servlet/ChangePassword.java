package com.user.servlet;

import java.io.IOException;

import com.dao.UserDao;
import com.db.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UserChangePassword")
public class ChangePassword extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int uid=Integer.parseInt(req.getParameter("uid"));
		String oldPassword=req.getParameter("oldPassword");
		String newPassword=req.getParameter("newPassword");
		
		
		UserDao dao= new UserDao(DBConnect.getConn());
		HttpSession session = req.getSession();
		
		if(dao.checkOldPassword(uid, oldPassword)) {
			if(dao.changePassword(uid, newPassword)) {
				session.setAttribute("succMsg","Password updated");
				resp.sendRedirect("change_password.jsp");
			}else {
				session.setAttribute("errorMsg","something incorrect");
				resp.sendRedirect("change_password.jsp");
			}
		}else {
			session.setAttribute("errorMsg","Password incorrect");
			resp.sendRedirect("change_password.jsp");
		}
	}

}
