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
## Modifying Fuctionality
To change sampling rate and profile csv name from the default, change the `sample_rate` and `outfile` variables in `profiler.sh`.
- `sample_rate=n`: Data is collected every `n` seconds
  - _Default_: 1
- `outfile=filename`: Data will be outputted to `filename.csv`
  - _Default_: profile_*timestamp*.csv
## Data Format
Data is in a tabular csv format with the following columns
- `pid`: _int_ value of pid if the process is a child process, otherwise its a _string_ value: "parent".
- `time`: _int_ value containing the Unix timestamp of data collection.
- `rss`: _float_ value of the Resident Set Size in MB. This includes shared memory.
- `pss`: _float_ value of the Proportional Set Size in MB. Let $n$ be the number of processes.
$$PSS=USS+Shared/n$$
- `uss`: _float_ value of the Unique Set Size in MB. This is the memory unique to each process.
- `shared`: _float_ value of shared memory, in MB, between processes
- `shared_file`: _float_ value of shared external filesystem memory in MB.
