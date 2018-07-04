# jobExecutor
=============

Search Engine using Processes with Signal Handling and log-files

run: ./jobExecutor -d docfile -w numWorkers [-sorted]
	docfile: has paths of directories that have text files to insert in
				trie and search words from those files.
	numWorkers: number of workers(child processes)

JobExecutor(parent) seperates input paths into his workers.Each one of
them initialize his own map/trie from files he got from parent.
Parent passes user commands to every child and get results.Then compare-
merge their replies and prints final result.Also saving results from
every worker into his log-file.

If any worker terminated,jobExecutor creates a new one with the same files
and after that continues to wait for user commands.

InterProcessCommunication: with Named Pipes(FIFOS)

BashScripts:
	1) total number of searched words.
	2) most frequently found word(in different files)
	3) least frequently found word(in different files)

Commands: (user input)
	1) /wc: like the known linux command for all given directories
	2) /mincount word: returns the file that HAS the word,which word
						appears the fewest times and its frequency.
	3) /maxcount word: returns the file that HAS the word,which word
						appears the most times and its frequency.
	4) /search word1 ... wordN -d deadline(maxN=10): prints all lines that
						have at least one of the given words.If any worker
						hasn't replied after the deadline, jobExecutor
						stops waiting for his answer and give him a signal
						to stop searching.
	5) /exit: stops workers,then frees allocated space and then terminates.
