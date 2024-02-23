Hosting node.js applications in IIS on Windows
===

# Fork Information

This project is a fork of [Azure/iisnode](https://github.com/Azure/iisnode) which is a fork of [tjanczuk/iisnode](https://github.com/tjanczuk/iisnode).

Unfortunately it looks like neither of these projects are maintained anymore. I created this repo so I can maintain this for my personal projects as well as my work projects.

All copyright credit goes to its respective owners. Please see the LICENSE.txt file for more info. For copyright disputes please reach out to me.

## Goals of this fork
- Make sure iisnode remains compatible with the latest versions of Node.js and IIS/AZURE.
- Make improvements in the code to increase reliability, security and performance where it makes sense.
- Add features that stay true to the projects intention. I.E., providing performant and easy to use, node.js under IIS.
- Restructure the Readme, Wiki, code comments, and build process so they are easier to use. IISnode should be a easy to deploy and use.
- Version the program using Semantic Versioning scheme following Apache Commons recommendation for program release versioning [Info Here](https://commons.apache.org/releases/versioning.html)

## Branches

- **master: stable version.**
- iisnode-dev: development branch.

## Prerequisites for using

- Windows 10,11 or Windows Server 2016, 2019, 2022 (Could work on older workstation/server OSes but is built on and tested for Windows 11 / Server 2022 *Anything older than these are EOL from Microsoft, you are on your own.*)
- IIS 10.x with IIS Management Tools and ASP.NET
- WebSocket functionality requires IIS 8.x on Windows 8 or Windows Server 2012 or newer
- [URL rewrite module for IIS](http://www.iis.net/download/URLRewrite)
- [Latest node.js build for Windows](https://nodejs.org/en/download/current)

## Installing for IIS 10.x

- Install iisnode for IIS 10.x: Download the [Current Release](https://github.com/vifair22/iisnodeRedux/releases) and choose the correct architecture for your system
- To set up samples, from the administrative command prompt run `%programfiles%\iisnode\setupsamples.bat`
- Go to `http://localhost/node`

## Installing for IIS Express/WebMatrix *Deprecated*

- [Install WebMatrix using the Web Platform Installer](http://www.microsoft.com/web/webmatrix/)
- Open WebMatrix, choose “Site from folder”, enter %localappdata%\iisnode\www, start the site, and play with the iisnode samples, or
- Use node.js templates to get started quickly with an Express application or a skeleton Hello World

## Installing for IIS Express 8 on Windows x64 *Deprecated*

This can be a head-scratcher since IIS Express 8 gives you both 32-bit and 64-bit versions (http://www.iis.net/learn/extensions/introduction-to-iis-express/iis-80-express-readme). You can either:
- Install the full x64 version, then in Visual Studio go to Tools > Options > Projects and Solutions > Web Projects > Use the 64 bit version of IIS Express. This way you have a single install for both IIS and IIS Express.
- Separately install iisnode express version (https://github.com/azure/iisnode/wiki/iisnode-releases).


## How-to's
- Links will go here when the wiki is done.

## Prerequisites for building

- [Visual Studio 2022 Community for Windows Desktop](https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/)
- [WIX Toolset v3.14](https://github.com/wixtoolset/wix3/releases)

## Building

For x86 build:

```
msbuild /p:Platform=Win32 src\iisnode\iisnode.sln
```

For x64 build:

```
msbuild /p:Platform=x64 src\iisnode\iisnode.sln
```

## Installing after build

- For IIS 10.x: `build\release\{x64|x86}\iisnode-full.msi`
- For IIS Express 7.x: `build\release\x86\iisnode-express.msi`


## Resources & documentation

- [Releases](https://github.com/vifair22/iisnodeRedux/releases)
