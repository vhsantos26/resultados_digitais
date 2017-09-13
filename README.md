# Challenge Project - Software QA Engineer

## Build Status

[![CircleCI](https://circleci.com/gh/vhsantos26/resultados_digitais.svg?style=shield&circle-token=426eec69a01e4ff52018e7d76474e03255ba349a)](https://circleci.com/gh/vhsantos26/resultados_digitais)

## Description

UI Tests for RD Station.

## Observed issues

* Right after login, on dashboard page, occurs two JavaScript errors:

```javascript
Failed to load resource: the server responded with a status of 403 (Forbidden)
```
```javascript
Failed to load resource: net::ERR_BLOCKED_BY_CLIENT
```

* After save the Financial information, data update alert appear in wrong place, as all of alerts appears at right bottom corner, and that appears at top. Besides that, there are two different behaviors for presenting such, while one overwrite the help button and another don't (*Blog Tools without a term alert overwrite the help button and, when Account Overview are save, alert show up above the help button*).

# Automation

All scenarios are describe right [here](https://github.com/vhsantos26/resultados_digitais/blob/master/features/specifications/connect/base_of_leads.feature).

## Description

UI Automation Tests for Base of Leads App.

## Requirements

- Ruby 2.3.3
- Google Chrome

## How to run

- Clone the project
- On path `resultados_digitais/` execute the command `bundle install`
- Run all test with `bundle exec cucumber --tags ~@wip`
