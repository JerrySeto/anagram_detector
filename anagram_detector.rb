class AnagramDetector
  def initialize(words)
    @words = words
    @dictionary = {}
  end

  def detect(word)
    (dictionary.fetch(build_key(word), []) - [word]).sort
  end

  private

  def build_key(word)
    word.split('').sort.join
  end

  def dictionary
    return @dictionary if @dictionary.keys.any?
    @words.each do |word|
      key = build_key(word)
      if @dictionary[key]
        @dictionary[key] << word
      else
        @dictionary[key] = [word]
      end
    end
    @dictionary
  end
end