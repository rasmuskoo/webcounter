*** Settings ***
Resource  resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Browser

*** Test Cases ***
When counter is set to 10 the value is ten
    Go To  ${HOME_URL}
    Click  button >> text=Paina
    Fill Text  input[name="value"]  10
    Click  button >> text=Aseta
    Get Text  body  *=  nappia painettu 10 kertaa

When counter is set to zero the value is zero
    Go To  ${HOME_URL}
    Click  button >> text=Paina
    Fill Text  input[name="value"]  0
    Click  button >> text=Aseta
    Get Text  body  *=  nappia painettu 0 kertaa

When counter is set to an invalid value it does not change
    Go To  ${HOME_URL}
    Fill Text  input[name="value"]  7
    Click  button >> text=Aseta
    Fill Text  input[name="value"]  abc
    Click  button >> text=Aseta
    Get Text  body  *=  nappia painettu 7 kertaa
