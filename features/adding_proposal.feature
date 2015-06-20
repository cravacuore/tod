Feature: Adding proposal

Background:
  Given new proposal page

Scenario: Adding a proposal that complies
  Given proposal title "Proposal"
  And a description "This is a proposal"
  And author nick "Author"
  And email "author@tod.com"
  When submitting
  Then proposal is added

Scenario: Failing proposal submission when title is wrong
  Given proposal title "as"
  And a description "This is a proposal"
  And author nick "Author"
  Then it should raise an error

Scenario: Failing proposal submission when description is wrong
  Given proposal title "Proposal"
  And a description ""
  And author nick "Author"
  Then it should raise an error

Scenario: Failing proposal submission when author is wrong
  Given proposal title "Proposal"
  And a description "This is a proposal"
  And author nick " "
  Then it should raise an error


Scenario: Proposal have duplicated title
  Given proposal title "Proposal"
  And a description "This is a proposal"
  And author nick "Author"
  And email "author@tod.com"
  And submitting

  Given new proposal
  And proposal title "Proposal"
  And a description "This is a proposal"
  And author nick "Author"
  And email "author@tod.com"
  And submitting
  Then the second proposal should have title "Proposal - Author"

Scenario: Failing proposal submission when email is empty
  Given proposal title "Proposal"
  And a description "This is a proposal"
  And author nick "Author"
  And email " "
  And submitting
  Then it should raise an error

Scenario: Failing proposal submission when email is wrong spelled
  Given proposal title "Proposal"
  And a description "This is a proposal"
  And author nick "Author"
  And email "authormail.com"
  And submitting
  Then it should raise an error
  When retry with "author.com"
  And submitting
  Then it should raise an error
  When retry with "@mail.com"
  And submitting
  Then it should raise an error
  When retry with "author@mail"
  And submitting
  Then it should raise an error
