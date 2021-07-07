require "yaml"

def load_library(path)
  
 
  reality = YAML.load_file(path)
  
  new_hash={}
  key1=:english
  key2=:japanese
  
  reality.each do |x,y|
    y[0]=value1
    y[1]=value2

    new= {y[key1] => [value1],[key2] => [value2]}
    new_hash << new
  end
   return new_hash
end
 