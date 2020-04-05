require 'yaml'
require 'pp'
require 'pry'

def load_library (file_path)
  emoticons = YAML.load_file(file_path)
  
  hash = {}
    emoticons.each do |meaning, emoticon|
      hash[meaning] = {}
      hash[meaning][:english] = emoticon[0]
      hash[meaning][:japanese] = emoticon[1]
      #binding.pry
    end
  return hash
  
end

def get_japanese_emoticon(file_path, american_emoji)
  hash = load_library(file_path)
  
  hash.each do |meaning, emoticon|
    if hash[meaning][:english] == american_emoji
      return hash[meaning][:japanese]
    elseif american_emoji == nil 
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, japanese_emoji)
  hash = load_library(file_path)
  
  hash.each do |meaning, emoticons| 
    if emoticons[:japanese] == japanese_emoji 
      return meaning
    end
  end
  return "Sorry, that emoticon was not found"
  
end

