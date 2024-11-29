#!/bin/bash

# ooooo   ooooo               .                                              
# `888'   `888'             .o8                                                                     
#  888     888   .oooo.   .o888oo  .oooo.o oooo  oooo  ooo. .oo.    .ooooo.     
#  888ooooo888  `P  )88b    888   d88(  "8 `888  `888  `888P"Y88b  d88' `88b     
#  888     888   .oP"888    888   `"Y88b.   888   888   888   888  888ooo888      
#  888     888  d8(  888    888 . o.  )88b  888   888   888   888  888    .o        
# o888o   o888o `Y888""8o   "888" 8""888P'  `V88V"V8P' o888o o888o `Y8bod8P'       


pkg upgrade && pkg update
pkg install which
pkg install nodejs -y
pkg install git -y
npm install .
clear
echo -e "[-] Loading..."
chmod +x hatsune.sh
bash hatsune.sh
