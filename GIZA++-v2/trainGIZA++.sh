#! /bin/csh

echo The .sh arg were passed
if( $# != 3 ) then

 echo Usage: trainGIZA++.sh vcb1 vcb2 snt op-filename
 echo " "
 echo Performs a training of word classes and a standard GIZA training.

else
    echo Number of args passed are correct
    # Debugging message
    echo "Running snt2plain.out $1 $2 $3 PLAIN"
    snt2plain.out $1 $2 $3 PLAIN
    echo The .out is running without errors 
    mkcls -m2 -pPLAIN1.txt -c50 -V$1.classes opt >& mkcls1.log
    echo PLAIN1 is running fine
    rm PLAIN1.txt
    mkcls -m2 -pPLAIN2.txt -c50 -V$2.classes opt >& mkcls2.log
    echo PLAIN2 is running fine
    rm PLAIN2.txt
    GIZA++ -S $1 -T $2 -C $3 -p0 0.98 -o GIZA++ >& GIZA++.log
    echo GIZA training is running without errors

endif
