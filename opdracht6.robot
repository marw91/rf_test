*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary

*** Variables ***
${username}     Mwiendels
${password}     7S13MP
${usertoken}      
${baseURL}    HotelAdactinWebServices/REST/api.php
${NumberOfBookings}

*** Test Cases ***
Opdracht 6
    Create Session    hotel   https://adactinhotelapp.com/    verify=true
    ${resp}           Get On Session    alias=hotel    url=/HotelAdactinWebServices/REST/api.php    params=action=checkLogin&username=${username}&password=${password}
    ${usertoken}      Get Value From Json    ${resp.json()}    $..Token
    ${usertoken}      Set Variable           ${usertoken}[0]
    ${GetAllBookings}     Get On Session          alias=hotel    url=${baseURL}?action=getBookings&userToken=${usertoken}   
    ${GetAllBookings}     Get Value From Json     ${GetAllBookings.json()}    $..BookingNo
    ${NumberOfBookings}   Get length              ${GetAllBookings} 
    Log To Console    ${GetAllBookings}

Opdracht 6 Create booking
    Create Session    hotel   https://adactinhotelapp.com/    verify=true
    ${resp}           Get On Session    alias=hotel    url=/HotelAdactinWebServices/REST/api.php    params=action=checkLogin&username=${username}&password=${password}
    ${usertoken}      Get Value From Json    ${resp.json()}    $..Token
    ${usertoken}      Set Variable           ${usertoken}[0]
    POST On Session   alias=hotel   url=${baseURL}?action=bookHotel&userToken=${usertoken}&hotelName=Hotel%20Sunshine&location=Sydney&room_type=Double&room_nos=2&arr_date=24/09/2022&dep_date=26/09/2022&adult_no=2&child_no=1&price_night=330&total_price=550&firstname=John&lastname=Doe&address=Bell%20Road&ccardno=1234566789012345&ccardtype=American%20Express&expiryMonth=April&expiryYear=2024&cvvNum=345&status=1
    ${GetAllBookings}     Get On Session          alias=hotel    url=${baseURL}?action=getBookings&userToken=${usertoken}   
    ${GetAllBookings}     Get Value From Json     ${GetAllBookings.json()}    $..BookingNo
    ${NumberOfBookings}   Get length              ${GetAllBookings} 
    Log To Console    ${GetAllBookings}