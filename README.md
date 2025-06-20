# 📣 Complaint Management System (CMS)

## 🛠️ About the Project
The Complaint Management System (CMS) is a web-based application designed for internal municipal use. It allows employees to submit and track complaints, and administrators to manage complaint resolutions. This project was built as part of an individual assignment using JavaServer Pages (JSP), Jakarta EE, and MySQL, following the MVC (Model-View-Controller) design pattern.

All HTTP interactions are handled via synchronous HTML form submissions using GET and POST methods. No asynchronous operations (AJAX, fetch, etc.) are used.


## 🚀 Features

### 👨‍💼 Employee Role
- Log in to the system
- Submit new complaints
- View list of submitted complaints
- Edit or delete unresolved complaints

### 👩‍💼 Admin Role
- Log in to the system
- View all complaints from all users
- Update complaint status and add remarks
- Delete any complaint


## 🔧 Technology Stack

| Component    | Technology                              |
|--------------|------------------------------------------|
| Frontend     | JSP, HTML, CSS, JavaScript (validation only) |
| Controller   | Jakarta EE (Servlets)                   |
| Model        | JavaBeans, DAO                          |
| Database     | MySQL via Apache Commons DBCP           |
| Server       | Apache Tomcat                           |




