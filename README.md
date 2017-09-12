# Challenge Project - Software QA Engineer

## Build Status

[![CircleCI](https://circleci.com/gh/vhsantos26/resultados_digitais.svg?style=shield&circle-token=426eec69a01e4ff52018e7d76474e03255ba349a)](https://circleci.com/gh/vhsantos26/resultados_digitais)

## Description

UI Tests for an Base of Leads App.

## Observed issues

* Right after login, on dashboard page, occurs a JavaScript error:

```javascript
fbevents.js - Failed to load resource: the server responded with a status of 403 (Forbidden)

cm Failed to load resource: net::ERR_BLOCKED_BY_CLIENT
```

* After save the Financial information, data update alert appear in wrong place, whereas all of alerts appears at right bottom corner.

# Automation

## Requirements

- Ruby 2.3.3
- Google Chrome

## How to run

- Clone the project
- On path `resultados_digitais/` execute the command `bundle install`
- Run all test with `bundle exec cucumber --tags ~@wip`
