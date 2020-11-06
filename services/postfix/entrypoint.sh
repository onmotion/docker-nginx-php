#!/bin/bash

/run.sh &
sleep 10 && postconf -e "relayhost = "
/bin/bash