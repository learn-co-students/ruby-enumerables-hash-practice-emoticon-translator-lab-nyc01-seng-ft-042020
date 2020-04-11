# require modules here
require 'pry'
require 'yaml'

#def load_library
  # code goes here
  def load_library(file_path)
  library = YAML.load_file('./lib/emoticons.yml')
  result = {}
  library.each do |meaning, emoticons|
    result[meaning] = {}
    english = emoticons[0]
    japanese = emoticons[1]
    result[meaning][:english] = english
    result[meaning][:japanese] = japanese
  end
  result
end


def get_japanese_emoticon(file_path = './lib/emoticons.yml', english_emoticon)
  result = load_library(file_path)
  test = result.keys.find do |emoticon|
    result[emoticon][:english] == english_emoticon

  end
  test ? result[test][:japanese] : "Sorry, that emoticon was not found"
  # code goes here
end

def get_english_meaning(file_path = './lib/emoticons.yml', japanese_emoticon)
  result = load_library(file_path)
  test = result.keys.find do |emoticon|
    result[emoticon][:japanese] == japanese_emoticon

  end
  test ? test : "Sorry, that emoticon was not found"

  # code goes here
end
