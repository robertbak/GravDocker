#!/bin/sh
if [-n "${INSTALL##+([[:space:]])}"]; then
  cd /app/public
  bin/gpm install ${INSTALL} -y
fi

httpd -D FOREGROUND