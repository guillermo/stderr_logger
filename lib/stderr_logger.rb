require "stderr_logger/version"
require 'logger'
require 'colored'

module StderrLogger
  class Logger < ::Logger
    include Colored
    USE_COLOR=STDERR.tty?
    SEVERITY_TO_COLOR={
      "INFO"  => {:foreground => :white},
      "DEBUG" => {:foreground => :yellow},
      "ERROR" => {:foreground => :red}
    }

    def initialize()
      super(STDERR)
      if USE_COLOR
        self.formatter = proc { |severity, datetime, progname, msg|
          time = datetime.strftime("%b %e %H:%M:%S")
          "#{time} #{File.basename($0)} : #{colorize(msg, SEVERITY_TO_COLOR[severity])}\n"
        }
      else
        self.formatter = proc { |severity, datetime, progname, msg|
          time = datetime.strftime("%b %e %H:%M:%S")
          "#{time} #{File.basename($0)} #{severity} : #{msg}\n"
        }
      end
    end
  end

  def self.logger
    @logger ||= Logger.new
  end
end

class Object
  def debug(*args)
    StderrLogger.logger.debug(*args)
  end
  def info(*args)
    StderrLogger.logger.info(*args)
  end
  def error(*args)
    StderrLogger.logger.error(*args)
  end
end
