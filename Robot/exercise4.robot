*** Settings ***
Library    SSHLibrary
Library    OperatingSystem

*** Variables ***
${HOST}                46.101.195.218
${USER NAME}           studentwsb
${PASSWORD}            lubieStudia@#
${EXPECTED MESSAGE}    Welcome to Ubuntu 16.04.2 LTS

*** Test Cases ***
SSH Connection test
    Open Connection        ${HOST}
    ${message}=            Login    ${USER NAME}    ${PASSWORD}
    Should Contain         ${message}    ${EXPECTED MESSAGE}
    SSHLibrary.Get File    sprawdz_ten_plik    file_content.txt
    ${file content}        OperatingSystem.Get File    file_content.txt
    Should Contain         ${file content}    Lubie testowac
