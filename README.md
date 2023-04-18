# mp-memprofile
Lightweight memory profiler for Python programs using multiprocessing
## Install
To install and setup the memory profiler, run the following
```
git clone https://github.com/vikramr2/mp-memprofile.git
cd mp-memprofile
chmod +x setup.sh
./setup.sh
```
## Usage
For a python program run via `python script.py <args>`, you can memory profile the program by simply running
```
./profiler.sh python script.py <args>
```
To redirect the python script to a file output and possibly run it in the background while it's being profiled, you can run
```
./profiler.sh python script.py <args> > out.txt &
```
