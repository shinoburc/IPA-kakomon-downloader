#!/bin/sh

START_YEAR=2004
END_YEAR=2014

PDF_URL="pdf-url.txt"

sh ./scripts/get-pdf-url.sh > $PDF_URL

for year in `seq $START_YEAR 1 $END_YEAR`
do
  for KIND in fe ap koudo st sa nw sc sm pm db au
  do
    for SEASON in `seq 1 1 2`
    do
      mkdir -p windows/kakomon/$year/$KIND/$SEASON
      cp ./scripts/download_pdf.bat windows/kakomon/$year/$KIND/$SEASON/.
      cp ./scripts/wget-list.ps1 windows/kakomon/$year/$KIND/$SEASON/.
      fgrep $year $PDF_URL | fgrep -e a_"$KIND"_ -e h_"$KIND"_ | grep _"$SEASON"/ > windows/kakomon/$year/$KIND/$SEASON/url.txt

      mkdir -p linux/kakomon/$year/$KIND/$SEASON
      cp ./scripts/download_pdf.sh linux/kakomon/$year/$KIND/$SEASON/.
      fgrep $year $PDF_URL | fgrep -e a_"$KIND"_ -e h_"$KIND"_ | grep _"$SEASON"/ > linux/kakomon/$year/$KIND/$SEASON/url.txt
    done
  done
done
