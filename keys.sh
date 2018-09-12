tail -n +2 /home/jfclere/TMP/Event\ Registration.csv | awk -F, '$1 ~ /^"2/ { print $4 }' | sed 's/"//g'
