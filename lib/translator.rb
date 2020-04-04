# require modules here
# require 'pry'
require 'yaml'
#emoticons = YAML::load_file(File.join(__dir__, 'emoticons.yml'))
lib = './lib/emoticons.yml'


def load_library(lib)
  emoticons = YAML.load_file(lib)
  new_hash = {}
   emoticons.each do |name, versions|


       if !new_hash.has_key?(name)
         new_hash[name]={}
       end

      if !new_hash[name].has_key?(:english)
        new_hash[name][:english] = versions[0]
       end

       if !new_hash[name].has_key?(:japanese)
         new_hash[name][:japanese] = versions[1]
        end


   end
  new_hash
end

def get_english_meaning(file_path = './lib/emoticons.yml', japanese_emoticon)
  library = load_library(file_path)
  result = "Sorry, that emoticon was not found"

    library.each do |name, versions|
      versions.each do |lang, emoji|

      if emoji.include?(japanese_emoticon)
        result = name
      end

    end
  end

result
end

def get_japanese_emoticon(file_path = './lib/emoticons.yml', english_emoticon)
  library = load_library(file_path)
  result = "Sorry, that emoticon was not found"

    library.each do |name, versions|
      versions.each do |lang, emoji|

      if emoji.include?(english_emoticon)
        result = versions[:japanese]
      end

    end
  end

result
end
