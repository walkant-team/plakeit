module EventsHelper
  def extract_assistant(assistants)
    mobile_device? ? assistants.first(4) : assistants
  end
end
