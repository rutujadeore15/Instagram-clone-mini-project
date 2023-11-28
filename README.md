# Instagram-clone-mini-project
To create an Instagram clone dataset on GitHub, you can: 
           Start MySQL Server Start MySQL Workbench Open File Select Open SQL Script Open use.sql Execute it
   Create queries with File Select New Query Tab Select SELECT * FROM users

Instagram Clone Database
           Welcome to the Instagram Clone Database project! This repository contains the SQL database schema and 
   sample data for an Instagram clone, allowing you to replicate some of the core functionality of the popular 
   social mediaplatform.

Table of Contents
Database Structure
Getting Started
Schema Overview

Database Structure
                            The Instagram Clone Database is designed using SQL and consists of multiple tables to store user information, photos, likes, comments, hashtags, and more. Below are the main tables in the schema:

users: Stores user profiles, including usernames, emails, and other user-related data.

photos: Contains photo records, including URLs, creation timestamps, and references to user IDs.

likes: Records likes given by users to specific photos.

comments: Stores user comments on photos, associated with both users and photos.

hashtags: Manages hashtags used in photo captions and comments, linked to relevant photos.

Getting Started
To set up and use the Instagram Clone Database on your local system, follow these steps:

                  Create a new SQL database using your preferred database management system (e.g., MySQL, PostgreSQL).
           Import the SQL file instagram_clone_db.sql into your database to create the necessary tables and sample data.

Tasks performed:

          
          1.Average User Posts: Calculate the average number of posts per user in the database.
          
          2.Top 5 Hashtags: Found the top 5 most used hashtags in posts and comments.
          
          3.Likes on Every Photo: Identified users who liked every photo on the site.
          
          4.User Account Rank: Retrieved a list of users, their usernames, and ranked them by account creation date.
          
          5.Comments on Photos: Listed comments on photos with text, photo URLs, user usernames, and comment counts.
          
          6.Tag Popularity: Displayed tag names and the number of associated photos, ranked by popularity.
          
          7.User Photo Ranking: Listed user usernames along with the count of photos they posted, ranked by the number of photos.
          
          8.User Photo History: Showed user usernames with their first and next posted photo dates.
          
          9.Comments and Previous Comment: Displayed comment text, commenter usernames, and previous comment text on the same photo.
          
          10.User Photo Counts: Showed user usernames with the number of photos they posted and those posted by users before and after 
           them, based on creation dates.
