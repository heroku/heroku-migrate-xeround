require 'heroku/command/base'

require 'uri'

class Heroku::Command::Xeround < Heroku::Command::Base

  # xeround:export
  #
  # MySQL export for Xeround
  #
  # Examples:
  #
  #   heroku xeround:export -a APPNAME
  def export
    exit_for_appname unless heroku_app_name

    host, port, user, pass, db = get_xeround_config_vars

    puts 'Exporting from Xeround...'
    success = system "mysqldump -h #{host} -P #{port} -u #{user} -p #{pass} #{db}"
    puts 'Done.'
  end

  private

  def exit_for_appname
    message = <<-ERROR
No app specified.
Run this command from an app folder or specify which app to use with --app APP.
ERROR

    error message
  end

  def get_xeround_config_vars
    url = `heroku config:get XEROUND_DATABASE_URL -a #{heroku_app_name}`.strip

    if url.empty?
      error 'Your app is missing the XEROUND_DATABASE_URL environment variable'
    end

    url = URI.parse url

    return url.host, url.port, url.user, url.password, url.path

  rescue URI::InvalidURIError
    error('The XEROUND_DATABASE_URL is not a valid URI')
  end

  def heroku_app_name
    @app ||= Heroku::Command.current_options[:app] || extract_app_in_dir(Dir.pwd)
  end

end
