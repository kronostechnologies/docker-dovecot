#!/bin/bash

service dovecot start
/usr/local/bin/confd -backend env -env-sep "__" 2>&1 >> $LOG_OUTPUT_DEV &
