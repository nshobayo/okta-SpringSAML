# Introduction 

This guide describes how to use Spring Security SAML to add support for Okta (via SAML) to Java applications that use the Spring framework.

In this guide, you will learn how to install and configure an Okta SAML application 

This guide assumes that you are familiar with the basics of Java software development: editing text files, using the command line, and running Tomcat, Maven or Gradle.

If you’re already familiar with Okta and Spring, you can skip to the section titled “Configuring Spring Security SAML to work with Okta”.


# Requirement 

Please make sure the following are installed before starting installation:

[Java 1.6+ SDK](http://www.oracle.com/technetwork/java/javase/overview/index.html)

[Apache Maven](https://maven.apache.org/download.cgi)
# Installation Setup

This section covers what you need to do to install and configure Tomcat from scratch on Mac OS X. If you already have Tomcat on your system, you can skip to Step 2 below.

How to install the Spring Security SAML sample Okta application on Mac OS X:

1. **Installing Tomcat** 
	- If it’s not already installed, install Tomcat with Homebrew using these directions: http://blog.bolshchikov.net/post/50277857673/installing-tomcat-on-macos-with-homebrew


2. **Downloading the Spring SAML Extension**
	
	- Download the extension from  https://github.com/spring-projects/spring-security-saml

	- Use 'git clone' to clone the repository locally
	

3. **Downloading sample application**
	
	- Use 'git clone' to clone the repository locally
	
	- Use the command below to copy the sample Okta application into the Extension's "sample" folder
	- Where oktaAppTarget is the location of the Okta app downloaded in step 2 and extensionTarget is the location of Spring SAML Extension folder  
	
	```shell
	rm -rf extentionTarget/sample/src/main
	cp oktaAppTarget/src extentionTarget/sample
	```
	
4. **Configuring Spring Security SAML to work with Okta**

	- Follow the directions under the "Configuring Spring Security SAML to work with Okta" at
	: http://developer.okta.com/docs/guides/spring_security_saml.html#configuring-spring-security-SAML-to-work-with-okta 

	- The securityContext.xml file can be found at /webapp/securityContext.xml


5. **Compilation**
	
	- Make sure your working directory is the "sample" subdirectory of the "spring-security-SAML" directory 
	
	- To compile 

	```shell
	../gradlew build install
	``` 

	- Your compiled war archive file, spring-security-SAML2-sample.war, can be found in directory sample/build/libs/


6. **Deployment**
	
	- Use the command below to copy the compiled spring-security-SAML2-sample.war file to the Tomcat directory you set up in step one
	
	```shell
	cp target/spring-security-SAML2-sample.war /Library/Tomcat/webapps/
	```


7. **Starting Tomcat**
	
	- Use the command below to start Tomcat
	
	```shell	
	/Library/Tomcat/bin/startup.sh
	```

	
8. **Starting Application**
	- Load the Spring SAML application by opening the URL: http://localhost:8080/spring-security-SAML2-sample
	Here's what it should look like:

	![img](./docs/sample.png "A screenshot of working app running")


# Configuring Okta to work with Spring Security SAML

1.	Follow the directions under the "Configuring Okta to work with Spring Security SAML" at
	: http://developer.okta.com/docs/guides/spring_security_saml.html#configuring-okta-to-work-with-spring-security-SAML

	- ** STEP 7.a ** Attributes to be sent in the SAML assertion can be added under "Attribute Statements" during this step if desired. 


 
#Testing 



