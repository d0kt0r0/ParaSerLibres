
# Installation Instructions

## Installation

1. Install git, node.js and SuperCollider (3.7.0 or higher) on your system. Then clone this git repository under your SuperCollider extensions folder and run npm install to grab node.js libraries which are required. For example, on OS X:
```
cd ~/Library/Application\ Support/SuperCollider/Extensions
git clone https://github.com/d0kt0r0/ParaSerLibres.git
cd ParaSerLibres
npm install
```

The above instructions should work on Windows and Linux as well - but you'll have to change the directory specified in the first cd instruction to wherever your SuperCollider extensions folder is located. (This can be determined within SuperCollider by evaluating Platform.userExtensionDir and looking at the result in the Post window.)

## Activating In the Gallery

1. At a terminal, change to the directory where you downloaded the repository and use node to run cosechar.js (which acts as a go-between between SuperCollider and an apert web server somewhere). You need to specify the URL for the apert web server when you launch cosechar.js.  For example, on OS X:
```
cd ~/Library/Application\ Support/SuperCollider/Extensions/ParaSerLibres
node cosechar.js ws://my.great.server:8000
```

2. Launch SuperCollider and boot the audio server with the required number of output channels. Then evaluate the following:
```
ParaSerLibres.cosechar
```

If the apert web server is running and someone is remotely live coding, changes to the code and evaluation of code should now take place automatically. You cannot change the code on this SuperCollider instance. The only ways to "unbind" the relationship are "Language: Reboot Interpreter" from the menu, or quitting SuperCollider.

## For Remote Live Coding

1. At a terminal, change to the directory where you downloaded the repository and use node to run sembrar.js (which acts as a go-between between SuperCollider and an apert web server somewhere). You need to specify the URL for the apert web server when you launch cosechar.js and provide the appropriate password for the server. For example, on OS X:
```
cd ~/Library/Application\ Support/SuperCollider/Extensions/ParaSerLibres
node sembrar.js ws://my.great.server:8000 verySecurePassword
```

2. Launch SuperCollider, boot the audio server with the required number of output channels, and evaluate the following:
```
ParaSerLibres.sembrar
```

If the apert web server is running, your window should be updated with the code currently left in the server, and any changes and evaluations you make will be reflected at all sites where the gallery instructions above have been followed. The only ways to "unbind" the relationship (so that what you type and evaluate don't appear elsewhere anymore) are "Language: Reboot Interpreter" from the menu, or quitting SuperCollider.
