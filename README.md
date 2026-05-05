# ImageHub Website

ImageHub is a Java web application for uploading, sharing, liking, and commenting on images.

I built this project to practice full-stack web development using Java, JSP/Servlets, MySQL, HTML, CSS, and JavaScript. The application includes user authentication, image upload, a main gallery feed, a user profile page, likes, comments, and delete actions for user-owned content.

## Features

- User registration and login
- Session-based user access
- Image upload and display from MySQL
- Main gallery feed with images from all users
- User profile page with personal uploaded images
- Like / unlike functionality
- Comment system
- Delete image and comment actions with ownership checks
- Basic responsive UI with CSS and JavaScript

## Technologies Used

- Java
- JSP and Servlets
- MySQL
- JDBC
- HTML, CSS, JavaScript
- Apache Tomcat
- Eclipse IDE

## Project Structure

```text
ImageHub/
├── src/main/java/
│   ├── com/imagehub/
│   │   ├── ImageServlet.java
│   │   ├── LogoutServlet.java
│   │   └── UploadServlet.java
│   └── com/uniquedeveleper/registration/
│       ├── RegistartionServlet.java
│       └── loginServlet.java
├── src/main/webapp/
│   ├── css/
│   ├── js/
│   ├── images/
│   ├── index.jsp
│   ├── login.jsp
│   ├── registration.jsp
│   ├── mainpage.jsp
│   └── profile.jsp
├── database_schema.sql
└── README.md
```

## Database Setup

The project uses a MySQL database named `userlogin`.

A starter schema is included in:

```text
database_schema.sql
```

Before running the project, update the database username and password in the Java/JSP files:

```text
YOUR_MYSQL_USERNAME
YOUR_MYSQL_PASSWORD
```

This was done intentionally so no local credentials are stored in the public repository.

## How to Run

1. Create the MySQL database using `database_schema.sql`.
2. Import the project into Eclipse as a Dynamic Web Project.
3. Add the MySQL JDBC driver to the project build path.
4. Configure Apache Tomcat.
5. Update the local database credentials.
6. Run the project on Tomcat.
7. Open the application in the browser.

## Notes

This project was built as a learning project while practicing Java web development and database integration.

Some future improvements I would add:

- Move database configuration to a separate config file or environment variables
- Add password hashing
- Improve MVC separation
- Add better validation and error handling
- Improve the UI design

## Author

Bilal Ness
