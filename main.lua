-- ############
-- # ptrusted #
-- ############

require "assets/scripts/animator"
require "assets/scripts/objectCreation"
require "assets/scripts/loadProcedure"
require "assets/scripts/scenes/splashScreen"
require "assets/scripts/scenes/mainMenu"
require "assets/scripts/scenes/inGame"

-- ---------------------------------------------------------------------------- main functions
function love.load ()
    loadImages()
    loadSounds()
    loadFonts()
    createGlobalVariables()
    initializeScene(1)
end

function love.draw ()
    Scenes[CounterSelectedScene].draw()
end

function love.update ()
    Scenes[CounterSelectedScene].update()
    timerCountDown()
end

function love.keypressed (key)
    Scenes[CounterSelectedScene].listenerKeyPressed(key)
end

function love.touchpressed (id, x, y, dx, dy, pressure)
    Scenes[CounterSelectedScene].listenerTouchPressed(id, x, y, dx, dy, pressure)
end

-- ---------------------------------------------------------------------------- other functions

function initializeScene (index)
    if index==0 then
        Scenes[CounterSelectedScene].initialize() -- bug solved
    else
        for i=1,3 do
            Scenes[i].initialize() -- bug solved
        end
    end
end

function changeScene (index)
    CounterSelectedScene = index
    initializeScene(0) -- bug solved
end

function timerCountDown ()
    if Scenes[CounterSelectedScene].usingTimer and Scenes[CounterSelectedScene].usingTimer ~= nil then
        if CounterTimer ~= nil then
            if CounterTimer<0 then
                local status,newTimerCounterValue = coroutine.resume(Scenes[CounterSelectedScene].sequenceExecution)
                if status then
                    CounterTimer = newTimerCounterValue
                else
                    CounterTimer = 0
                end
            else
                CounterTimer = CounterTimer - love.timer.getDelta()
            end
        else
            CounterTimer = 0
        end
    end
end