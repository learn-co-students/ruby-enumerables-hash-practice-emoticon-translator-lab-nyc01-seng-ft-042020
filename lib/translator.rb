# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  # code goes here
  updated_library = {}
  YAML.load_file(file_path).each do |key, values|
    updated_library[key] ||= {}
    updated_library[key][:english] = values[0]
    updated_library[key][:japanese] = values[1]
      # binding.pry
  end
  updated_library
end

def get_english_meaning(file_path, japanese_emoticon)
  # code goes here
  updated_library = load_library(file_path)
  updated_library.find do |item|
    # binding.pry
    if item[1][:japanese] == japanese_emoticon
      return item[0]
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_japanese_emoticon(file_path, english_emoticon)
  # code goes here
  updated_library = load_library(file_path)
  updated_library.find do |item|
    # binding.pry
    if item[1][:english] == english_emoticon
      return item[1][:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end
