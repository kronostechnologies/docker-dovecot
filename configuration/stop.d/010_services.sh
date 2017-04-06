#!/bin/bash

service dovecot stop
kill -TERM `cat /var/run/confd.pid` && rm /var/run/confd.pid