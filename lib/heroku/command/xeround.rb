require 'heroku/command/base'

class Heroku::Command::Xeround < Heroku::Command::Base

  # xeround:export
  #
  # MySQL export for Xeround
  #
  # Examples:
  #
  #   heroku xeround:export -a APPNAME
  def export
    puts "It works!\n"
  end

end
