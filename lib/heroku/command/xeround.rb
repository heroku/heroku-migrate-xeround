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
    host, port, user, pass, db = get_xeround_config_vars

    puts 'Exporting from Xeround...'
    success = system "mysqldump -h #{host} -P #{port} -u #{user} -p #{pass} #{db}"
    puts 'Done.'
  end

  private

  def get_xeround_config_vars
    url = `heroku config:get XEROUND_DATABASE_URL -a #{app}`.strip

    if url.empty?
      error 'Your app is missing the XEROUND_DATABASE_URL environment variable'
    end

    url = URI.parse url

    return url.host, url.port, url.user, url.password, url.path

  rescue URI::InvalidURIError
    error('The XEROUND_DATABASE_URL is not a valid URI')
  end

end
