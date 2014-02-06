package com.uncc.db.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.uncc.db.constants.ConstantsBundle;
import com.uncc.db.dao.DatabaseConnection;

/**
 * Servlet implementation class DataController
 */
public class DataController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DataController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String requested_info = null;
		ResultSet rs = null;
		ResultSetMetaData rsmd = null;
		String query = ConstantsBundle.queryForGet;
		PreparedStatement pstm = null;
		requested_info = java.net.URLDecoder.decode(request.getParameter("requested_info").toString(), "UTF-8") ;
		Connection conn = null;
		List arrayObj = null;
		int columnCount = 0;
		HttpSession httpSessioObj = null;
		try {
			DatabaseConnection obj = new DatabaseConnection();
			conn = obj.createConnection();
			requested_info.replace("'", " ");
			pstm = conn.prepareStatement(query + "'"+requested_info+"'");
			rs = pstm.executeQuery();
			rsmd = rs.getMetaData();
			columnCount = rsmd.getColumnCount();
			arrayObj = new ArrayList();
			while(rs.next()){
				for(int i =1; i <=columnCount;i++)
					arrayObj.add(rs.getString(i));
			}
			for(int i=0;i<arrayObj.size();i++){
				System.out.println(arrayObj.get(i));

			}
			httpSessioObj = request.getSession();
			httpSessioObj.setAttribute("arrayObj", arrayObj);
			httpSessioObj.setAttribute("columnCount", columnCount);
			response.sendRedirect("TableInfo.jsp");
			rs.close();
			conn.close();

		} catch (SQLException e) {

			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
