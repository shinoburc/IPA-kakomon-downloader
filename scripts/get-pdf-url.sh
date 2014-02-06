#!/bin/sh

IPA_BASE_URL="http://www.jitec.ipa.go.jp/1_04hanni_sukiru"

START_YEAR=2004
END_YEAR=2013


# 1. get IPA mondai_kaitou html pages.
# 2. parse pdf url link
for year in `seq $START_YEAR 1 $END_YEAR`
do
  wareki=`expr $year - 1988`
  wget -q "$IPA_BASE_URL"/mondai_kaitou_"$year"h"$wareki".html -O - | nkf -w | fgrep '.pdf' | sed -e 's/[^"]*"\([^"]*\)".*/\1/' | fgrep '.pdf' | sed -e "s|^|$IPA_BASE_URL/|"
done


# 1. get IPA mondai_kaitou html pages.
#fgrep '.pdf' mondai_kaitou_2013h25.html | sed -e 's/[^"]*"\([^"]*\)".*/\1/' | fgrep '.pdf'
