require "minitest/autorun"
require_relative "rocket"

class RocketTest < Minitest::Test
  # Write your tests here!
  def setup
    @rocket = Rocket.new({})
  end

  def test_initialize_method_empty
    assert(@rocket.name)
    assert(@rocket.colour)
    refute(@rocket.flying?)
  end

  def test_initialize_method_with_arguments
    name = "Coco64"
    colour = "Navy Blue"
    flying = true

    rocket = Rocket.new({name: name, colour: colour, flying: flying})

    assert_equal(rocket.name, name)
    assert_equal(rocket.colour, colour)
    assert(rocket.flying?)
  end

  def test_initialize_method_with_arguments_with_numarical_names
    name = 23
    colour = 123
    flying = true

    rocket = Rocket.new({name: name, colour: colour, flying: flying})

    assert_equal(rocket.name, name)
    assert_equal(rocket.colour, colour)
    assert(rocket.flying?)
  end

  def test_initialize_method_with_nil_arguments
    name = nil
    colour = nil
    flying = nil

    rocket = Rocket.new({name: name, colour: colour, flying: flying})

    assert(rocket.name)
    assert(rocket.colour)
    refute(rocket.flying?)
  end

  def test_lift_off_when_flying
    rocket = Rocket.new(flying: true)

    refute(rocket.lift_off)
  end

  def test_lift_off_when_not_flying

    assert(@rocket.lift_off)

  end

  def test_land_when_flying
    rocket = Rocket.new(flying: true)

    assert(rocket.land)
    refute(rocket.flying?)
  end

  def test_land_when_not_flying

    refute(@rocket.land)

  end

  def status_when_flying
    rocket = Rocket.new(flying: true)
    msg = rocket.status
    assert_equal(msg, "Rocket #{rocket.name} is flying through the sky!")
  end

  def status_when_not_flying
    msg = @rocket.status
    assert_equal(msg, "Rocket #{name} is ready for lift off!")
  end

end
