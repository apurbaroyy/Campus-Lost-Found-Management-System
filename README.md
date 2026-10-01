# Campus Lost & Found Management System

## Project Overview

Campus Lost & Found Management System is a web-based application designed to help students report lost and found items within a campus environment. Users can post lost or found items, search available items, view item details, and submit claim requests.

## Objectives

- To provide an online platform for reporting lost and found items.
- To help users search for lost or found belongings.
- To allow users to submit claim requests.
- To provide an admin panel for managing users, items, and claims.
- To store project information in a MySQL database.

## Key Features

### User Features
- User Registration
- User Login and Logout
- User Dashboard
- Post Lost Item
- Post Found Item
- Search and Filter Items
- View Item Details
- Submit Claim Request
- Manage My Posts
- Update User Profile

### Admin Features
- Admin Dashboard
- Manage Users
- Manage Items
- Manage Claims
- Approve or Reject Claims

## User Roles

### User
Users can register, log in, post lost/found items, search items, and submit claim requests.

### Admin
Administrators can monitor users, items, and claim requests through the admin panel.

## Technologies Used

- HTML
- CSS
- JavaScript
- PHP
- MySQL
- XAMPP
- GitHub
- Visual Studio Code

## Database

Database Name:

`lost_found_db`

Main tables:

- users
- items
- claims

## Project Structure

```text
Campus_Lost_Found_Project/
├── admin/
├── config/
├── css/
├── js/
├── index.php
├── login.php
├── register.php
├── dashboard.php
├── lost-item.php
├── found-item.php
├── items.php
├── item-details.php
├── my-posts.php
├── profile.php
├── logout.php
├── header.php
├── footer.php
└── lost_found_db.sql
Installation and Setup
Install XAMPP.
Start Apache and MySQL from XAMPP Control Panel.
Copy the project folder into:
C:\xampp\htdocs\
Create a MySQL database named:
lost_found_db
Import lost_found_db.sql using phpMyAdmin.
Open the project in a browser:
http://localhost/Campus_Lost_Found_Project/
Future Improvements
Email notifications for claim requests.
Image preview and improved image management.
Automatic item status update after successful claims.
Advanced search and filtering.
Mobile application integration.
Conclusion

The Campus Lost & Found Management System provides a centralized platform for managing lost and found items in a campus environment. It combines a user-friendly front-end with PHP backend processing and MySQL database management.