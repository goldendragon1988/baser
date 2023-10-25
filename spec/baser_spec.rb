# frozen_string_literal: true

RSpec.describe Baser do # rubocop:disable Metrics/BlockLength
  it "has a version number" do
    expect(Baser::VERSION).not_to be nil
  end

  it "has a default characters" do
    expect(Baser.characters).to eq Baser::DEFAULT_CHARACTERS
  end

  context "default characters" do
    describe ".encode" do
      it "converts to the default base" do
        expect(Baser.encode(1200)).to eq "mG"
      end
      it "raise an error if not an integer" do
        expect { Baser.encode("1200") }.to raise_error Baser::Error
      end
    end

    describe ".decode" do
      it "converts to the base 10" do
        expect(Baser.decode("Fe12")).to eq 7_653_101
      end
      it "raise an error if not an integer" do
        expect { Baser.decode(1200) }.to raise_error Baser::Error
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
    end

    describe ".decode" do
      it "converts to the base 10" do
        expect(Baser.decode("Hash")).to eq 10_288_297
      end
    end
  end
end
