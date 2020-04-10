# require modules here
require 'pry'
require 'yaml'

def load_library(emoticon_file)
  library = YAML.load_file('./lib/emoticons.yml')
  emoticon_library = {}
  library.each do |key, value|
    emoticon_library[key] = {}
    english = value[0]
    japanese = value[1]
    emoticon_library[key][:english] = english
    emoticon_library[key][:japanese] = japanese
  end
  emoticon_library
end

def get_japanese_emoticon(emoticon_file = './lib/emoticons.yml', emoticon)
  emoticon_library = load_library(emoticon_file)
  test = emoticon_library.keys.find do |english_emoticon|
    emoticon_library[english_emoticon][:english] == emoticon
  end
  if test
    return emoticon_library[test][:japanese]
  else
    return "Sorry, that emoticon was not found"
  end
end


def get_english_meaning(emoticon_file = './lib/emoticons.yml', emoticon)
  emoticon_library = load_library(emoticon_file)
  meaning = emoticon_library.keys.find do |japanese_emoticon|
    emoticon_library[japanese_emoticon][:japanese] == emoticon
  end
  if meaning
    return meaning
  else
    return "Sorry, that emoticon was not found"
  end
end
