if mods["SchallCircuitGroup"] then
  data.raw.item["compaktcircuit-processor"].subgroup = "circuit-network"
  data.raw.item["compaktcircuit-processor_1x1"].subgroup = "circuit-network"

  data.raw.item["compaktcircuit-input"].subgroup = "circuit-combinator"
  data.raw.item["compaktcircuit-internal_iopoint"].subgroup = "circuit-input"
  data.raw.item["compaktcircuit-display"].subgroup = "circuit-visual"
end
