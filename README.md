art compiler<br>script helps you to compile and launch your program<br>
with 0 arguments, with multiple arguments, with preset argument<br>
and save history of your compilations and launches

    q.sh arg1 arg2 arg3 ...	            compile and launch with multiple arguments
	q.sh                                compile and launch with preset argument
    q.sh -0                             compile and launch without arguments
    q.sh -f						        show used functions in your executable file
    q.sh -o						        open project folder in Finder
    q.sh -c						        show colored compiler's errors
    q.sh -v						        edit preset argument
    q.sh -t						        show time for executable
    q.sh -l						        show log file
    q.sh -h						        or --help to show this help
    
Copy/paste to terminal

    git clone https://github.com/amkv/art-compiler.git art-compiler
    chmode 755 q.sh<br>
    ./q.sh

don't forget to configure
`vim q.sh`
