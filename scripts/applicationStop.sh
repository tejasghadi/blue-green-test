
#!/bin/bash
isExistApp=`pgrep puma`
if [[ -n  $isExistApp ]]; then
    pkill -9 -f 'puma'
fi
