function love.conf(t)
    t.window.title = "Brother Cat and His Sister"
    t.window.fullscreen = false
    t.window.fullscreentype = "exclusive"
    t.window.width = 480
    t.window.height = 800
    t.console = true
    t.modules.physics = false
    t.modules.touch = true
    love.filesystem.setIdentity("Brother_Cat_and_His_Sister")
end