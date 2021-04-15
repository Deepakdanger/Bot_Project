require_relative '../lib/joke'
require_relative '../lib/quote'

describe Joke do
  let(:value) { Joke.new }
  describe 'joke_call method' do
    it 'return class string in response when send the json request' do
      expect(value.joke_call.class).to eql(Hash)
    end

    it 'the length of the string should not be equal to zero' do
      expect(value.joke_call.length).not_to eql(0)
    end
  end
end

describe Quote do
  let(:val) { Quote.new }
  describe 'quote1 method' do
    it 'return class array in response when send the json request' do
      expect(val.quote1.class).to eql(Hash)
    end

    it 'the length of the array should not be equal to zero' do
      expect(val.quote1.length).not_to eql(0)
    end
  end
end
