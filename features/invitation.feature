Feature: event planner invites potential attendees
    As an event planner
    I want to invite people
    In order to have them come to my event

    Background:
        Given "George" is an event planner
        And he is logged in
        And there is a "Graveyard pitstop" event
        And he is on the "Graveyard pitstop" event page

    Scenario: enter initial invitee list
        When he clicks on "Enter Guests"
        And he fills in "Name" with "Rob Zombie"
        And he fills in "Email" with "rob@zombie.com"
        And he fills in "Phone" with "9876543210"
        And he clicks "Add"
        Then he should see "Rob Zombie has been added"
        And he fills in "Name" with "Greg Zombie"
        And he fills in "Email" with "greg@zombie.com"
        And he fills in "Phone" with "9876543211"
        And he clicks "Add"
        And he should see "Greg Zombie has been added"

    Scenario: initial email invitations
        Given the event has the following invitees:
            | name        | email           | phone      |
            | Rob Zombie  | rob@zombie.com  | 9876543210 |
            | Greg Zombie | greg@zombie.com | 9876543211 |
        And no invitation emails have been sent out
        When he clicks on "Send to All"
        Then "rob@zombie.com" should receive an email
        And "greg@zombie.com" should receive an email

    Scenario: no duplicate email invitations
        Given the event has the following invitees:
            | name        | email           | phone      |
            | Rob Zombie  | rob@zombie.com  | 9876543210 |
            | Greg Zombie | greg@zombie.com | 9876543211 |
        And they have already received email invitations
        When he clicks on "Send to All"
        Then "rob@zombie.com" should receive no email
        And "greg@zombie.com" should receive no email

    Scenario: additional invitee
        Given the event has the following invitees:
            | name        | email           | phone      |
            | Rob Zombie  | rob@zombie.com  | 9876543210 |
            | Greg Zombie | greg@zombie.com | 9876543211 |
        And they have already received email invitations
        When he clicks on "Enter Guests"
        And he fills in "Name" with "Sarah Zombie"
        And he fills in "Email" with "sarah@zombie.com"
        And he fills in "Phone" with "9876543212"
        And he clicks "Add"
        Then he should see "Sarah Zombie as been added"
        When he clicks on "Send to All"
        Then "rob@zombie.com" should receive no email
        And "greg@zombie.com" should receive no email
        And "sarah@zombie.com" should receive an email
