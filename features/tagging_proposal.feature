Feature: Tagging proposal

Background:
  Given new proposal page
  And proposal title "Proposal"
  And a description "This is a proposal"
  And author nick "Author"
              
Scenario: Submitt a proposal without tagging
  Given no tags added
  When submitting
  Then proposal is added
  And the proposal has 0 tags

Scenario: Submitt a proposal with one tag
  Given I add tag "FirstTag"
  When submitting
  Then proposal is added
  And the proposal has 1 tags
  And the proposal has tag "firsttag"

Scenario: Submitt a proposal with two different tags
  Given I add tag "FirstTag"
  Given I add tag "SecondTag"
  When submitting
  Then proposal is added
  And the proposal has 2 tags
  And the proposal has tag "firsttag"
  And the proposal has tag "secondtag"

Scenario: Submitt a proposal with two equal tags
  Given I add tag "FirstTag"
  Given I add tag "Firsttag"
  When submitting
  Then proposal is added
  And the proposal has 1 tags
  And the proposal has tag "firsttag"