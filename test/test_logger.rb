require 'test/unit'
require 'stderr_logger'
require 'mocha'
require 'delorean'
require 'colored'
require 'time'

class TestStderrLogger < Test::Unit::TestCase
  include ::Colored

  def setup
    Delorean.time_travel_to "2012/01/01 23:23"
    $0 = "el_programa"
    StderrLogger.const_set("USE_COLOR", true)
    @logger = StderrLogger.logger
    @logdev = @logger.instance_variable_get("@logdev")
  end

  def test_info
    @logdev.expects(:write).with("Jan  1 23:23:00 el_programa INFO : hola\n")
    info "hola"
  end
  def test_error
    @logdev.expects(:write).with("Jan  1 23:23:00 el_programa ERROR : hola\n")
    error "hola"
  end

  def test_debug
    @logdev.expects(:write).with("Jan  1 23:23:00 el_programa DEBUG : hola\n")
    debug "hola"
  end

end
