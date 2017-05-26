*** Test Cases ***
Average Number Test
    @{list of numbers}=    Create List    ${7}    ${-23}    ${-5}    ${3}    ${4}
    ${average value}=      Return Average Value  @{list of numbers}
    Should Be Equal        ${-2.8}    ${average value}

Maximum And Minimum Value
    ${first number}=   Set Variable    ${1}
    ${second number}=  Set Variable    ${11}
    ${minimum value}  ${maximum value}  Return Maximum And Minimum Value    ${first number}    ${second number}
    Should Be Equal    ${first number}     ${minimum value}
    Should Be Equal    ${second number}    ${maximum value}

*** Keywords ***
Return Average Value
    [Arguments]        @{list of values}
    [Documentation]    Retruns an average value from a list of numbers.

    ${sum}=                 Set Variable    ${0}
    ${amount of values}=    Get Length      ${list of values}

    :FOR    ${value}    IN    @{list of values}
    \  ${sum}=    Set Variable    ${${sum}+${value}}

    ${average value}=    Evaluate    float(${sum})/${amount of values}
    Return From Keyword    ${average value}

Return Maximum And Minimum Value
    [Arguments]        ${first value}    ${second value}
    [Documentation]    Return the minimum number and the maximum value from two scalar variables.

    Run Keyword If       ${first value}==${second value}    Fail  Values are equal.
    ${maximum value}=    Set Variable If    ${first value}>${second value}    ${first value}    ${second value}
    ${minimum value}=    Set Variable If    ${first value}<${second value}    ${first value}    ${second value}

    Return From Keyword    ${minimum value}  ${maximum value}
