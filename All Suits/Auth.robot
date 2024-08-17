*** Settings ***
Library    JSONLibrary
Library    OperatingSystem
Library    Collections
Library    RequestsLibrary

*** Variables ***
# GetVoucherDetails
${BaseURL}    http://13.95.199.223:81
${Endpoint}    /Billing/Open/GetVoucher

${InvoiceType}    Invoice
${CustomerName}    ROYAL WELDING WIRES PVT LTD
${InvoiceNumber}    F2023PIAEXP00061
${InvoiceDate}    2024-08-12
${InvoiceValidityDate}    2024-08-17
${DateFormat}    yyyy-MM-dd HH:mm:ss
${InvoiceAmount}    2500.0000
${BLNumberInvoiced}    3000000
${ResponseMessage}    SUCCESS
${ResponseCode}    200

# SettmentResponseDetails
${BaseURLS}    http://13.95.199.223:81
${EndPointS}   /Billing/Open/Voucher
${Id}    1
${Content}    Success
${SResponseMessage}    SUCCESS
${SResponseCode}    200  

*** Test Cases ***
TC001
   [Documentation]    Validate that the API returns the correct invoice details, 
    ...                specifically checking if the Invoice details matches the expected value.   
    

   ${AuthDetails}    Create List    12345    ABCDE 
   Create Session        Auth    ${BaseURL}    auth=${AuthDetails}
   
   ${Body}=    Create Dictionary    VoucherNo=F2023PIAEXP00061
   ${header}=    Create Dictionary    Content-Type=application/json    SiteCode=#PIA#     
   ${response}=    POST On Session    Auth    ${Endpoint}    json=${Body}    headers=${header}
   
   Log   ${response.status_code}
   Log   ${response.content} 
   
   ${ResponseStatusCode}     Convert To String    ${response.status_code}
   ${Responde}    Convert To String    ${response.content} 
   
   Should Contain    ${ResponseStatusCode}    200  
   Should Contain    ${Responde}    ${InvoiceType}  
   Should Contain    ${Responde}    ${CustomerName}  
   Should Contain    ${Responde}    ${InvoiceNumber}  
   Should Contain    ${Responde}    ${InvoiceValidityDate}  
   Should Contain    ${Responde}    ${DateFormat}  
   Should Contain    ${Responde}    ${BLNumberInvoiced}
   Should Contain    ${Responde}    ${ResponseMessage}  
   Should Contain    ${ResponseStatusCode}    ${ResponseCode}
   

TC002
    [Documentation]   Check if settlement can be performed on approved invoices.
    

   ${AuthDetails}    Create List    12345    ABCDE 
   Create Session        Auth    ${BaseURLS}    auth=${AuthDetails}
   
   ${Body}=    Create Dictionary    VoucherNo=F2023PIAEXP00061  Amount=2500
   ${header}=    Create Dictionary    Content-Type=application/json    SiteCode=#PIA#     
   ${response}=    POST On Session    Auth    ${EndPointS}    json=${Body}    headers=${header}
   
   Log   ${response.status_code}
   Log   ${response.content}
   
   ${ResponseStatusCode}     Convert To String    ${response.status_code}
   ${Responde}    Convert To String    ${response.content} 
   
   Should Contain    ${ResponseStatusCode}    200  
   Should Contain    ${Responde}    ${Id}
   Should Contain    ${Responde}    ${Content}
   Should Contain    ${Responde}    ${SResponseMessage}
   Should Contain    ${Responde}    ${SResponseCode}
  
   

   

   
 
    

