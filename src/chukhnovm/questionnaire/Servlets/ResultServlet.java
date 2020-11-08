package chukhnovm.questionnaire.Servlets;

import chukhnovm.questionnaire.HttpSessionCollector;
import chukhnovm.questionnaire.Services.QuestionnaireService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(value = "/result")
public class ResultServlet  extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null) {
            resp.sendRedirect("index.jsp");
        } else {

            String[] answersArray = QuestionnaireService.parseParameterMap(req.getParameterMap());

            //Write answers to session
            session.setAttribute("answers", answersArray);

            // Get answers from all sessions
            req.setAttribute("allSessions", HttpSessionCollector.getSessions());

            RequestDispatcher rd = req.getRequestDispatcher("result.jsp");
            rd.forward(req, resp);
        }
    }
}
