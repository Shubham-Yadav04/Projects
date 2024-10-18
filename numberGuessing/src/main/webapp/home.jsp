<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="home.css">
<title>Guess Number</title>

</head>
<body>

    <header class="topContent">
        <h1>Guess The Number</h1>
    </header>
    <main class="main">
        <div class="container">
            <h1>Welcome to the Guess Game</h1>
             
    <%
        // Check if this is the first time or game has already been initialized
        Integer numberToGuess = (Integer) session.getAttribute("numberToGuess");
        Integer attemptsLeft = (Integer) session.getAttribute("attemptsLeft");
        String gameResult = (String) session.getAttribute("gameResult");
        // If session doesn't have the game setup, redirect to the servlet to initialize it
        if (numberToGuess == null || attemptsLeft == null) {
            response.sendRedirect("Servlet");
            return;
        }                         

        String message = (String) session.getAttribute("message");
        if (message != null) {
            out.println("<p>" + message + "</p>");
        }
        
     
            %>
            
            <form action="Servlet" method="post">
                <input type="number" name="userGuess" placeholder="Enter the number">
                <div class="buttons">
                <button>
                    Submit
                </button>
                
                <button class="reset"><a href="restartServlet">Restart</a></button>
</div>
                <h2>Remaining Chance : <%= session.getAttribute("attemptsLeft") %> </h2>
            </form>
    <!--        <form action="restartServlet" method="post">
        <input type="submit" value="Restart Game">
    </form> -->   
        </div>

    </main>
    <footer>
       <h3>  Shubham Yadav @CodSoft internship Task</h3>
    </footer>



</body>
</html>