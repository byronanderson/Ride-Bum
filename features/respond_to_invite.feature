Feature: Respond to invitation
  As an invitee
  I want to be able to check the invite 
  In order to decide if I'm going

  # (?) going to the event page? and rsvp

  Scenario: 
    Given I have received an invite to go to the "Zombie Jamboree"
    When I follow the RSVP link in the email
    Then I see the event details
