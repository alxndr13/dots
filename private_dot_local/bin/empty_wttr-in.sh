#!/bin/bash

jo text="$(curl wttr.in/Mannheim?format='%c%t+💧+%h\\n')" tooltip="$(curl wttr.in/Mannheim?format=v2)"
