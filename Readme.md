# heroku-migrate-xeround

A heroku plugin for exporting from [Xeround][1] and importing to [ClearDB][2].

[1]: https://addons.heroku.com/xeround
[2]: https://addons.heroku.com/cleardb

## Installation

    $ heroku plugins:install git://github.com/heroku/heroku-migrate-xeround.git

## Usage

    $ heroku xeround:export -a APPNAME
    ...

    $ heroku cleardb:import -a APPNAME
    ...

## License

Released under the MIT license; see the file named LICENSE.
