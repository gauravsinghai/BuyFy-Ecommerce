# Pre requisites
- JDK8
- Java Hibernate
- Oracle DB
- Tomcat v9
- Pdf jars
- Mailing jars
- Gson jars
- Jstl jars
- PAYTM jars
- File Upload jars


# Installation

Clone this repository and build the examples using:
- Open Git Bash terminal and paste below code
```cmd
git clone git@github.com:akshatsingh1718/BuyFy.git
```
- Project will be cloned into your current working directory of your Git Bash
- Once The project has been cloned to your local machine then open your prefered IDE for java( Eclipse, intellij or netbeans ).
- After opening your IDE open your cloned project into your worksapce.
- Change your preference to Java EE for Java Web Projects.
- Click on Servers tab and add apache tomcat v9.
- Open Oracle SQL Plus cmd prompt and Copy all the data from sql file from extras\oracle and paste it in cmd prompt.
- Open hibernate.cfg.xml from src and change username and password to your details of Oracle DB in which user you paste your sql file data.
```xml
<property name="connection.username">system</property>
<property name="connection.password">root</property>
```
- Open PaytmConstants.java from src\com\BuyFy\paytm and enter your merchant id and merchant key for using PAYTM checkout gateway.
```java
package com.buyfy.paytm;

public class PaytmConstants {
	public final static String MID = "xxxxxxxxxxxx";
	public final static String MERCHANT_KEY = "xxxxxxxxxxxxxx";
	public final static String INDUSTRY_TYPE_ID = "Retail";
	public final static String CHANNEL_ID = "WEB";
	public final static String WEBSITE = "WEBSTAGING"; // WebStaging for testing purposes
	public final static String PAYTM_URL = "https://securegw-stage.paytm.in/theia/processTransaction";
}
```
- Open pgRedirect.jsp from WebContent and enter yout mobile no, email and callback url in which PAYTM we send back response. For now callback url is localhost but in case if you want to host this project then change callback url to your website url ( http://www.example.com/PaytmResposeServ" )
```jsp
parameters.put("MOBILE_NO","xxxxxxxxxx");
parameters.put("EMAIL","example@domain.com");
parameters.put("CALLBACK_URL", "http://localhost:8080/BuyFy/PaytmResponseServ");
```
- Now run the project and select run on server and enjoy with your E commerce website.
