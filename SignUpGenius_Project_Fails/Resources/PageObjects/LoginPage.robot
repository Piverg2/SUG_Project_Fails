*** Settings ***
Library  SeleniumLibrary
Variables  ../WebElements.py

*** Variables ***
${email}  gpiver@gmail.com
${password}  Sugtest123!
${Login_URL}  https://www.signupgenius.com/index.cfm?go=c.Login

*** Keywords ***
#Should Pass -- Account exists
Input Email and Password and Login

    Input Text  ${LoginPageEmailElement}  ${email}
    Input Text  ${LoginPagePasswordElement}  ${password}
    Click Element  ${LoginPageLoginButtonElement}
    Wait Until Location Is Not  ${Login_URL}

#Should Fail -- Password doesnt match with Email
#To Pass: add Wait Until Element Contains  class:alert-danger, Remove Wait Until Location Is Not
Correct Email and Incorrect Password

    [documentation]  This test attempts to login with incorrect password. It fails if URL Redirects to Login Error Page
    [arguments]  ${wrong_password}
    Input Text  ${LoginPageEmailElement}  ${email}
    Input Text  ${LoginPagePasswordElement}  ${wrong_password}
    Click Element  ${LoginPageLoginButtonElement}
    Wait Until Location Is Not  ${Login_URL}

#Should Fail -- Account doesn't exist
#To Pass: add Wait Until Element Contains  class:alert-danger, Remove Wait Until Location Is Not
Incorrect Email and Correct Password

    [documentation]  This test attempts to login with incorrect email. It fails if URL Redirects to Login Error Page
    [arguments]  ${wrong_email}
    Input Text  ${LoginPageEmailElement}  ${wrong_email}
    Input Text  ${LoginPagePasswordElement}  ${password}
    Click Element  ${LoginPageLoginButtonElement}
    Wait Until Location Is Not  ${Login_URL}


#Should Fail -- Incorrect email format
#To Pass: Change to Wait Until Location Is Not ${Login_URL} to show there was no redirect and successful Login did not happen
Incorrect Email Format and Correct Password
    [documentation]  This test attempts to login with wrong email format.
    [arguments]  ${wrong_emailformat}
    Input Text  ${LoginPageEmailElement}  ${wrong_emailformat}
    Input Text  ${LoginPagePasswordElement}  ${password}
    Click Element  ${LoginPageLoginButtonElement}
    Wait Until Element Contains  ${LoginPageEmailElement}  @

Correct Email but no Password
    [documentation]  This test attempts to login with no password.
    Input Text  ${LoginPageEmailElement}  ${email}
    Click Element  ${LoginPageLoginButtonElement}
    Wait Until Page Does Not Contain Element  ${LoginPageErrorPopupElement}