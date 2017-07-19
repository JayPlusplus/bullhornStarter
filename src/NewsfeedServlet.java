

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import customTools.DbBullhorn;
import model.Bhpost;

/**
 * Servlet implementation class NewsfeedServlet
 */
@WebServlet("/NewsfeedServlet")
public class NewsfeedServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewsfeedServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<Post> posts = new ArrayList<Post>();
		//create a class called Post that contains email and text fields.
		Post p = new Post();
		p.setEmail("lisa@fox.net");
		p.setText("This is the text of my post");
		posts.add(p);
		doGet(request, response);
		request.setAttribute("posts",posts);
		long filterByUserID = 0; 
		String searchtext = "";
		
		String nextURL = "/Error.jsp";
		//get user out of session. If they don't exist then send them back to the login page.
		//kill the session while you're at it.
		HttpSession session = request.getSession();
		if (session.getAttribute("user")==null){
			//http://stackoverflow.com/questions/13638446/checking-servlet-session-attribute-value-in-jsp-file
			nextURL = "/LoginPage.jsp";
			session.invalidate();
			response.sendRedirect(request.getContextPath() + nextURL);
		    return;//return prevents an error
		}
		
		//get posts based on parameters; if no parameters then get all posts
		List<Bhpost> posts1 = null;
		if (request.getParameter("userid")!=null){
			filterByUserID = Integer.parseInt(request.getParameter("userid"));
			posts1 = DbBullhorn.postsofUser(filterByUserID);
		}else if (request.getParameter("searchtext")!=null){
			searchtext = request.getParameter("searchtext").toString();
			posts1 = DbBullhorn.searchPosts(searchtext);
		}else{
			posts1 = DbBullhorn.bhPost();
		}
		
		//add posts to session
		session.setAttribute("posts", posts1);
		//display posts in newsfeed.jsp
		nextURL = "/Newsfeed.jsp";
		//redirect to next page as indicated by the value of the nextURL variable
		getServletContext().getRequestDispatcher(nextURL).forward(request,response);
	}

}
