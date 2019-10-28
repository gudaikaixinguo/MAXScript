--未测试成功

loadMaxFile "foo.max"
for i in cameras  do render camera:
    outputfile:("foo"+i.name + ".jpg")
    
loadMaxFile "baz.max"
for i in cameras  do render camera:
    outputfile:("baz"+i.name + ".jpg")
quitMax #noPrompt

