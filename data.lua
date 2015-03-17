data:extend(
  {
    {
      type = "font",
      name = "trainTaxi-small",
      from = "default",
      size = 13
    },
    {
      type ="font",
      name = "trainTaxi-small-bold",
      from = "default-bold",
      size = 13
    }
  })

data.raw["gui-style"].default["trainTaxi_frame"] =
  {
    type = "frame_style",
    parent="frame_style",
    top_padding  = 2,
    bottom_padding = 2,
    font = "trainTaxi-small-bold",
    flow_style =
    {
      max_on_row = 1,
      resize_row_to_width = false
    }
  }
data.raw["gui-style"].default["trainTaxi_button"] =
  {
    type = "button_style",
    parent = "default",
    font = "trainTaxi-small-bold"
  }
