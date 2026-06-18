# Viva / Interview Questions

##  Basic

- What is Spring Boot?
- What is MVC architecture?

---Basic
Answer 1: Spring Boot is an extension of the Spring framework that simplifies the process of setting up, configuring, and running production-ready Java applications. It eliminates the need for extensive XML configuration or boilerplate code by utilizing "opinionated" defaults and auto-configuration. It also features embedded servers like Tomcat or Jetty, allowing developers to run applications instantly as standalone Java applications without needing an external web server.

Answer 2: MVC stands for Model-View-Controller, which is a software design pattern used to separate an application into three interconnected components. The Model manages the data, business logic, and core rules of the application. The View handles the display, rendering the user interface and presenting data to the end user. The Controller acts as the intermediary, receiving user requests from the View, invoking the appropriate Model logic, and determining which View to return with the updated data.

##  Intermediate

- What is Service layer?
- What is Repository in Spring Data JPA?
- Difference between GET and POST?

---Answer 1: The Service layer is a distinct architectural layer in an application that houses the core business logic. It sits squarely between the Controller layer, which handles HTTP requests, and the Repository layer, which handles database access. By isolating business rules, calculations, and transaction management in the Service layer, the application remains modular, easier to test, and decoupled from both user interface concerns and database structures.

Answer 2: A Repository in Spring Data JPA is an interface that acts as a Data Access Object (DAO) to manage database operations for a specific entity. By extending interfaces like JpaRepository or CrudRepository, Spring Boot automatically generates the necessary SQL implementation at runtime for standard operations like saving, deleting, and finding data. It allows developers to perform CRUD operations and write custom database queries using method names or annotations without writing manual SQL.

Answer 3: The GET and POST methods differ primarily in their purpose, data handling, and security characteristics. A GET request is used to retrieve data from a server, appending parameters directly to the URL as a query string, which makes it visible in the browser history, cacheable, and limited in data length. A POST request is used to send data to a server to create or update a resource, packaging the data within the HTTP request body, which makes it safer for sensitive information, non-cacheable, and capable of handling large amounts of data.

##  Advanced (Project Based)

- How does subscription flow work?
- How do you link User and SkillPack?
- Why do we use Service layer?
- How does JSP get data from Controller?

- Answer 1: The subscription flow begins when a user selects a plan and initiates a payment on the front end. The request hits the Controller, which calls the Service layer to create a pending subscription record in the database and securely communicate with a payment gateway API. Once the payment gateway successfully processes the transaction, it sends a webhook or response back to the application controller, prompting the Service layer to update the subscription status to active, calculate expiration dates, and unlock the restricted features for that user's account.

Answer 2: Linking a User and a SkillPack typically involves defining a database relationship based on business requirements, usually a Many-to-Many relationship since a user can subscribe to multiple skill packs and a skill pack can belong to multiple users. In Spring Data JPA, this is achieved by using the @ManyToMany annotation in the User and SkillPack entity classes, along with a @JoinTable annotation to define a separate junction table in the database that maps user identifiers to skill pack identifiers.

Answer 3: We use a Service layer to enforce the separation of concerns and maintain clean architectural boundaries within an application. Without it, business logic would leak into Controllers or Repositories, making the code messy, rigid, and difficult to maintain. The Service layer provides a centralized place to orchestrate multiple repository calls, handle complex data transformations, manage database transactions via annotations like @Transactional, and ensure that business rules can be reused across different controllers or API endpoints.

Answer 4: A JSP page gets data from a Controller through the use of an implicit request scope model object provided by the framework. When a user sends a request, the Controller processes it, attaches the required data to a Model, ModelMap, or HttpServletRequest object using key-value pairs, and returns the logical name of the JSP view. The framework's view resolver then forwards the request to the specific JSP file, where the data is extracted and dynamically rendered on the webpage using Expression Language syntax or JSTL tags.
