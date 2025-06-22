#!/bin/bash
cobc -x audit.cob -o audit && ./audit
nano rapport_audit.txt
