*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${url}  https://www.signupgenius.com/register
${browser}  chrome

*** Keywords ***
Start TestCase
    Open Browser  ${url}  ${browser}
    Maximize Browser Window
Finish TestCase
    Close Browser
