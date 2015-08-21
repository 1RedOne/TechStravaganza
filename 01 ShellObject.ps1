$a = new-object -comobject wscript.shell
$b = $a.popup(“Have you uninstalled Java from Control Panel? “,0,”Java Folder Removal Tool”,3)    
# to control the icons  4,16,32,64
#+to modify buttons add 1,2,3,4,5


#Response codes
#yes = 6
#no  = 7
#retr
#canc
#abor

if ($b -eq 6){
    #user selected Yes
    "Software already removed, nothing to do"
    }
else {
    #user selected No
    "Proceed to uninstall Java"
    "invoking : msiexec /x {A4BFF20C-A21E-4720-88E5-79D5A5AEB2E8}"
    }

    