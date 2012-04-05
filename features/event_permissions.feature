Feature: Event planner creates event
    As an event planner
    I want to create an event
    In order to have people be able to carpool


    Scenario:
        Given "George" is an event planner
        And he is not logged in
        When he goes to his dashboard page
        Then he is redirected to the login page

