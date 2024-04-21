-- Download file

print("Enter Url of pastebin code: ")
local code = io.read("*l")
local url = string.format("https://pastebin.com/raw/%s", code)
 
 
local response = http.get(url)
if response then
    local code = response.readAll()
    response.close()
    
    print("Enter name of the file:")
    local name = io.read("*l")
    local file = fs.open(name, "w")
    file.write(code)
    file.close()
    print("Success!")
else
    print("Fail")
end