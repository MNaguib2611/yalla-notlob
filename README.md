# Yalla Notlob - Ordering System

<p align="center">
<img src="logo.png" alt="Build Status">
</p>

It is a Web Application for automating the ordering process between friends.

# Installation

1. Install Ruby version 2.6.3
2. Install Rails version 6.0.2.2
3. Install MySQL Database Engine
4. Create an empty database called **yalla_notlob**
5. Edit database.yml and set ``username`` , `` password`` and `` host`` of your database engine. This will allow us to run the migrations.
6. Run the Following command to install the dependencies of the project 
```bash
	bundle install
```
7. Run the Following command to migrate the database tables
```bash
	rails db:migarte
```

## Usage

Run the following command to launch the app 
```bash
 rails server
```

## User Features

1. Signup
2. Login with Facebook or Google
3. Add Friends
4. Create Orders and Invite Friends to them
5. Add Items to Orders either Created by you or You have joined
6. Create Groups and Add Friends to them
7. Get Notifications about Invitations to Orders or when a friend Accepts/Rejects your Invitation
8. In the homepage, you can view your Recent Active Orders and Your Friends' orders you are joining


## Authors

* **Ahmed Adel** - [AhmedAdelFahim](https://github.com/AhmedAdelFahim)
* **Basma Mohammed** - [basmmohamed](https://github.com/basmmohamed)
* **Ebtsam Ali** - [ebtsamali](https://github.com/ebtsamali)
* **Mohammed Naguib** - [MNaguib2611](https://github.com/MNaguib2611)
* **Rehab Ayman** - [rehabayman](https://github.com/rehabayman)
