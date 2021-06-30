class TestMode
  COMMANDS = %w[c scrap b scrap e scrap s scrap 65 d scrap]

  def self.test_mode?
    ENV["TIME_TRACKING_TEST_MODE"] == "true"
  end

  def self.get_command
    TestMode::COMMANDS.shift || exit
  end
end
