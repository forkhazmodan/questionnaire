package chukhnovm.questionnaire.Servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/auth")
public class AuthServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String username = req.getParameter("username");

        if (username == null || "".equals(username)) {
            resp.sendError(401);
        } else {
            HttpSession session = req.getSession(true);
            session.setAttribute("username", username);

            Cookie cookie = new Cookie("JSESSIONID", session.getId());
            resp.addCookie(cookie);
            resp.sendRedirect("/questionnaire");
        }
    }
}
