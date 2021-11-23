

run:
	web-ext run -s src/

run-chrome:
        # https://github.com/mozilla/web-ext/issues/809
        #/Applications/Chromium.app/Contents/MacOS/Chromium --temp-profile --password-store=basic --load-extension=src/ about:blank
        web-ext run -t 'chromium' --chromium-binary /Applications/Chromium.app/Contents/MacOS/Chromium -s src/

build:
	bash build.sh

update-git:
	git submodule init
	git submodule update


sign:
        #!/usr/bin/env bash
        set -euo pipefail
        cd src
        if [ -z ${WEB_EXT_API_KEY+x} ]; then
                read -s -p "WEB_EXT_API_KEY: " WEB_EXT_API_KEY
                echo
        fi
        if [ -z ${WEB_EXT_API_SECRET+x} ]; then
                read -s -p "WEB_EXT_API_SECRET: " WEB_EXT_API_SECRET
                echo
        fi
        web-ext sign --api-key $WEB_EXT_API_KEY --api-secret $WEB_EXT_API_SECRET


