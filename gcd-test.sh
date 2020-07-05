#!/bin/sh

tmp=/tmp/$$
echo "input 2 arguments" > $tmp-args
echo "input natural number" > $tmp-nat

ERROR_EXIT () {
echo "$1" >&2
rm -f $tmp-*
exit 1
}

# test1: 正しい結果が出力されない
./gcd.sh 2 4 > /tmp/result-$$
echo "2" > /tmp/ans-$$
diff /tmp/ans-$$ /tmp/result-$$ || exit 1
rm /tmp/ans-$$ /tmp/result-$$

# test2: 引数の数が⾜りない
./gcd.sh 3 2> $tmp-ans && ERROR_EXIT "error in test2-1"
diff $tmp-ans $tmp-args || ERROR_EXIT "error in test2-2"

# test3: 整数が入力されていない
./gcd.sh a b 2> $tmp-ans && ERROR_EXIT "error in test3-1"
diff $tmp-ans $tmp-nat || ERROR_EXIT "error in test3-2"
