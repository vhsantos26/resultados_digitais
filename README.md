# Challenge Project - Software QA Engineer

## Build Status

[![CircleCI](https://circleci.com/gh/vhsantos26/resultados_digitais.svg?style=shield&circle-token=426eec69a01e4ff52018e7d76474e03255ba349a)](https://circleci.com/gh/vhsantos26/resultados_digitais)

## Description

UI Tests for RD Station app. All automated scenarios are describe right [here](https://github.com/vhsantos26/resultados_digitais/blob/master/features/specifications/connect/base_of_leads/base_of_leads.feature).

## Requirements

- Ruby 2.3.3
- Google Chrome

## How to run

- Clone the project
- On path `resultados_digitais/` execute the command `bundle install`
- Run all test with `bundle exec cucumber --tags ~@wip`

## Observed issues

* Right after login, on dashboard page, two JavaScript errors occur:

```javascript
Failed to load resource: the server responded with a status of 403 (Forbidden)
```
```javascript
Failed to load resource: net::ERR_BLOCKED_BY_CLIENT
```

* When informing a plan name with 60 characters or more and lose focus on that, plan name appears blank. And after finish that success plan (*with name and description too long*), congratulation pop-up doesn't works well and the text escape.

* Some alerts can be more helpful on feedback, like on Workflow Actions, after save with on black input (*configure first input with "Send email" and let second input blank*), alert inform that is not possible to save, but don't inform why.

* After save the Financial information, data update alert appears in the wrong place, all the alerts appear at right bottom corner, and that appears at top. Besides that, there are two different behaviors for presenting such, while one overwrite the help button, the other doesn't (*Blog Tools without a term alert overwrite the help button and, when Account Overview are save, alert show up above the help button*).

* Import processing may be faster. On tests, CSV file have one basic lead and, sometimes processing delay are more then 30 seconds

* After sending Email, two alerts appears, one about processing campaign send and another about that don't have any campaign.
