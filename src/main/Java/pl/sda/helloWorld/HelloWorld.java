package pl.sda.helloWorld;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;

@WebServlet(name = "HelloWorld", value = "/hello")
public class HelloWorld extends HttpServlet {

    List<String> list = new LinkedList<>();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        out.println("Hello World");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        list.add(req.getParameter("firstname") + " " + req.getParameter("lastname"));

        req.setAttribute("list", list);

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/list.jsp");

        dispatcher.forward(req, resp);
    }
}
