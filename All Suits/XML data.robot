*** Settings ***
Library    XML
Library    OperatingSystem
Library    Collections

*** Test Cases ***
Retrieve ACHContract Text
    ${xml_obj}  XML.Parse Xml      C:/Users/iin001.ENVECON/Downloads/EventDataXml-800545.xml
    ${xml_content}    Get Elements Texts    ${xml_obj}    ./joborder/container/loadportcode
    Log    ${xml_content}      
    Should Contain  ${xml_content}      KJNM9867646
    # Get Element Count    ${xml_obj}     .//Container/ContainerNo  

  