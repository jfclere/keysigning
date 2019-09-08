tail -n +2 ./Event\ Registration.csv | awk -F, '$1 ~ /^"2/ { print $4 }' | sed 's/"//g' > keys.all
