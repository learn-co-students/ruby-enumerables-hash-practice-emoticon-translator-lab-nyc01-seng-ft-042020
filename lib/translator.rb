require "yaml"
require "pry"
 
def load_library(file_path)

  emoticons=YAML.load_file(file_path)
  
  new_hash={}
  key1=:english
  key2=:japanese
  
  emoticons.each do |x,y|
    value1=y[0]
    value2=y[1]
    
    new_hash[x]={}
    new_hash[x][key1]=value1
    new_hash[x][key2]=value2
   
   
  end
    new_hash
end


def get_english_meaning(file_path, emoticon)
  new_hash = load_library(file_path)
  new_hash.each do |x,y|
    if new_hash[x][:japanese] == emoticon
     return x
    end
  end
  return "Sorry, that emoticon was not found"
end


def get_japanese_emoticon(file_path, emoticon)
  
  new_hash=load_library(file_path)
  new_hash.each do |x,y|
    japanese_version= new_hash[x][:japanese]
    english_version = new_hash[x][:english]
        if english_version == emoticon
          return japanese_version
    end
   end
  return "Sorry, that emoticon was not found"
end


