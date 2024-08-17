*** Settings ***
Library           RequestsLibrary
Library           Collections

*** Variables ***
${BaseURL}    https://reqres.in/api
${Endpoint}    /users



*** Test Cases ***
Customer Register
    Create Session    Customer Register    ${BaseURL} 
    ${Body}=    Create Dictionary    name=Irfan    job=Tester
    ${header}=    Create Dictionary    Content-Type=application/json
    ${response}=    POST On Session    Customer Register    ${Endpoint}    json=${Body}    headers=${header}
    Log   ${response.status_code}
    Log   ${response.content}        
    
    # VALIDATIONS
    ${ResponseStatusCode}    Convert To String    ${response.status_code}
    Should Contain    ${ResponseStatusCode}    201    
    ${ResponseBody}=    Convert To String    ${response.content}
    Should Contain    ${ResponseBody}    Irfan
    Should Contain    ${ResponseBody}    Tester         
   