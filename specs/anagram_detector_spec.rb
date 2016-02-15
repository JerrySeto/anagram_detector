require './anagram_detector.rb'

RSpec.describe AnagramDetector do

  describe '#detect' do
    context 'when there are no words in the dictionary' do
      let(:detector) { AnagramDetector.new([]) }
      it 'returns an empty array' do
        expect(detector.detect('whatever')).to eq([])
      end
    end

    context 'when there multiple keys in the dictionary' do
      let(:detector) { AnagramDetector.new(%w{kinship enlist listen}) }
      it 'returns an empty array when the query is the only match' do
        expect(detector.detect('kinship')).to eq([])
      end

      it 'returns an array of words that match that are in order' do
        expect(detector.detect('inlets')).to eq(['enlist', 'listen'])
      end
    end
  end
end