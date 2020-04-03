require 'pry'
require 'yaml'

def load_library(path)
  emoticons = YAML.load_file(path)
  
  emoticon_names = {}

    emoticons.each do |name, symbol|
   
      if !emoticon_names[name]
        emoticon_names[name] = {:english => symbol[0], :japanese => symbol[1]}
      end 
      
    end
   
  emoticon_names
end


def get_japanese_emoticon(path, symbol)
  each_emoticon = load_library(path)
  
    each_emoticon.each do |name, value|
      
      if each_emoticon[name][:english] == symbol
        return each_emoticon[name][:japanese] 
      end 
      
    end
    
    "Sorry, that emoticon was not found"
end


# takes a Japanese emoticon and returns its name in #English. 

def get_english_meaning(path, symbol)
  each_emoticon = load_library(path)
  
    each_emoticon.each do |name, value|
      
      if each_emoticon[name][:japanese] == symbol
        return name
      end 
      
    end
    
   "Sorry, that emoticon was not found"
end