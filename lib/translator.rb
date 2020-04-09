# require modules here
require "yaml"
require "pry"

def load_library(path)
  lib = YAML.load_file(path)
  data = {}

  lib.each do |key, value|
    data.merge!({key => { :english => value[0], :japanese => value[1] }})
  end
  data
end

def get_japanese_emoticon(path, emoticon)
  # code goes here
  jap_emoticon = load_library(path)
  jap_emoticon.find do |item|
    if item[1][:english] == emoticon
      return item[1][:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
  #binding.pry
end

def get_english_meaning(path, emoticon)
  # code goes here
  data = load_library(path)
  data.each do |key, value|
    value.each do |language, sign|
      if sign == emoticon
        return key
      end
    end
  end
  return "Sorry, that emoticon was not found"
end
