#!/bin/bash

if [ $# -ne 4 ]; then
	echo "Usage: trainGIZA++.sh vcb1 vcb2 snt out"
	echo ""
	echo "Performs a training of word classes and a standard GIZA training."
else
	echo "Number of args is correct"

	vcb1="$1"
	vcb2="$2"
	snt="$3"
	out="$4"

	./snt2plain.out "$vcb1" "$vcb2" "$snt" "$out"
	mkcls -m2 -p"${out}1.txt" -c50 -V"$vcb1.classes" opt >& mkcls1.log
	rm "${out}1.txt"
	mkcls -m2 -p"${out}2.txt" -c50 -V"$vcb2.classes" opt >& mkcls2.log
	rm "${out}2.txt"
	./GIZA++ -S "$vcb1" -T "$vcb2" -C "$snt" -p0 0.98 -o GIZA++ >& GIZA++.log

fi
