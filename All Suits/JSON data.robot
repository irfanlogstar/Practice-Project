*** Settings ***
Library    JSONLibrary
Library    OperatingSystem
Library    Collections

*** Variables ***


*** Test Cases ***
TC002
    ${JSONDATA}    Load Json From File        C:/Users/iin001.ENVECON/Downloads/new 1.json 
    ${ID}    Get Value From Json    ${JSONDATA}       $.data.id     
    ${Emabil}    Get Value From Json     ${JSONDATA}    $.data.email
    ${URL}    Get Value From Json     ${JSONDATA}    $.support.url
    
    ${GetId}    Get From List    ${ID}    0
    Should Be Equal As Numbers     ${GetId}        2  
    Should Contain         ${Emabil}      janet.weaver@reqres.in 
    Should Contain    ${URL}    https://reqres.in/#support-heading           