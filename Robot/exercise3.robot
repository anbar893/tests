*** Test Cases ***
Sum test - positive numbers
    ${first number}=     Set Variable  ${1}
    ${second number}=    Set Variable  ${4}
    ${result}=           Sum Values    ${first number}    ${second number}
    Should Be Equal      ${result}    ${5}

Sum test - negative numbers
    ${first number}=     Set Variable  ${1}
    ${second number}=    Set Variable  ${-4}
    ${result}=           Sum Values    ${first number}    ${second number}
    Should Be Equal      ${result}    ${-3}

Sum test - Zero
    ${first number}=     Set Variable  ${1}
    ${second number}=    Set Variable  ${0}
    ${result}=           Sum Values    ${first number}    ${second number}
    Should Be Equal      ${result}    ${1}

Substraction test
    ${first number}=     Set Variable  ${10}
    ${second number}=    Set Variable  ${5}
    ${result}=           Subtract From Value    ${first number}    ${second number}
    Should Be Equal      ${result}    ${5}

Division test - positive numbers
    ${first number}=     Set Variable  ${9}
    ${second number}=    Set Variable  ${3}
    ${result}=           Divide Values    ${first number}    ${second number}
    Should Be Equal      ${result}    ${3}

Division test - negative numbers
    ${first number}=     Set Variable  ${-9}
    ${second number}=    Set Variable  ${3}
    ${result}=           Divide Values    ${first number}    ${second number}
    Should Be Equal      ${result}    ${-3}

Division test - Zero
    ${first number}=     Set Variable  ${10}
    ${second number}=    Set Variable  ${0}
    ${passed}=    Run Keyword And Return Status    Divide Values    ${first number}    ${second number}
    Run Keyword If    ${passed}    Fail    Division by zero does not work correcty.

Division test - Fraction
    [Tags]    negative

    ${first number}=     Set Variable  ${3}
    ${second number}=    Set Variable  ${1.5}
    ${passed}=    Run Keyword And Return Status    Divide Values    ${first number}    ${second number}
    Run Keyword If    ${passed}    Fail    Division by fraciton value does not work correctly.

Average Number Test - Positive Values
    @{list of numbers}=    Create List    ${7}    ${7}
    ${average value}=      Return Average Value  @{list of numbers}
    Should Be Equal        ${7}    ${average value}

Average Number Test - Negative Values
    @{list of numbers}=    Create List    ${-3}    ${-3}
    ${average value}=      Return Average Value  @{list of numbers}
    Should Be Equal        ${-3}    ${average value}

Average Number Test - Fraction Values
    [Tags]    negative

    @{list of numbers}=    Create List    ${0.5}    ${0.5}    ${0.5}
    ${passed}=    Run Keyword And Return Status    Return Average Value  @{list of numbers}
    Run Keyword If    ${passed}    Fail     Average value from fraciton values does not work correctly.

Average Number Test - Zero Values
    @{list of numbers}=    Create List    ${0}  ${0}
    ${average value}=      Return Average Value  @{list of numbers}
    Should Be Equal        ${0}    ${average value}



*** Keywords ***
Sum Values
    [Arguments]        ${first number}    ${second number}
    [Documentation]    Sums two values.

    ${result}=    Evaluate  ${first number}+${second number}
    Return From Keyword    ${result}

Subtract From Value
    [Arguments]        ${first number}    ${second number}
    [Documentation]    Subtracts value from another value.

    ${result}=    Evaluate  ${first number}-${second number}
    Return From Keyword    ${result}

Divide Values
    [Arguments]        ${first number}    ${second number}
    [Documentation]    Divides two numbers.

    ${first number float}    Evaluate    isinstance(${first number}, float)
    Run Keyword If    ${first number float}    Fail    Int number required.
    ${second number float}    Evaluate    isinstance(${second number}, float)
    Run Keyword If    ${second number float}    Fail    Int number required.

    Run Keyword If       ${second number}==0    Fail    Division by zero!
    ${result}=           Evaluate  ${first number}/${second number}
    Return From Keyword    ${result}

Return Average Value
    [Arguments]        @{list of values}
    [Documentation]    Retruns an average value from a list of numbers.

    ${sum}=                 Set Variable    ${0}
    ${amount of values}=    Get Length      ${list of values}

    :FOR    ${value}    IN    @{list of values}
    \  ${value float}    Evaluate    isinstance(${value}, float)
    \  Run Keyword If    ${value float}    Fail    Int number required.
    \  ${sum}=    Set Variable    ${${sum}+${value}}

    ${avgerage value}=    Evaluate    ${sum}/${amount of values}
    Return From Keyword    ${avgerage value}
