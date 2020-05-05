# Data


## Requirements ##


>python --- 3.7

>opencc --- 0.1.5

>jieba --- 0.42.1

>pandas --- 0.25.3

>Numpy  ---  1.18.1


## File Explainment

* unzip the THUCNews.zip and get the 'THUCNews/' directory as the data-process input_Dir.

* 'thuDatasetOutput/' is a tmp dir for some process file.

* 'data-process/': all code for clean origin data.

* there should be a file 'zhwiki-20200301-pages-articles-multistream.xml.bz2', but it is too big

## Data Processing ##

-------


#### 1. Chinese WikiMedia Dump

>zhWiki contains 271420881 tokens and we extract 766723 words whose word frequency is higher than 5 to keep the same min-count parameter with JWE.


Download [Wikipedia-dump : zhwiki-latest-pages-articles.xml.bz2](https://dumps.wikimedia.org/zhwiki/latest/) as the input_file


```python
"""
all files and example corpus in 'data/data-process' directory 
"""


import os
# you can change the enviroment here
pythonenv = 'python3' 

# set the input_file(Wikipedia-dump) and output_file(set a dataset name)
input_file = 'zhwiki-20200301-pages-articles-multistream.xml.bz2'
output_file = 'split-wiki.txt'

# tmpfile name (we suggest not to change)
tmp1_file = 'tmp1-wiki_origin-pattern-data.txt'
tmp2_file = 'tmp2-wiki_clean-pattern-text.txt'

# get data from the dump file, auto-search filename with 'zhwiki' and 'pages-articles-multistream.xml.bz2'
os.system(pythonenv+' wiki_parser.py --input '+ input_file +' --output '+tmp1_file)

# transform the data to text 
os.system(pythonenv+' wiki_clean.py --input '+ tmp1_file +' --output '+tmp2_file)

# transform the data to text 
os.system(pythonenv + ' clean-corpus.py --input '+ tmp2_file +' --output ' + output_file)
```



#### 2. THUCNews

>THUCNews contains 308120464 tokens and 223862 words with more than 15 occurrences, Beacause there are too many rare eneities in news collections which will introduce interference.


Download [THUCNews.zip](http://thuctc.thunlp.org/message) from [thunlp](http://thuctc.thunlp.org/#%E4%B8%AD%E6%96%87%E6%96%87%E6%9C%AC%E5%88%86%E7%B1%BB%E6%95%B0%E6%8D%AE%E9%9B%86THUCNews)

unzip the THUCNews.zip and get a directory as the cmd input_Dir

```python

"""
THUCNews is a news collection dataset, its processing progress is easier than Wiki

all files and example corpus in 'data/data-process' directory 

"""


import os
# input Dir is the parent folder of all category, tmpDir is a folder to save text classification CSV dataset with more info, output file is the target output filename.
os.system(pythonenv + ' clean_thu.py --input '+ input_Dir +' --tmpDir ' + tmpDir +' --output '+ output_file)
```
