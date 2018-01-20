# !/bin/bash
if [ `pgrep mysql -c` -le "0" ]; then
  /etc/init.d/mysql stop
  /etc/init.d/mysql start
  echo "Arrancando MySQL"
fi
