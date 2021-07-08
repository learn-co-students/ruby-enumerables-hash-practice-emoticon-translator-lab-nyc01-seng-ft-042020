# require modules here
require 'yaml'
require 'pry'

def load_library(filepath)

file = YAML.load_file(filepath)
hash = {}
file.each do |key, array|
  hash[key.to_s] = {english: array[0], japanese: array[1]}
end
hash
end


def get_english_meaning(filepath, japanese_emoticon)
  # code goes here
  hash = load_library(filepath)
  hash.find do |element|
    if element[1][:japanese] == japanese_emoticon
      return element[0]
    end
  end
  return "Sorry, that emoticon was not found"
end


def get_japanese_emoticon(filepath, english_emoticon)
  # code goes here
  hash = load_library(filepath)
  hash.find do |element|
    if element[1][:english] == english_emoticon
      return element[1][:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end