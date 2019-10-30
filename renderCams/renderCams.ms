
path = "C:\\Users\\gudai\\Desktop\\MAXScript\\renderCams"
loadMaxFile(path+"\\"+ foo.max")
for i in cameras  do render camera:
    outputfile:(path+"\\"+i.name + ".jpg")
    
    loadMaxFile(path+"\\"+ baz.max")
for i in cameras  do render camera:
    outputfile:(path+"\\"+i.name + ".jpg")

quitMax #noPrompt

