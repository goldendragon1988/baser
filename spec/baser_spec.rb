# frozen_string_literal: true

RSpec.describe Baser do # rubocop:disable Metrics/BlockLength
  it "has a version number" do
    expect(Baser::VERSION).not_to be nil
  end

  it "has a default characters" do
    expect(Baser.characters).to eq Baser::DEFAULT_CHARACTERS
  end

  context "default characters" do # rubocop:disable Metrics/BlockLength
    describe ".encode" do
      it "returns '0' for 0" do
        expect(Baser.encode(0)).to eq "1"
      end
      it "returns '1' for 1" do
        expect(Baser.encode(1)).to eq "2"
      end
      it "converts to the default base" do
        expect(Baser.encode(1200)).to eq "mG"
      end
      it "converts to the default base" do
        expect(Baser.encode(7_653_101)).to eq "Fe12"
      end
      it "raise an error if not an integer" do
        expect { Baser.encode("1200") }.to raise_error do |error|
          expect(error).to be_a(Baser::Error)
          expect(error.message).to eq("not an integer")
        end
      end
    end

    describe ".decode" do # rubocop:disable Metrics/BlockLength
      it "converts to the base 10" do
        expect(Baser.decode("Fe12")).to eq 7_653_101
      end
      it "returns a digit" do
        expect(Baser.decode("1")).to eq 0
      end
      it "raise an error if empty" do
        expect { Baser.decode("") }.to raise_error do |error|
          expect(error).to be_a(Baser::Error)
          expect(error.message).to eq("parameter is empty")
        end
      end
      it "raise an error if one of the characters are not included in the selected set" do
        expect { Baser.decode("0") }.to raise_error do |error|
          expect(error).to be_a(Baser::Error)
          expect(error.message).to eq("one or more characters are not included in the set of characters")
        end
      end
      it "raise an error if one of the characters are not included in the selected set" do
        expect { Baser.decode("ab0c") }.to raise_error do |error|
          expect(error).to be_a(Baser::Error)
          expect(error.message).to eq("one or more characters are not included in the set of characters")
        end
      end
      it "raise an error if not an integer" do
        expect { Baser.decode(1200) }.to raise_error do |error|
          expect(error).to be_a(Baser::Error)
          expect(error.message).to eq("not a string")
        end
      end
    end
  end

  context "custom characters" do
    before do
      Baser.characters = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    end
    it "has a default characters" do
      expect(Baser.characters).not_to eq Baser::DEFAULT_CHARACTERS
    end
    describe ".encode" do
      it "converts to the default base" do
        expect(Baser.encode(1200)).to eq "tw"
      end
      it "returns '0' for 0" do
        expect(Baser.encode(0)).to eq "a"
      end
      it "returns '1' for 1" do
        expect(Baser.encode(1)).to eq "b"
      end
    end

    describe ".decode" do
      it "converts to the base 10" do
        expect(Baser.decode("Fe12")).to eq 7_406_884
      end
    end
  end

  context "custom characters" do
    before do
      Baser.characters = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".each_char.map { |c| c }
    end
    it "has a default characters" do
      expect(Baser.characters).not_to eq Baser::DEFAULT_CHARACTERS
    end

    describe ".encode" do
      it "converts to the default base" do
        expect(Baser.encode(4589)).to eq "1c1"
      end
      it "returns '0' for 0" do
        expect(Baser.encode(0)).to eq "0"
      end

      it "returns '1' for 1" do
        expect(Baser.encode(1)).to eq "1"
      end
    end

    describe ".decode" do
      it "converts to the base 10" do
        expect(Baser.decode("Hash")).to eq 10_288_297
      end
    end
  end
end
