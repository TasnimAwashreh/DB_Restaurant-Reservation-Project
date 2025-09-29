# DB_Restaurant-Reservation-Project

<p> Welcome to the Restaurant Reservation Project! </p>
<p> This project allows users to view, manage, reserve tables, and order from the restaurant's menu. The project contains numbered directories to help navigate through.</p>


## This project contains the following:

<ol>
 <li> <b> RestaurantReservationManagementSystemERD </b>: The ERD </li>
 <li> <b> 1_CreateTables </b>: Contains the database schema. The following tables have been created:
  <ul> 
   <li> Restaurants: stores each restaurant's information.</li>
   <li> Reservations: links customers to tables at specific dates. </li>
   <li> Orders: Orders made in reservations, handled by employees. </li>
   <li> OrderItems: Items that have been ordered. </li>
   <li> MenuItems: Available items for each restaurant. </li>
   <li> Employees: List of employees currently working in these restaurants </li>
   <li> Customers: Users that order food and reserve tables </li>
   <li> Tables: Seating areas that customers can reserve </li>
  </ul>
 </li>

 <li> <b> 2_Triggers </b>: Contains the triggers for calculated columns:
  <ul>
   <li> <b> 2_UpdateTotalAmountTrigger </b>: Updates the TotalAmount column when an order has been added </li>
  </ul>
 </li>

 <li> 
  <b> 3_GenerateSeed </b> : Contains the seed data for each table. The seed data currently contains:
  <ul>
    <li>50 Restaurants</li>
    <li>1000 Menu Items</li>
    <li>1500 Order Items</li>
    <li>500 Orders</li>
    <li>100 Employees</li>
    <li>500 Reservations</li>
    <li>400 Customers</li>
    <li>100 Tables Records</li>
  </ul>
 </li>

  <li> 
  <b> 4_Queries </b>: Contains the simple queries:
  <ul>
    <li> <b>1_RetrieveReservationsByCustomerId</b> : A simple select that gets reservations from dbo.Reservations depending on the customer Id</li>
    <li><b> 2_RetrieveManagers </b>: Returns all employees with the Manager position from dbo.Employee </li>
    <li><b> 3_ListOrdersAndMenuNames </b>: Gets all menu items under a specific reservation by using Orders and its relationship with OrderItems + OrderItems and its relationship with MenuItems to join them and return the menuitems with its OrderId</li>
    <li><b> 4_ListsMenuItemsByReservationId </b>: Gets all menu items under a specific reservation by using Orders and its relationship with OrderItems + OrderItems and its relationship with MenuItems to join them and return the menuitems with its reservation id</li>
    <li><b> 5_GetAvgAmountByEmployee </b>: Gets the average amount of money per order a certain employee makes by joining OrderItems and MenuItems to get the quantity and price in those tables and then returning the average</li>
    <li><b> 6_RetrieveReservationReportWithViews </b>: Returns reservation details with the restaurant details according to a certain reservation id, which you can get by joining reservations and restaurants</li>
    <li><b> 7_ViewListEmployeeInfoWithRestaurantInfo </b>: Returns all employees with their info and info about the restaurant they work in </li>
    <li><b> 8_ReturnReservationOrdersHigherThan2 </b>: Counts all orders per reservation, and returns reservations with more than two orders</li>
    <li><b> 9_ReservationFrequencyPerRestaurant </b>: Returns the frequency of reservations per day and displays the restaurants with the highest frequencies at the top</li>
  </ul>
 </li>

  <li> 
  <b> 5_Procedures </b> : Contains the more complex queries:
  <ul>
    <li><b> 1_PopularMenuItemAnalysis </b>: Getting the popular menu item for each restaurant or a certain month by first getting all orders of that month and then counting the quantity of each menu item ordered. Then by partitioning and ranking each row by the highest amount, we can select each restaurant's number one</li>
    <li><b> 2_CalculateRestaurantRevenue </b>: Returns the sum of the total amount/price of orders of a certain restaurant</li>
    <li><b> 3_CalculateEmployeeSalary </b>: Returns the total employee salary by getting the sum of the total amount from orders taken by the employee, then multiplying by the employee's posititon </li>
    <li><b> 4_BorrowedBooksReport </b>: Returns a report containing tables that have been reserved between two dates, by joining Reservations and Tables to get the tables reserved according to reservation date, and then joining Restaurants to get the restaurant's info for each reservation/table </li>
    <li><b> 5_AddNewOrder </b>: Checks whether the employee and reservation exists before inserting a new order</li>
    <li><b> 6_SQLStoredProcedureWithTempTable </b>: A stored procedure that retrieves all tables with reservations scheduled after a certain date by using a temporary table to store tables and restaurants that are linked to those reservations, then joining the temp table with restaurants to get restaurant details + table id/li>
    <li><b> 7_TriggerImplimentation </b>: Inserts a log row every time a reservation is altered</li>
    <li><b> 9_Indexing </b>: Contain all indexes used in the database</li>
  </ul>
 </li>

 <li><b> 8_QueryPlansBefore </b>: Contains the query plans before adding the indexes
 <li><b> 10_QueryPlansAfter </b>: Contains the query plans after adding the indexes

</ol>
