# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cocktail_url = 'https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic'

drink_list = open(cocktail_url).read
cocktails = JSON.parse(drink_list)
cocktails['drinks'].each do |drink|
  Cocktail.create!(name: drink['strDrink'], image: drink['strDrinkThumb'])
end

ingredients_url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

ingr_list = open(ingredients_url).read
ingredients = JSON.parse(ingr_list)
ingredients['drinks'].each do |drink|
  Ingredient.create!(name: drink['strIngredient1'])
end
