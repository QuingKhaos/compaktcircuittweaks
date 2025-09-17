if settings.startup["compaktcircuittweaks-recipe-tech-overhaul"].value then
  for _, recipe in pairs({"compaktcircuit-processor", "compaktcircuit-processor_1x1"}) do
    local ingredient = nil
    local replacement_amount = 0

    for _, ingredient_to_remove in pairs({"advanced-circuit", "processing-unit"}) do
      for i = 1, #data.raw.recipe[recipe].ingredients do
        ingredient = data.raw.recipe[recipe].ingredients[i]
        if ingredient.name == ingredient_to_remove then
          replacement_amount = replacement_amount + ingredient.amount
          table.remove(data.raw.recipe[recipe].ingredients, i)
          break
        end
      end
    end

    for i = 1, #data.raw.recipe[recipe].ingredients do
      ingredient = data.raw.recipe[recipe].ingredients[i]
      if ingredient.name == "electronic-circuit" then
        data.raw.recipe[recipe].ingredients[i].amount = ingredient.amount + replacement_amount
        break
      end
    end
  end

  data.raw.technology["compaktcircuit-tech"].prerequisites = {"circuit-network"}
  for i = 1, #data.raw.technology["compaktcircuit-tech"].unit.ingredients do
    ingredient = data.raw.technology["compaktcircuit-tech"].unit.ingredients[i]
    if ingredient[1] == "chemical-science-pack" then
      table.remove(data.raw.technology["compaktcircuit-tech"].unit.ingredients, i)
      break
    end
  end
end
