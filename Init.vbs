Set objFSOa = CreateObject("Scripting.FileSystemObject")
Set objFilea = objFSOa.GetFile("vertion.jarvis")
Set objReadFilea = objFSOa.OpenTextFile("vertion.jarvis", 1)
strContentsa = objReadFilea.ReadAll
y=inputbox("INITIATION CODE : ","DEFENDIT" + strContentsa)
if y = 8989 then
dim shell
   set shell=createobject("wscript.shell")
   shell.run "start.bat",3
else
x=msgbox("ACCESS DENIED ! ",1+15,"DEFENDIT")
end if