# require modules here
require 'yaml'
require 'pry'
def load_library(path)
  # code goes here
 emoji_hash = YAML.load_file('lib/emoticons.yml')
=begin
 display_hash = {
   emoji_hash.keys[0] => {
     :english => emoji_hash.values[0][0],
     :japanese => emoji_hash.values[0][1]
   }
 }
=end
 display_hash = {}
 counter = 0
 while counter < emoji_hash.length do
   a_new_hash_element = {emoji_hash.keys[counter] => {
     :english => emoji_hash.values[counter][0],
     :japanese => emoji_hash.values[counter][1]
   }
 }
   display_hash.merge!(a_new_hash_element)
   counter += 1
 end
 return display_hash
 end

def get_japanese_emoticon(path, emoticon)
  # code goes here
  display_hash = load_library(path)
  counter = 0
  while counter < display_hash.length do
    if display_hash[display_hash.keys[counter]][:english] == emoticon
      return display_hash[display_hash.keys[counter]][:japanese]
    end
    counter += 1
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(path,emoji)
  display_hash = load_library(path)
  counter = 0
  while counter < display_hash.length do
    if display_hash[display_hash.keys[counter]][:japanese] == emoji
      return display_hash.keys[counter]
    end
    counter += 1
  end
  return "Sorry, that emoticon was not found"
  # code goes here
end
