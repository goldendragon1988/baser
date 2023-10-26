# frozen_string_literal: true

require_relative "baser/version"

# encode/decode base by the number of characters
module Baser
  class Error < StandardError; end

  DEFAULT_CHARACTERS = ("0".."9").to_a + ("a".."z").to_a + ("A".."Z").to_a - %w[0 O I l]

  class << self
    attr_writer :characters

    def setup
      yeild self
      true
    end

    def characters
      @characters ||= DEFAULT_CHARACTERS
    end

    def encode(number)
      raise Error, "not an integer" unless number.is_a? Integer
      return characters[number] if number.zero?

      str = ""
      while number.positive?
        str = characters[number % base] + str
        number /= base
      end
      str
    end

    def decode(string)
      return unless validate?(string)

      num = 0
      string.reverse.each_char.with_index do |char, index|
        num += hash[char] * (base**index)
      end
      num
    end

    private

    def base
      @characters.length
    end

    def hash
      Hash[characters.map.with_index.to_a]
    end

    def validate?(string)
      raise Error, "parameter is empty" if string == ""
      raise Error, "not a string" unless string.is_a? String
      raise Error, "one or more characters are not included in the set of characters" unless character_checker(string)

      true
    end

    def character_checker(string)
      excluded_character = string.chars.find { |char| !characters.include? char }

      excluded_character.nil?
    end
  end
end
