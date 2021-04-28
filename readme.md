# This application is about a photographer ESHOP
	
 Two main roles has been added into the application USER_ROLE, and USER_ADMIN.
 There are three main categories of the products seperated by the names of Landscape, Animals, or People.
 Filters has been added to help you out see the products in different order and choose based on,
 lower price, Higher price , or even ascending or descending name.
 
 You can register with your account details and make an order,
 choosing any products you like and completing an order while selecting one of the two payment methods that has been implemented,
 cash where it generates a specific number for you that you can hold and show in the shop,
 or paypal where you can give your paypal account information and complete your order.
 
 As a user there is a specific menu in which there are options of changing the following:
 a)account details, via a form editing the information of the account
 b)account history, via a table see which products have bought and generating the option to download them if you want
 
 As an admin theres a specific tab in which you can click and see the following:
 View products       , table that shows the products in ascending order (id)
 Add & Edit product  , form that allows to edit a product or add a new product and upload an image of it
 View orders         , table that shows the completed orders 
 View orderDetails   , table that shows the order details of each order
 View users          , table that shows the users that have been registered into the application with the option to edit each user
 View admins         , table that shows the admins that have been registered into the application with the option to edit each admin
 Add & Edit account  , form that allows to edit an account or add a new account
 














Steps to run the application properly!

1) Git pull from github repository
2) Open mysql and run the GroupProjectFinal.sql file that is included with the project
3) Go to (application properties) and change the following:
	spring.datasource.username= your username to log into your DB
	spring.datasource.password= your password to log into your DB
4) Go to (ProductServiceImpl.java) and change the following method's:
	a)saveImage()  : the folder path as where you want to upload the images when uploading an image from the application
	b)uploadImage(): the folder path as where you want to save the images when downloading an image from the application
	



Paypal
	card number : 4020020322134350
	card 3digits: 323
	card date   : 04/26
	Email id    : sb-ykyq85782966@personal.example.com
	Password    : Eo?6jcb]
	
Admin
	username    : user
	password	: 1234	
