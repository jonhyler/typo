Feature: Write Articles
  As a blog administrator
  In order to organize blog content
  I want to be able to merge existing articles in the blog

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    And the following articles exist:
  | title  | id | body       | author   |
  | Foobar |  1 | "Foo body" | Gladwell |
  | Baz    |  2 | "Baz body" | Chomsky  |

  Scenario: Successfully merge articles
    Given I am on the edit article page for "Foobar"
    When I fill in "merge_with" with "2"
    And I press "Merge"
    Then I should be on the admin content page
    When I go to the home page
    Then I should see "Foobar"
    And I should not see "Baz"
    When I follow "Foobar"
    Then I should see "Foo body"
    And I should see "Gladwell"
    And I should see "Foobar"
