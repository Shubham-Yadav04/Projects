package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/Servlet")
public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();

	
	        if (session.getAttribute("numberToGuess") == null) {
	            session.setAttribute("numberToGuess", (int) (Math.random() * 10) + 1);
	            session.setAttribute("attemptsLeft", 3);
	        }

	        // it will redirect the user to the home.jsp to start the game 
	        request.getRequestDispatcher("home.jsp").forward(request, response);
	    }

	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       
	    	// getting the session object so that using that we can set or get the attributes for our user's one session
	    	HttpSession session = request.getSession();
	        int numberToGuess = (int) session.getAttribute("numberToGuess");
	        int attemptsLeft = (int) session.getAttribute("attemptsLeft");

	        // Get the user's guess
	        int userGuess = Integer.parseInt(request.getParameter("userGuess"));

	        String message;
	        if (userGuess == numberToGuess) {
	            message = "Congratulations! You guessed the correct number: " + numberToGuess;
	            session.setAttribute("gameResult", "win");
	            session.setAttribute("attemptsLeft", 0); 
	            request.getRequestDispatcher("result.jsp").forward(request, response);
	            // Game over
	        } else if (userGuess < numberToGuess) {
	            message = "Your guess is too low!";
	            attemptsLeft--;
	        } else {
	            message = "Your guess is too high!";
	            attemptsLeft--;
	        }

	        // Check if no attempts are left
	        if (attemptsLeft <= 0) {
	            message = " Game over!"; 
	            session.setAttribute("gameResult","loss");
	            request.getRequestDispatcher("result.jsp").forward(request, response);
	            return;
	            
	        }

	        // Update session attributes
	        session.setAttribute("attemptsLeft", attemptsLeft);
	        session.setAttribute("message", message);

	      
	        request.getRequestDispatcher("home.jsp").forward(request, response);
	        return ;
	    }
	}



