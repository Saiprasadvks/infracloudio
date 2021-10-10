for n in {0..15}; do printf "%2d, %s\n" $n $(echo $((RANDOM%200+1))); done  > /csvserver/inputfile
chmod o+r /csvserver/inputfile
