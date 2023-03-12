#!/bin/bash

google_cal_url="${1}"
tmeid="$(echo "${google_cal_url}" | grep -Po "(?<=tmeid=)(.*)(?=&)")"

echo "Calendar Event Url to Deeplink:"
echo "https://www.google.com/calendar/event?eid=$tmeid"

