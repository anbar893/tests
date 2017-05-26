*** Settings ***
Library           RequestsLibrary

*** Variables ***
${SESSION ALIAS}   wsb.pl
${ROOT}            http://wsb4it.getsandbox.com

*** Test Cases ***
HTTP Request test
    Create Session    ${SESSION ALIAS}    ${ROOT}
    ################################################
    ${headers}  Create Dictionary    signature=
    ${response}    Get Request    ${SERVICE_NAME}    /hello
    Log To Console    \n${response.text}
    Log To Console    \n${response.status_code}
    Should be equal as strings    ${response.status_code}    ${200}
    ${response}    Get Request    ${SERVICE_NAME}    /users
    Log To Console    \n${response.content}
    Log To Console    \n${response.status_code}
    Should be equal as strings ${response.status_code} ${200}
