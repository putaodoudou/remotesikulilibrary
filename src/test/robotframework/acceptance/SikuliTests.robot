*** Settings ***
Resource    common.robot
Suite Setup    Set Test Image Directory    .${/}src${/}test${/}resources${/}testImages    

*** Test Cases ***
Capture screenshot locally
    Enable Debugging
    Capture Screenshot
	
Test image wait locally
	[Teardown]    Log results and kill process
    Enable OCR
	Start test application
	Wait Until Screen Contains    buttons.png
	
Test image click locally
    [Teardown]    Log results and kill process
    Start test application
	Wait Until Screen Contains    buttons.png
	Click Item    ok_button.png
	Wait Until Screen Contains    ok_clicked.png
	
Local input of text 
    [Teardown]    Log results and kill process
    Start test application
	Wait Until Screen Contains    buttons.png
	Input Text    Test text    empty_text_field.png

Local call should be made if server connection is closed
    Enable Debugging
    ${port}    Start Remote Server
    Initialize Connection    http://127.0.0.1:${port}/
    Stop Remote Server
    Capture Screenshot
	
	
Test image wait remotely
	[Teardown]    Log results and kill process
	Start test server
    Initialize Connection    http://127.0.0.1:62022/
	Start test application
	Wait Until Screen Contains    buttons.png

Test image click at other remote server
    [Teardown]    Log results and kill process
    Start test server
    Initialize Connection    http://127.0.0.1:62022/
	Start test application
	Wait Until Screen Contains    buttons.png
	Click Item    ok_button.png
	Wait Until Screen Contains    ok_clicked.png
	
Remote input of text 
    [Teardown]    Log results and kill process
    Start test server
    Initialize Connection    http://127.0.0.1:62022/
	Start test application
	Wait Until Screen Contains    buttons.png
	Input Text    Test text    empty_text_field.png
	
Test remote screenshot capture to other remote server
    [Teardown]    Log results and kill process
    Start test server
    Enable Debugging
    Initialize Connection    http://127.0.0.1:62022/
	Enable Debugging
    Capture Screenshot
