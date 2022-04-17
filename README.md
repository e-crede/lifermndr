# lifermndr

## Overview
An application that sends reminders of upcoming ocassions via telegram. 

## Technical Features
- User manager (devise)
- Notifications via Telegram (ruby-telegram-bot)
- Automatic sending of Reminders(rufus-scheduller)
- Reminders CRUD
    - Reminders overview
    - configuration of individual reminders: date, recurrance, reminder periods
- Active Jobs
    - Send reminders based on matching filter criteria
    - Update next ocassion date
- Bootstrap UI


## Future work
- telegram bot extensions
    - configured per-user via a database
    - configurable: chat-id, token
- reminders to be sent at user-selectable hours of the day
