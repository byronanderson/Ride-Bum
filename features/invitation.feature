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
        And he types "Rob Zombie, rob@zombie.com, 9876543210" in the invitations field
        And he types "Greg Zombie, greg@zombie.com, 9876543211" in the invitations field
        And clicks "Add Guests"
        Then he should see "Rob Zombie as been added"
        And he should see "Greg Zombie as been added"

    Scenario: initial email invitations
        Given the event has the following invitees:
            | name        | email           | phone      |
            | Rob Zombie  | rob@zombie.com  | 9876543210 |
            | Greg Zombie | greg@zombie.com | 9876543211 |
        And no invitation emails have been sent out
        When he clicks on "Send Invites"
        Then "rob@zombie.com" should receive an email
        And "greg@zombie.com" should receive an email

    Scenario: no duplicate email invitations
        Given the event has the following invitees:
            | name        | email           | phone      |
            | Rob Zombie  | rob@zombie.com  | 9876543210 |
            | Greg Zombie | greg@zombie.com | 9876543211 |
        And they have already received email invitations
        When he clicks on "Send Invites"
        Then "rob@zombie.com" should receive no email
        And "greg@zombie.com" should receive no email

    Scenario: additional invitee
        Given the event has the following invitees:
            | name        | email           | phone      |
            | Rob Zombie  | rob@zombie.com  | 9876543210 |
            | Greg Zombie | greg@zombie.com | 9876543211 |
        And they have already received email invitations
        When he clicks on "Enter Guests"
        And he types "Sarah Zombie, sarah@zombie.com, 9876543212" in the invitations field
        And clicks "Add Guests"
        Then he should see "Sarah Zombie as been added"
        When he clicks on "Send Invites"
        Then "rob@zombie.com" should receive no email
        And "greg@zombie.com" should receive no email
        And "sarah@zombie.com" should receive an email
