# !/bin/bash
if [ `pgrep apache2 -c` -le "0" ]; then
  /etc/init.d/apache2 stop
  pkill -u www-data  
  /etc/init.d/apache2 start
  echo "Arrancando Apache"
  # Email To ?
  EMAIL="example@example.com"
  # Email text/message
  EMAILMESSAGE="Arrancando Apache"
  # send an email using /bin/mail
  /bin/mail -s "$SUBJECT" "$EMAIL" "$EMAILMESSAGE"
fi
