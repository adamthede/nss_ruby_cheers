require_relative 'helper'

class TestCheersIntegration < MiniTest::Unit::TestCase

  def test_a_name_with_no_vowels
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts "BRT"
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Give me a .... B
Give me an ... R
Give me a .... T
BRT's just GRAND!
EOS
    assert_equal expected_output, shell_output
  end

  def test_an_empty_name
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts ""
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Surely your parents gave you a name! What's your name?
EOS
    assert_equal expected_output, shell_output
  end

  def test_a_name_with_numbers
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts "Adam 123"
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Give me an ... A
Give me a .... D
Give me an ... A
Give me an ... M
ADAM's just GRAND!
EOS
    assert_equal expected_output, shell_output
  end

  def test_a_name_with_extra_white_space
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts "Adam     Thede"
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Give me an ... A
Give me a .... D
Give me an ... A
Give me an ... M

Give me a .... T
Give me an ... H
Give me an ... E
Give me a .... D
Give me an ... E
ADAM THEDE's just GRAND!
EOS
    assert_equal expected_output, shell_output
  end

  def test_a_normal_name
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts "Thomas Jefferson"
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Give me a .... T
Give me an ... H
Give me an ... O
Give me an ... M
Give me an ... A
Give me an ... S

Give me a .... J
Give me an ... E
Give me an ... F
Give me an ... F
Give me an ... E
Give me an ... R
Give me an ... S
Give me an ... O
Give me an ... N
THOMAS JEFFERSON's just GRAND!
EOS
    assert_equal expected_output, shell_output
  end
end
