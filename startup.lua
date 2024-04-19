-- Startup file


-- Links to files 
local client_url = "https://pastebin.com/raw/q94yKfCL"
local tunnel_url = "https://pastebin.com/raw/nJb1NkP8"


-- Function that downloads files
local function setUp(url, path)
    
    local response = http.get(url)
    if response then
        local code = response.readAll()
        print("Reading is done")
        response.close()
        local file = fs.open(path, "w")
        print("Created file in /", path)
        file.write(code)
        file.close()
        print("Success!")
    else
        print("Fail")
    end
end

-- Downloading files
setUp(client_url, "proj/client")
setUp(tunnel_url, "proj/tunnel")

-- Running client file
shell.run("proj/client")

