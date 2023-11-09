# frozen_string_literal: true

Baser.setup do |config|
  # NOTE: Your sequence should be array form
  # assign more than 10 characters for it to work
  # This is the default characters without 0 0 I l as it is confusing
  # config.charcaters = ("0".."9").to_a + ("a".."z").to_a + ("A".."Z").to_a - %w[0 O I l]
  # config.characters = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".each_char.map { |c| c }
  # config.characters = "YOUR SEQUENCE HERE"
end
