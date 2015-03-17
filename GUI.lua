GUI = {

    styleprefix = "trainTaxi_",

    defaultStyles = {
      label = "label",
      button = "button",
      checkbox = "checkbox"
    },

    bindings = {},

    callbacks = {},

    new = function(index, player)
      local new = {}
      setmetatable(new, {__index=GUI})
      return new
    end,

    init = function()
      GUI.bindings = {
        }
    end,

    add = function(parent, e, bind)
      local type, name = e.type, e.name
--      if not e.style and GUI.defaultStyles[type] then
--        e.style = GUI.styleprefix..type
--      end
      if bind then
        if e.type == "checkbox" then
          e.state = GUI.bindings[e.name]
        end
      end
      local ret = parent.add(e)
      if bind and e.type == "textfield" then
        ret.text = bind
      end
      return ret
    end,

    addButton = function(parent, e, bind)
      e.type = "button"
      if bind then
        GUI.callbacks[e.name] = bind
      end
      return GUI.add(parent, e, bind)
    end,

    onGuiClick = function(event, player)
      local name = event.element.name
      if GUI.callbacks[name] then
        return GUI.callbacks[name](event, player)
      end
    end,
    
    rename = function(event, player)
      local station = player.opened
      local name = event.element.caption
      player.print("clicked on"..name)
      station.backername = name
    end
}
