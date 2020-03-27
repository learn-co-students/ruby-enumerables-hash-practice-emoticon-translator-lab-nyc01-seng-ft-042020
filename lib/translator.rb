# require modules here
require "yaml"
require "pry"

def load_library(file_path)
  library = YAML.load_file(file_path)
  dict = {"get_meaning" => {}, "get_emoticon" => {}}
  library.each do |meaning, emoticons|
    dict["get_meaning"][emoticons[1]] = meaning
    dict["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  dict
end

def get_japanese_emoticon(file_path = './lib/emoticons.yml', english_emoticon)
  dict = load_library(file_path)
  if dict["get_emoticon"].include?(english_emoticon) 
    dict["get_emoticon"][english_emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path = './lib/emoticons.yml', japanese_emoticon)
  dict = load_library(file_path)
  if dict["get_meaning"].include?(japanese_emoticon) 
    dict["get_meaning"][japanese_emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end