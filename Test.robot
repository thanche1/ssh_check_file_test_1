*** Settings ***
Library    			SSHLibrary
Library 			OperatingSystem
Suite Setup    		open_connection_and_login
Suite Teardown   	Close All Connections




*** Variables ***

${HOST}				localhost
${USERNAME}			than
${PASSWORD}			wsxxsw
${VAR}				hello there!
${PATH}				/home/than/robot_tests/ls/Test.robot





*** Test Cases ***
Execute Command And Verify Output
	Check for file 		${PATH}
Second test check if exists
	Get this file 		${PATH}
Third test get if exists
	Get size of file 	${PATH}
Fourth test check Connectivity
	Internet Connectivity Ping Test
Fifth test check ip addr
	Ip addr show

	


    

*** Keywords ***
open_connection_and_login
   	Open Connection     	${HOST}
   	Login               	${USERNAME}        ${PASSWORD}
Check for file    
	[Documentation]		Checks for a file at specific dir
    [Arguments]    		${PATH}
    File Should Exist   ${PATH}
Get this file
	[Documentation] 	Gets files content and stores it localy
	[Arguments]    		${PATH}
    Get File 			${PATH} 	output.txt		encoding_errors=strict
Get size of file
	[Documentation]		Gets files size
	[Arguments] 		${PATH}
	Get File Size 		${PATH}
Internet Connectivity Ping Test
	[Documentation]		Ping Test to 127.0.0.1
	${result}=			Execute Command 	ping 127.0.0.1 -c 2 	
	Should Contain 		${result}			64 bytes from 127.0.0.1
	Create File 		/home/than/robot_tests/ls/ping_results.txt		${result}
Ip addr show
	[Documentation]		Runs command to check ip addr
	${x}=				Execute Command 	ip addr show
	Create File 		/home/than/robot_tests/ls/ip_results.txt		${x}		




