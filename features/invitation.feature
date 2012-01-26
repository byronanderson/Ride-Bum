Feature: event planner invites potential attendees
  As an event planner
  I want to invite people
  In order to have them come to my event

  Scenario: enter initial invitee list
    Given "George" is an event planner
    And he is logged in
    And he is on the "Graveyard pitstop" event page
    When he clicks on "Enter Guests"
    And he types "Rob Zombie, rob@zombie.com, 9876543210" in the invitations field
    And he types "Greg Zombie, greg@zombie.com, 9876543210" in the invitations field
    And clicks "Add Guests"
    Then he should see "Rob Zombie as been added"
    Then he should see "Greg Zombie as been added"
