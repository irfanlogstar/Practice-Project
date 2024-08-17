*** Settings ***
Library           RequestsLibrary
Library           Collections 


*** Variables ***
${BaseURL}    https://reqres.in/api
${Endpoint}    users/2

*** Keywords ***
# Convert To JSON
    # [Arguments]    ${response_text}
    # ${json}=    Evaluate    ${response_text}    # Directly use the response text if it's already a JSON string
    # [Return]    ${json}

*** Test Cases ***

TC001 Get Customer Details
    Create Session    mysession    ${BASE_URL}
    ${response}=    GET On Session    mysession    ${Endpoint}    
    Status Should Be    200
    ${json}=    Evaluate    ${response.text}
    Log    ${json}
    ${id}=    Get From Dictionary    ${json['data']}    id
    Log    ${id}
    Should Be Equal As Strings    ${id}    2   
    ${Email}     Get From Dictionary         ${json['data']}     email
    Log    ${Email}   
    Should Be Equal As Strings    ${Email}     janet.weaver@reqres.in  
    ${first_name}     Get From Dictionary    ${json['data']}        first_name  
    Log    ${first_name}
    Should Be Equal As Strings    ${first_name}    Janet
    ${last_name}    Get From Dictionary    ${json['data']}    last_name
    Log    ${last_name}
    Should Be Equal As Strings    ${last_name}    Weaver
    ${avatar}     Get From Dictionary    ${json['data']}    avatar
    Log    ${avatar}    
    Should Be Equal As Strings    ${avatar}    https://reqres.in/img/faces/2-image.jpg    
        
        
     
    
