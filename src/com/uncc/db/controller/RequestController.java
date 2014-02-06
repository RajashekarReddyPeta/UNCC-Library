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
 * Servlet implementation class RequestController
 */
public class RequestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String searchInput = null;
		String criteria = null;
		ResultSet rs = null;
		ResultSetMetaData rsmd = null;
		String query = null;
		PreparedStatement pstm = null;
		searchInput = request.getParameter("search_input");
		criteria = request.getParameter("criteria");
		if(criteria.equalsIgnoreCase("All")){
			query = ConstantsBundle.queryForAll + "and b.authors like '"+searchInput+"%'";
		}else if(criteria.equalsIgnoreCase("OCLC")){
			query = ConstantsBundle.queryForAll +"and i.oclc_number like '"+searchInput+"%'";
		}else if(criteria.equalsIgnoreCase("NAME")){
			query = ConstantsBundle.queryForAll + "and b.name like '"+searchInput+"%'";
		}else if(criteria.equalsIgnoreCase("AUTHOR")){
			query = ConstantsBundle.queryForAll + "and b.authors like '"+searchInput+"%'";
		}else if(criteria.equalsIgnoreCase("ISBN")){
			query = ConstantsBundle.queryForAll + "and m.isbn like '"+searchInput+"%'";
		}
		Connection conn = null;
		List arrayObj = null;
		int columnCount = 0;
		HttpSession httpSessioObj = null;
		System.out.println(query);
		try {
			DatabaseConnection obj = new DatabaseConnection();
			conn = obj.createConnection();
			pstm = conn.prepareStatement(query);
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
			response.sendRedirect("ResultInfo.jsp");
			rs.close();
			conn.close();

		} catch (SQLException e) {

			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		
	}

}
