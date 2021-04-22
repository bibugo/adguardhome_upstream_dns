#!/bin/bash

SOURCE="https://raw.githubusercontent.com/felixonmars/dnsmasq-china-list/master/accelerated-domains.china.conf"
OUTPUT="upstream_dns_file.txt"
DNS="202.96.128.86"

curl -4sSkL $SOURCE | awk -F "\/" '{print $2}' | {
    echo -n "[/" > $OUTPUT
    while read line; do
        echo -n "${line}/" >> $OUTPUT
    done
    echo "]${DNS}" >> $OUTPUT
    echo "tls://1.1.1.1" >> $OUTPUT
    echo -n "tls://1.0.0.1" >> $OUTPUT
}