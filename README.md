# Bloom filter demo in Ruby #

A small and simple Ruby program that uses a bloom filter to estimate the number of words in a text.

## How to run ##

	$ bundle install
	$ ./run.sh

Requires that ruby, ruby-gems and bundle are installed.

## Viewing source ##

The main script is bloom_filter_counting_test.rb

## Sample Output ##

If you run the program, you should see the following output:

	Counting the words in 'The Shunned House' by H.P. Lovecraft...
	Total words: 1466
	Estimated number of unique words (determined using a bloom filter): 1253
	Actual number of unique words (determined using a standard Set datastructure): 1261
	Bloom filter has achieved accuracy of ~99% using 1000 bytes of space and 4 hashes
	...compared to more than 83990 bytes required to hold all the unique words in a set

