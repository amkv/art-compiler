script helps you to compile and launch your program

    q.sh		     compile and launch with preset argument
    q.sh arg1 <...>  compile and launch with multiple arguments
    q.sh -0		     compile and launch without arguments
    q.sh -a		     edit preset argument
    q.sh -c		     show colored compiler's errors
    q.sh -f		     edit/add project's *.c files
    q.sh -h		     or --help to show this help
    q.sh -l		     show log file
    q.sh -n		     check project's files with normenette
    q.sh -o		     open project folder in Finder
    q.sh -t		     show time for executable
    q.sh -u		     show used functions in your executable file
    
Copy/paste to terminal

    git clone https://github.com/amkv/art-compiler.git art-compiler
    chmode 755 q.sh
    ./q.sh

don't forget to configure
`vim q.sh`
