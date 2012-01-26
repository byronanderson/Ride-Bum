Feature: Event planner creates event
    As an event planner
    I want to create an event
    In order to have people be able to carpool


    Scenario:
        Given "George" is an event planner
        And he is logged in
        And he is on his dashboard page
        When he clicks on "Create an event"
        And he enters the destination "1600 Pennsylvania Ave. Washington, DC"
        And he enters the name "Graveyard pitstop"
        And he enters the start date and time "2012-01-26 00:00:00"
        And he clicks on "Create"
        Then he sees "The event was created"
        And he is on the event's page
