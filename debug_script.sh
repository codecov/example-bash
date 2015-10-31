#!/bin/sh

echo
echo define parseable prompt for bash debug
export PS4='%(+CODECOV$(cd $(dirname ${BASH_SOURCE[0]}); pwd)/$(basename ${BASH_SOURCE[0]})/${LINENO}: )'
echo PS4 = $PS4

echo
echo "debug script (-x), get only the debug output"
bash -x script.sh |& sed -n /^%\(+CODECOV/p | sort -t: -k1

echo 
echo "code coverage report:"
bash -x script.sh |& sed -n /^%\(+CODECOV/p | cut -d: -f1 | sort | uniq -c

echo
echo As you can see, line 24 executed is the start for a here document. So all lines till is EOF word are really covered
cat -n script.sh | tail 
echo
echo parser should notice that and add those lines to covered ones.
tail -n+24 script.sh | sed 's/^/\t1 %(+CODECOV... /'
