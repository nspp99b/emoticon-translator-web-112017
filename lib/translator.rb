require "yaml"
require "pry"

def load_library(path)
  yaml_hash = YAML.load_file(path)
  new_hash = { "get_meaning" => {}, "get_emoticon" => {} }
  yaml_hash.each do |meaning, emo_array|
    new_hash["get_meaning"][emo_array[1]] = meaning
    new_hash["get_emoticon"][emo_array[0]] = emo_array[1]
  end
  new_hash
end

def get_japanese_emoticon(path, english_emoticon)
  new_hash = load_library(path)
  if new_hash["get_emoticon"].has_key?(english_emoticon)
    new_hash["get_emoticon"][english_emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, japanese_emoticon)
  new_hash = load_library(path)
  if new_hash["get_meaning"].has_key?(japanese_emoticon)
    new_hash["get_meaning"][japanese_emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end
