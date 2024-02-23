Hosting node.js applications in IIS on Windows
===

# Fork Information

This project is a fork of [Azure/iisnode](https://github.com/Azure/iisnode) which is a fork of [tjanczuk/iisnode](https://github.com/tjanczuk/iisnode).

Unfortunately it looks like neither of these projects are maintained anymore. I created this repo so I can maintain this for my personal projects as well as my work projects.

All copyright credit goes to its respective owners. Please see the LICENSE.txt file for more info.

## Goals of this fork
- Make sure iisnode remains compatible with the latest versions of Node.js and IIS/AZURE.
- Make improvements in the code to increase reliability, security, and performance where it makes sense.
- Add features that stay true to the projects intention. I.E., providing performant and easy to use, node.js under IIS.
- Restructure the Readme, Wiki, code comments, and build process so they are easier to use. IISnode should be a easy to deploy and use.
- Version the program using Semantic Versioning scheme following Apache Commons recommendation for program release versioning [Info Here](https://commons.apache.org/releases/versioning.html)

## Branches

- **master: stable version.**
- iisnode-dev: development branch.

## Prerequisites for using

- Windows 10,11 or Windows Server 2016, 2019, 2022 (Could work on older workstation/server OSes but is built on and tested for Windows 11 / Server 2022. *Anything older than these are EOL from Microsoft, you are on your own.*)
- IIS 10.x with IIS Management Tools and ASP.NET
- WebSocket functionality requires IIS 8.x on Windows 8 or Windows Server 2012 or newer
- [URL rewrite module for IIS](http://www.iis.net/download/URLRewrite)
- [Latest node.js build for Windows](https://nodejs.org/en/download/current)

## Installing for IIS 10.x

- Install iisnode for IIS 10.x: Download the [Current Release](https://github.com/vifair22/iisnodeRedux/releases) and choose the correct architecture for your system
- To set up samples, from the administrative command prompt run `%programfiles%\iisnode\setupsamples.bat`
- Go to `http://localhost/node`


## Getting Started with IISnode
1. Install the IIS feature
2. Install the [URL rewrite module for IIS](http://www.iis.net/download/URLRewrite)
3. [Latest node.js build for Windows](https://nodejs.org/en/download/current)
4. Install the latest [Release of IISnode](https://github.com/vifair22/iisnodeRedux/releases)
5. Add IISnode as a [Managed Module](https://github.com/vifair22/iisnodeRedux/wiki/How-to-add-IISnode-as-a-Native-Module) in IIS (this is done by the MSI in recent versions)
6. Setup a new site in your IIS manager
7. Put a basic `web.config` like this in your `wwwroot`
```xml
<?xml version="1.0" encoding="UTF-8"?>
<configuration>
    <system.webServer>
        <iisnode 
            nodeProcessCommandLine="C:\Program Files\nodejs\node.exe"
            watchedFiles="*.js;node_modules\*;routes\*.js;views\*.pug;api\*.js"
            loggingEnabled="true"
        />
        <handlers>
            <add name="iisnode" path="entry.js" verb="*" modules="iisnode" resourceType="File" requireAccess="Script" />
        </handlers>
        <rewrite>
            <rules>
                <rule name="ReqToServerjs">
                    <match url=".*" />
                    <action type="Rewrite" url="entry.js" />
                </rule>
            </rules>
        </rewrite>
</configuration>

```
8. Setup a simple Node.js server under `entry.js`
```js
const http = require('http');

http.createServer((req, res) => {

    res.writeHead(200, {'Content-Type': 'application/json'});
    
 res.end(JSON.stringify({
  
  name: "Nodejs IIS!",
  iisnodeV : process.env.IISNODE_VERSION,
  nodeV : process.version,
 
 }));
 
}).listen(process.env.PORT);
```



## How-to's
- [How to add IISnode as a Native Module](https://github.com/vifair22/iisnodeRedux/wiki/How-to-add-IISnode-as-a-Native-Module)
- [A simple Server](https://github.com/vifair22/iisnodeRedux/wiki/The-Easy-Way)
- [Mixed content](https://github.com/vifair22/iisnodeRedux/wiki/The-Ideal-Way) (Dynamic and Static)
- [An in production example](https://github.com/vifair22/iisnodeRedux/wiki/All-In)

## Prerequisites for building

- [Visual Studio 2022 Community for Windows Desktop](https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/)
- [WIX Toolset v3.14](https://github.com/wixtoolset/wix3/releases)


## Resources & documentation

- [Releases](https://github.com/vifair22/iisnodeRedux/releases)
