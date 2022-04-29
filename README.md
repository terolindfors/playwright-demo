# playwright-demo

Simple robotframework tests for demoing the use of Playwright traces with Browserlib
## Dependencies
- Python 3.7.5 or newer
- robotframework 4.1.3 (requirements.txt)
- robotframework-browser 11.4.0 (requirements.txt)
- rpaframework 13.0.0 (requirements.txt)
- *tested to work with node.js v16.14.0 & pip ver. 20.0.2 & chromium-browser ver. 1:85.0.4183.83-0ubuntu0.20.04.2 (ubuntu20 specific)*

## Setting up robot-fw, Browserlib and Playwright
- Create and activate new python virtualenv
- Install node.js (for Ubuntu e.g. these instructions https://computingforgeeks.com/how-to-install-node-js-on-ubuntu-debian/)
- `pip3 install -r conf/requirements.txt` (in linux)
- `rfbrowser init`
- Check that you have at least one of these installed: Chromium, Firefox, WebKit

  chromium can be installed in Ubuntu e.g. with `sudo apt install --assume-yes chromium-browser`