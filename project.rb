Project = Struct.new(:name, :minutes, :last_started_at) do
  def display_time
    format("%02d:%02d", display_hours, display_minutes)
  end

  def display_hours
    minutes.to_i / 60
  end

  def display_minutes
    minutes.to_i % 60
  end
end
