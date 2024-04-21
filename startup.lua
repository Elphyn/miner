-- Startup file



-- Place diskDrive
turtle.select(1)
turtle.place()

-- Select disk
turtle.select(2)

-- Drop disk into diskDrive 
turtle.drop()

-- Links to files 
local client_url = "https://pastebin.com/raw/q94yKfCL"
local server_url = "https://pastebin.com/raw/S3VagiuN"


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
setUp(client_url, "disk/startup")
setUp(server_url, "proj/server")

-- Starting server
shell.run("proj/server")

