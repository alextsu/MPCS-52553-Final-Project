# MPCS-52553-Final-Project

Web Development 
Spring 2015
UChicago

Partner: Matthias Meier, https://github.com/mattmeier

Feature Choice: Forgot Password Email 

Please note: 
1) At present the current iteration of this web app is unable to send an actual email. However, when the user submits a request to reset password, the web app generates the email in plain text and displays it in the server log as I've demonstrated below this paragrah. The link within the email text contains the proper URL to reset the password. 

2) We have full RESTful capabilities enabled with Users and Events. We've elected to remove editing and deleting functionality for Locations and Universities intentionally, as we don't believe users should have that ability. 

3) Much of the email-to-password-reset functionality was referenced from a 3rd party source. I've demarked all files in the application that utilize code from this source. This source, RailsCast, provided example code on how to integrate authentication and email features into existing apps. "#274 Remember Me & Reset Password." RailsCasts. N.p., 11 July 2011. Web. 30 May 2015. <http://railscasts.com/episodes/274-remember-me-reset-password>.

Rendered user_mailer/password_reset.text.erb within layouts/mailer (0.6ms)

UserMailer#password_reset: processed outbound mail in 226.2ms

Sent mail to alexander.tsu.14@dartmouth.edu (69.5ms)
Date: Mon, 01 Jun 2015 22:02:30 -0500
From: atsu@uchicago.edu
To: alexander.tsu.14@dartmouth.edu
Message-ID: <556d1cc6e2a03_13783ff0c41f5b188076a@Alexanders-MacBook-Pro.local.mail>
Subject: Password Reset
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit

To reset your password, click the URL below.

http://localhost:3000/password_resets/F3QQlvpDNBxEjDy9ZWbeuA/edit

If you did not request your password to be reset, please ignore this email and your password will stay the same.
Redirected to http://localhost:3000/
Completed 302 Found in 342ms (ActiveRecord: 3.3ms)
