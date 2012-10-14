README mark down

1.  Create at least two controllers and
    two models that are related to each other.
    (i.e. there is foreign key or join table between the two.)

    I have 3 MVCs: User, Admin, Reminder.
    - A user has many reminders and a reminder belongs to a user.

2.  Use migrations to incrementally build your database.

    I used 7 migrations before I implemented the whole DB.

3   Write unit, functional, and integration tests for the
    more interesting parts of your system.

    There are 35 tests in total including all unit, functional and integration.

4   Have one AJAX operation.

    I have a couple AJAX operations:
    - Adding and deleting a User in the management page(/admins/management)
    - Adding and deleting a reminder (root)

5.  Have one REST API and be able to test it with an XML request

    I have RESTful APIs for accessing reminders and users (/reminders.xml and /users.xml)