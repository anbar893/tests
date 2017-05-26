  *** Test Cases ***
Division Test - Positive
    [Tags]    positive

    ${first number}=     Set Variable  ${3}
    ${second number}=    Set Variable  ${2}
    ${result}=           Divide Values    ${first number}    ${second number}
    Should Be Equal    ${result}    ${1.5}

Division Test - Negative
    [Tags]    negative

    ${first number}=     Set Variable  ${10}
    ${second number}=    Set Variable  ${0}
    ${passed}=    Run Keyword And Return Status    Divide Values    ${first number}    ${second number}
    Run Keyword If    ${passed}    Fail    Division by zero does not work correctly.

*** Keywords ***
Divide Values
    [Arguments]        ${first number}    ${second number}
    [Documentation]    Divides two numbers.

    Run Keyword If       ${second number}==0    Fail    Division by zero!
    ${second number}=    Convert To Number    ${second number}
    ${result}=           Evaluate  ${first number}/${second number}
    Return From Keyword    ${result}
