require "defines"
require "GUI"

taxiStations = {"#callFARL", "#callSupply"}

function createMainUI(player)
  if player.gui.left.trainTaxi then
    player.gui.left.trainTaxi.destroy()
  end
  GUI.add(player.gui.left, {type="frame", name="trainTaxi", direction="vertical", style="outer_frame_style"})
end

function onTrainStopOpened(player)
  player.print("Opened")
  local ui = GUI.add(player.gui.left.trainTaxi, {type="table", name="ui", colspan="1"})
  for i,s in pairs(taxiStations) do
    GUI.addButton(ui, {name="setName"..i, caption=s}, GUI.rename)
  end
end

function onTrainStopClosed(player)
  player.print("Closed")
  player.gui.left.trainTaxi.ui.destroy()
end

function ontick(event)
  if event.tick%10==8  then
    for pi, player in ipairs(game.players) do
      if not player.gui.left.trainTaxi then
        createMainUI(player)
      end
      if player.opened ~= nil and player.opened.valid then
        if player.opened.type == "train-stop" then
          if player.gui.left.trainTaxi.ui == nil then
            onTrainStopOpened(player)
          end
        end
      elseif player.opened == nil then
        local gui=player.gui.left.trainTaxi.ui
        if gui then
          onTrainStopClosed(player)
        end
      end
    end
  end
end

function onguiclick(event)
  local index = event.playerindex or event.name
  local player = game.players[index]
  if player.gui.left.trainTaxi ~= nil and player.gui.left.trainTaxi.ui ~= nil then
      GUI.onGuiClick(event, player)
  end
end

game.onevent(defines.events.ontick, ontick)
game.onevent(defines.events.onguiclick, onguiclick)
