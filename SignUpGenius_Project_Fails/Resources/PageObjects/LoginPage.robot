*** Settings ***
Library  SeleniumLibrary
Variables  ../WebElements.py

*** Variables ***
${email}  gpiver@gmail.com
${password}  Sugtest123!

*** Keywords ***
#Should Pass -- Account exists
Input Email and Password and Login

    [arguments]  ${My_Account}
    Input Text  ${LoginPageEmailElement}  ${email}
    Input Text  ${LoginPagePasswordElement}  ${password}
    Click Element  ${LoginPageLoginButtonElement}
    Sleep  4s
    Element Should Contain  ${LoginPageAccountIconElement}  ${My_Account}

#Should Fail -- Password doesnt match with Email
#Alternative: Wait Until Page Does Not Ccontain  ${Error_Message}
Correct Email and Incorrect Password

    [documentation]  This test attempts to login with incorrect password. It fails if URL Redirects to Login Error Page
    [arguments]  ${wrong_password}  ${My_Account}
    Input Text  ${LoginPageEmailElement}  ${email}
    Input Text  ${LoginPagePasswordElement}  ${wrong_password}
    Click Element  ${LoginPageLoginButtonElement}
    Element Should Contain  ${LoginPageAccountIconElement}  ${My_Account}

#Should Fail -- Account doesn't exist
#Alternative: Wait Until Page Does Not Ccontain  ${Error_Message}
Incorrect Email and Correct Password

    [documentation]  This test attempts to login with incorrect email. It fails if URL Redirects to Login Error Page
    [arguments]  ${wrong_email}  ${My_Account}
    Input Text  ${LoginPageEmailElement}  ${wrong_email}
    Input Text  ${LoginPagePasswordElement}  ${password}
    Click Element  ${LoginPageLoginButtonElement}
    Element Should Contain  ${LoginPageAccountIconElement}  ${My_Account}


#Should Fail -- Incorrect email format
Incorrect Email Format and Correct Password
    [documentation]  This test attempts to login with wrong email format.
    [arguments]  ${wrong_emailformat}
    Input Text  ${LoginPageEmailElement}  ${wrong_emailformat}
    Input Text  ${LoginPagePasswordElement}  ${password}
    Click Element  ${LoginPageLoginButtonElement}
    Element Should Contain  ${LoginPageEmailElement}  @

#Should Fail -- No Password submitted
Correct Email but no Password
    [documentation]  This test attempts to login with no password.
    Input Text  ${LoginPageEmailElement}  ${email}
    Click Element  ${LoginPageLoginButtonElement}
    Wait Until Page Does Not Contain Element  ${LoginPageErrorPopupElement}
