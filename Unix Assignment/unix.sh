#!/bin/bash
while IFS="," read -r c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10
do
    current=$(date +%Y%m)
    rec=${c7:3}${c7:0:2}
    path="Dir/"$c1"/"$c2
    mkdir -p "$path"
    if [ "$rec" -gt "$current" ];
        then
            path=$path"/"$c3".active.txt"
    else
        path=$path"/"$c3".expired.txt"
    fi           
    echo "Card Type Code: $c0" > "$path"
    echo "Card Type cull Name: $c1" >> "$path"
    echo "Issuing Bank: $c2" >> "$path"
    echo "Card Number: $c3" >> "$path"
    echo "Card Holder's Name: $c4" >> "$path"
    echo "CVV/CVV2: $c5" >> "$path"
    echo "Issue Date: $c6" >> "$path"
    echo "Expiry Date: $c7" >> "$path"
    echo "Billing Date: $c8" >> "$path"
    echo "Card PIN: $c9" >> "$path"
    echo "$c10" | awk '{ printf("Credit Limit: $%'"'"'d USD\n",$1); }' >> "$path"
done < <(tail -n +2 '100 CC Records.csv')