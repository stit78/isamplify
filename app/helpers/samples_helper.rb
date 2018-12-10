module SamplesHelper
  def samples_count_css_class(samples_count, step)
    # Example
    # step = 2
    # active si step 0 .. 2 sont toutes = a 0
    steps_done = samples_count[0..step].all? { |count| count == 0 }

    steps_done ? "button__badge_active" : "button__badge"
  end
end
