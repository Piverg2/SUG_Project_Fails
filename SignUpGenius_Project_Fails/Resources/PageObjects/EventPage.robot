*** Settings ***
Library  SeleniumLibrary
Variables  ../WebElements.py

*** Variables ***
${event_title}  My Test Event
${category}  Education
${zoom_id}  588 943 1834

*** Keywords ***
Click Create a Signup
    Click Element  ${EventPageCreateSignupElement}

Edit Design
    [documentation]  Edits all the settings on the Design Tab
    #Add Title
    Input Text  ${EventPageTitleElement}  ${event_title}

    #Add Group
    Click Element  ${EventPageGroupDropdownElement}
    Click Element  ${EventPageGroupSelectElement}

    #Select Type/Category
    Click Element  ${EventPageTypeDropdownElement}
    Click Element  ${EventPageTypeSelectElement}
    Click Element  ${EventPageCategoryDropdownElement}
    Input Text  ${EventPageCategoryTextField}  ${category}
    Press Keys  ${EventPageCategorySelectElement}  RETURN

    #Select Theme Design
#    Input Text  ${EventPageThemeSearchField}  ${category}
#    Press Keys  ${EventPageThemeSelectElement}  RETURN
#    Click Element  ${EventPageThemeTypeElement}
#    Click Element  ${EventPageThemeTypeSelectElement}
#    Click Element  ${EventPageThemeImgSelectElement}

    #Save
    Scroll Element Into View  xpath:/html/body/footer/div/div/div[2]/div[1]/div[4]/form/div
    Sleep  5s
    Mouse Down  ${SaveButton}
    Mouse Up  ${SaveButton}



Edit Slots
    [documentation]  Edits all the settings on the Slots Tab -- Single Date RSVP

    #Select Type of Slot
    Click Element  ${SlotsPageTypeElement}

    #Change Date
    Click Element  ${SlotsPageCalendarElement}
    Sleep  3s
    Click Element  ${SlotsPageMonthElement}
    Click Element  ${SlotsPageDateSelectElement}

    #Change Start Time
    Click Element  ${SlotsPageStartHourDropDownElement}
    Click Element  ${SlotsPageStartHourSelectElement}
    Click Element  ${SlotsPageStartMinuteDropDownElement}
    Click element  ${SlotsPageStartMinuteSelectElement}
    Click Element  ${SlotsPageStartTimeDropDownElement}
    Click Element  ${SlotsPageStartTimeSelectElement}

    #Change End Time
    Click Element  ${SlotsPageEndHourDropDownElement}
    Click Element  ${SlotsPageEndHourSelectElement}
    Click Element  ${SlotsPageEndMinuteDropDownElement}
    Click element  ${SlotsPageEndMinuteSelectElement}
    Click Element  ${SlotsPageEndTimeDropDownElement}
    Click Element  ${SlotsPageEndTimeSelectElement}

    #Add Zoom ID
    Click Element ${SlotsPageVirtualMeetingElement}
    Input Text  ${SlotsPageVirtualMeetingZoomIDField}  ${zoom_id}
    Click Element  ${SlotsPageVirtualMeetingAddElement}

    #Uncheck Include SignupSlots
    Click Element  ${SlotsPageShowSlotsElement}
    Wait Until Page Does Not Contain Element  ${SlotsPageAddSlotsElement}

    #Save
    Scroll Element Into View  xpath:/html/body/footer/div/div/div[2]/div[1]/div[4]/form/div
    Sleep  5s
    Mouse Down  ${SaveButton}
    Mouse Up  ${SaveButton}

Publish
    Click Element  ${PublishPagePublishTab}
    Click Element  ${PublishPagePublishElement}
    Wait Until Page Contains  Your changes have been saved.
