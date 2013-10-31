package com.utils;
import javax.servlet.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EncodingFilter
 */
@WebServlet("/EncodingFilter")
public class EncodingFilter extends HttpServlet implements Filter {
	private static final long serialVersionUID = 1L;
	private FilterConfig config = null;
	private String encoding = "";       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EncodingFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	public void init(FilterConfig config) throws ServletException {
		this.config = config;
		this.encoding = config.getInitParameter("encoding");
	}
    
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
    	throws java.io.IOException, ServletException {
    	HttpServletRequest req = (HttpServletRequest)request;
    	HttpServletResponse res = (HttpServletResponse)response;
    	response.setCharacterEncoding(this.encoding);
    	java.io.PrintWriter out = res.getWriter();
    	out.print("filter code set as: " + this.encoding+"<br><br>");
    	chain.doFilter(req, res);
	}

}
