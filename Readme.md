# heroku-migrate-xeround

A heroku plugin for exporting from [Xeround][1] and importing to [ClearDB][2].

[1]: https://addons.heroku.com/xeround
[2]: https://addons.heroku.com/cleardb

## Installation

    $ heroku plugins:install git://github.com/heroku/heroku-migrate-xeround.git

## Usage

These instructions assume you would like to move a database from Xeround to
ClearDB. Unless you have already done so, install the ClearDB add-on for your
application:

    $ export APPNAME=<your app name>
    $ heroku addons:add cleardb -a $APPNAME

Run the following command to export from Xeround:

    $ heroku xeround:export -a $APPNAME
    ...

Then run this command to import into ClearDB:

    $ heroku cleardb:import -a $APPNAME
    ...

## License

Released under the MIT license; see the file named LICENSE.
