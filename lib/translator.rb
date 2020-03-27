require "yaml"
def load_library(file)

  lo = YAML.load_file(file)
  hash = {:get_meaning => {}, :get_emoticon => {}}
  
  lo.each do |value, key|
    hash[:get_meaning][key[0]] = hash[value][1]
    
    hash[:get_emoticon][key[1]] = value
  end
hash
end
def get_japanese_emoticon( file,emoji)
  loading = load_library(file)
  if loading[:get_emoticon].include?(emoji) 
    
    loading[:get_emoticon][emoji]
    
  else
    "Sorry, that emoticon was not found"
  end
  
end

def get_english_meaning(file , emoji)
  loading = load_library(file)
   if loading[:get_meaning].include?(emoji) 
     
    loading[:get_meaning][emoji]
    
  else
    "Sorry, that emoticon was not found"
    
  end

end