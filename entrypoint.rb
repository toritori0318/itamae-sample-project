# environment
if node["environment"] then
  include_recipe node["environment"]
end

# recipes
node["recipes"] = node["recipes"] || []
node["recipes"].each do |recipe|
  include_recipe recipe
end
