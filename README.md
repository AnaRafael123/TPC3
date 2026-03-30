# TPC3
Scenario: Suggest mentors based on department and interests
  Given I am a mentee in the "Computer Science" department
  And I have interests in "AI" and "Machine Learning"
  When I open the mentor suggestions page
  Then I should see a list of mentors whose department is "Computer Science"
  And whose interests include "AI" or "Machine Learning"
