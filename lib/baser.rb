# frozen_string_literal: true

require_relative "baser/version"

# encode/decode base by the number of characters
module Baser
  class Error < StandardError; end

  DEFAULT_CHARACTERS = ("0".."9").to_a + ("a".."z").to_a + ("A".."Z").to_a - %w[0 O I l]

  class << self
    attr_writer :characters

    def characters
      @characters ||= DEFAULT_CHARACTERS
    end

    def encode(number)
      raise Error, "#{number} is not an Integer" unless number.is_a? Integer

      str = ""
      while number.positive?
        str = characters[number % base] + str
        number /= base
      end
      str
    end

    def decode(string)
      raise Error, "#{string} is not a string" unless string.is_a? String

      base10 = 0
      string.reverse.each_char.with_index do |char, index|
        base10 += hash[char] * (base**index)
      end
      base10
    end

    private

    def base
      @characters.length
    end

    def hash
      Hash[characters.map.with_index.to_a]
    end
  end
end
