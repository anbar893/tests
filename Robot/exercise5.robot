*** Settings ***
Library           RequestsLibrary
Library           Collections

*** Variables ***
${SESSION ALIAS}   wsb.pl
${ROOT}            http://wsb4it.getsandbox.com

*** Test Cases ***
HTTP Request test
    Create Session    ${SESSION ALIAS}    ${ROOT}
    ${response}=    Get Request    ${SESSION ALIAS}  /users
    ${json}=  To Json    ${response.content}
    Should Be Equal As Integers    ${response.status_code}    ${200}
    Dictionary Should Contain Key    ${json}    ids
