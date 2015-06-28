Feature: Tagging proposal

Background:
  Given new proposal page
  And proposal title "Proposal"
  And a description "This is a proposal"
  And author nick "Author"
  And email "author@tod.com"

Scenario: Submitt a proposal without tagging
  Given no tags added
  When submitting
  And the proposal has 0 tags

Scenario: Submitt a proposal with one tag
  Given I add tag "FirsTtag"
  When submitting
  And the proposal has 1 tags
  And the proposal has tag "firsttag"

Scenario: Submitt a proposal with two different tags
  Given I add tag "FirstTag, SecondTag"
  When submitting
  And the proposal has 2 tags
  And the proposal has tag "firsttag"
  And the proposal has tag "secondtag"

Scenario: Submitt a proposal with two equal tags
  Given I add tag "FirstTag, Firsttag"
  When submitting
  And the proposal has 1 tags
  And the proposal has tag "firsttag"