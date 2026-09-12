# Admin CRUD – Spring Boot 4

A full-featured web administration panel built with Spring Boot 4, Spring MVC, Spring Security, JSP, SiteMesh 3, and Bootstrap 5.

## 🛠 Tech Stack

| Technology | Version |
|---|---|
| Java | 25 |
| Spring Boot | 4.1.1 |
| Spring MVC | 7.x |
| Spring Security | 7.x |
| Spring Data JPA / Hibernate | - |
| MySQL Connector/J | 9.x |
| Tomcat Jasper (JSP) | 11.x |
| Jakarta JSTL | 3.0.x |
| SiteMesh | 3.2.2 |
| Bootstrap | 5.3.3 |
| Maven | 3.9.14 |

## 📋 Requirements

- Java 25 (JDK 25)
- Maven 3.9+
- MySQL 8.x
- IDE: IntelliJ IDEA / VS Code (optional)

## 🗄 Database Setup

1. Create the database in MySQL:

```sql
CREATE DATABASE admin_crud
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;
```

2. Configure connection in `src/main/resources/application.properties`:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/admin_crud?...
spring.datasource.username=root
spring.datasource.password=YOUR_PASSWORD
```

3. The tables are created automatically by Hibernate (`ddl-auto=update`).

4. The default admin user is seeded on startup (see below).

## ⚙ Configuration

Edit `src/main/resources/application.properties`:

```properties
# Server
server.port=8080

# MySQL
spring.datasource.url=jdbc:mysql://localhost:3306/admin_crud?useSSL=false&serverTimezone=Asia/Ho_Chi_Minh&characterEncoding=UTF-8&allowPublicKeyRetrieval=true
spring.datasource.username=root
spring.datasource.password=123456

# JPA
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
```

## 🔨 How to Build

```bash
mvn clean package -DskipTests
```

Or with tests:

```bash
mvn clean package
```

## 🚀 How to Run

### Option 1 – Maven Spring Boot plugin

```bash
mvn spring-boot:run
```

### Option 2 – WAR file

```bash
java -jar target/admin-crud-0.0.1-SNAPSHOT.war
```

### Option 3 – Deploy to external Tomcat

Copy the `.war` file to `webapps/` folder of your Tomcat 11 installation.

## 🔑 Admin Account

> **⚠️ WARNING: This account is for DEVELOPMENT ONLY. Change credentials before production deployment.**

| Field | Value |
|---|---|
| Username | `admin` |
| Password | `admin123` |
| Role | `ROLE_ADMIN` |

The account is created automatically on first startup if it doesn't exist.

## 📁 Project Structure

```
src/main/
├── java/hcmute/admin_crud/
│   ├── AdminCrudApplication.java
│   ├── config/
│   │   ├── DataInitializer.java      # Seeds admin user on startup
│   │   ├── SecurityConfig.java       # Spring Security configuration
│   │   └── SiteMeshConfig.java       # SiteMesh 3 filter registration
│   ├── controller/
│   │   ├── AuthController.java       # /login
│   │   └── admin/
│   │       ├── AdminController.java  # /admin/dashboard
│   │       ├── CategoryController.java
│   │       └── UserController.java
│   ├── entity/
│   │   ├── Category.java
│   │   ├── User.java
│   │   └── Role.java
│   ├── repository/
│   │   ├── CategoryRepository.java
│   │   ├── UserRepository.java
│   │   └── RoleRepository.java
│   ├── service/
│   │   ├── CategoryService.java
│   │   ├── UserService.java
│   │   └── impl/
│   │       ├── CategoryServiceImpl.java
│   │       └── UserServiceImpl.java
│   └── exception/
│       └── ResourceNotFoundException.java
│
├── resources/
│   ├── application.properties
│   └── static/
│       ├── css/admin.css
│       └── js/admin.js
│
└── webapp/WEB-INF/
    ├── sitemesh3.xml
    └── views/
        ├── decorators/admin.jsp       # SiteMesh layout decorator
        ├── auth/login.jsp
        └── admin/
            ├── dashboard.jsp
            ├── category/
            │   ├── list.jsp
            │   └── form.jsp
            └── user/
                ├── list.jsp
                └── form.jsp
```

## 🌐 Available URLs

| URL | Description | Access |
|---|---|---|
| `GET /login` | Login page | Public |
| `POST /login` | Login form submit | Public |
| `POST /logout` | Logout | Authenticated |
| `GET /admin/dashboard` | Admin dashboard | ROLE_ADMIN |
| `GET /admin/categories` | Category list with search & pagination | ROLE_ADMIN |
| `GET /admin/categories/create` | New category form | ROLE_ADMIN |
| `POST /admin/categories/create` | Create category | ROLE_ADMIN |
| `GET /admin/categories/edit/{id}` | Edit category form | ROLE_ADMIN |
| `POST /admin/categories/edit/{id}` | Update category | ROLE_ADMIN |
| `POST /admin/categories/delete/{id}` | Delete category | ROLE_ADMIN |
| `GET /admin/users` | User list with search & pagination | ROLE_ADMIN |
| `GET /admin/users/create` | New user form | ROLE_ADMIN |
| `POST /admin/users/create` | Create user | ROLE_ADMIN |
| `GET /admin/users/edit/{id}` | Edit user form | ROLE_ADMIN |
| `POST /admin/users/edit/{id}` | Update user | ROLE_ADMIN |
| `POST /admin/users/delete/{id}` | Delete user | ROLE_ADMIN |

## 🔒 Security Notes

- Passwords are stored as **BCrypt** hashes — never plaintext.
- All `/admin/**` routes require `ROLE_ADMIN`.
- Anonymous users are redirected to `/login`.
- CSRF protection is enabled.
- JSP outputs use `<c:out>` for XSS protection.

## 🗺 Features

- ✅ Login / Logout with Spring Security
- ✅ Admin Dashboard with stats
- ✅ Category CRUD (Create, Read, Update, Delete)
- ✅ User CRUD with BCrypt password
- ✅ Search (database-level, case-insensitive)
- ✅ Pagination (Spring Data Page/Pageable)
- ✅ Form Validation (Jakarta Validation)
- ✅ Flash Messages (POST → Redirect → GET)
- ✅ Delete Confirmation Modal
- ✅ SiteMesh 3 Decorator Layout
- ✅ Bootstrap 5 Responsive UI
- ✅ Role Management (ROLE_ADMIN / ROLE_USER)
- ✅ User Enable/Disable Status
