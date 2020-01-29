*** Settings ***
Library    			SSHLibrary
Suite Setup    		open_connection_and_login
Suite Teardown   	Close All Connections

*** Variables ***
${HOST}				localhost
${USERNAME}			than
${PASSWORD}			wsxxsw
${VAR}				hello there!
${PATH}				


*** Test Cases ***
Execute Command And Verify Output
	Check for file 		${PATH}
    [Documentation]    Often getting the return code of the command is enough.
    Log 	${VAR}
    

*** Keywords ***
open_connection_and_login
   	Open Connection     	${HOST}
   	Login               	${USERNAME}        ${PASSWORD}
Check for file    
    [Arguments]    ${PATH}
    File Should Exist    /home/than/test_file_pattern_ssh/Test.robot
