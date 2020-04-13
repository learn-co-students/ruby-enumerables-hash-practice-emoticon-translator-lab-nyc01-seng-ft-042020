# require modules here
require 'yaml'
require 'pry'

=begin 
emoticons # => 

angel:
  - "O:)"      
  - "☜(⌒▽⌒)☞"
angry:
  - ">:("
  - "ヽ(ｏ`皿′ｏ)ﾉ"
bored:
  - ":O"
  - "(ΘεΘ;)"
confused:
  - "%)"
  - "(゜.゜)"
embarrassed:
  - ":$" 
  - "(#^.^#)"
fish:
  - "><>"
  - ">゜))))彡"
glasses:
  - "8D"
  - "(^0_0^)"
grinning:
  - "=D"
  - "(￣ー￣)"
happy:
  - ":)"
  - "(＾ｖ＾)"
kiss:
  - ":*"
  - "(*^3^)/~☆"
sad:
  - ":'("
  - "(Ｔ▽Ｔ)"
surprised:
  - ":o"
  - "o_O"
wink:
  - ";)"
  - "(^_-)"
=end

# emoticons are a hash with key and value = an array 

def load_library(emoticons)
  library = YAML.load_file(emoticons)
  #library = { "angel" => [ "O:)", "☜(⌒▽⌒)☞" ],"angry" => [ ">:(", "ヽ(ｏ`皿′ｏ)ﾉ" ]}
  # TURN INTO    {'happy' => {:english => ":)", :japanese => "(＾ｖ＾)"
  new_hash = {}
  library.each do |emoticon_name, emoticon_array|
      new_hash[emoticon_name.to_s] = {english: emoticon_array[0], japanese: emoticon_array[1]}
  end
  new_hash
end

def get_japanese_emoticon(file_path, english_emoticon)
  library = load_library(file_path)
    library.each do |english_name, emoticon_hash|
        if library[english_name.to_s][:english] == english_emoticon.to_s
          return library[english_name.to_s][:japanese]
        end
    end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, japanese_emoticon)
  library = load_library(file_path)
  library.each do |english_name, emoticon_hash|
    if library[english_name.to_s][:japanese] == japanese_emoticon
      return english_name.to_s
    end
  end
  return "Sorry, that emoticon was not found"
end