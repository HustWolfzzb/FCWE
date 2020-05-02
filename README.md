# FCWE
Joint Embeddings of Chinese Words, Characters, and Four Corner Codes


## [Four Corner Method](https://en.wikipedia.org/wiki/Four-Corner_Method) ##

* Traditional	 	

	一橫二垂三點捺，
	點下帶橫變零頭，
	叉四插五方塊六，
	七角八八小是九。

-----

* Simplified	 
	
    一横二垂三点捺，
    点下带横变零头，192:cwe zhangzhaobo$ ./word_analogy /Users/zhangzhaobo/Downloads/2JWE-p3.txt /Users/zhangzhaobo/CLionProjects/FCWE/data/morphological.txt
    叉四插五方块六，
    七角八八小是九。

-----

* Pinyin	 
	
    Yī héng, èr chuí, sān diǎn, nà;
    Diǎn xià dài héng, biàn líng tou;
    Chǎ sì, chā wǔ, fāng kuài liù;
    Qī jiǎo, bā ba, xiǎo shì jiǔ.

-----

* Meaning

    1 for horizontal, 2 vertical, 3 is a dot;
    a dot over a horizontal, or already another corner, is 0;
    crossing is 4, crossing more than one is 5, a box is 6;
    7 for a corner, 八 (shape of '8' character) is 8, and 小 is 9.

-----




## Baseline Training Script ##

```python
CBOW:
./word2vec -train **[train-data-localtion]**  -output **[output-directory]**/CBOW.txt -size 200 -window 5 -sample 1e-4 -negative 10 -hs 0 -binary 0 -cbow 1 -iter 100 -min-count 5

Skipgram:
./word2vec -train **[train-data-localtion]**  -output **[output-directory]**/Skipgram.txt -size 200 -window 5 -sample 1e-4 -negative 10 -hs 0 -binary 0 -cbow 0 -iter 100 -min-count 5

CWE:
./cwe -train **[train-data-localtion]** -output-word **[output-directory]**/CWE.txt -size 200 -window 5 -sample 1e-4 -negative 10 -iter 100 -threads 16 -min-count 5 -alpha 0.025 -cbow 0

GWE:
./gwe -train **[train-data-localtion]** -output-word **[output-directory]**/GWE.txt -output-char **[other-embedding-output-directory]**/gwe-chr -use-glyph 2 char-glyph **[GWE-project]**/char_glyph_feat.txt -size 200 -window 5 -sample 1e-4 -negative 10 -hs 0 -cbow 0 -cwe-type 2 -iter 100 -min-count 5

JWE:
./jwe -train **[train-data-localtion]** -output-word **[output-directory]**/JWE.txt -output-char **[other-embedding-output-directory]**/jwe-chr -output-comp **[other-embedding-output-directory]**/jwe-comp-vec -size 200 -window 5 -sample 1e-4 -negative 10 -iter 100 -threads 16 -min-count 5 -alpha 0.025 -binary 0 -comp **[subcharacter-file-location]**/JWE-comp.txt -char2comp **[subcharacter-file-location]**/JWE-char2comp.txt -join-type 1 -pos-type 3 -average-sum 1

CW2VEC:
./cw2vec substoke -input **[train-data-localtion]** -infeature **[CW2VEC-project]**cw2vec/Simplified_Chinese_Feature/sin_chinese_feature.txt -output **[output-directory]**/thu-cw2vec.txt -lr 0.025 -dim 200 -ws 5 -epoch 100 -minCount 5 -neg 10 -loss ns -thread 16 -t 1e-4 -lrUpdateRate 100

New-JWE:
./new-jwe -train **[train-data-localtion]** -output-word **[output-directory]**/New-JWE.txt -output-char **[other-embedding-output-directory]**/new-jwe-chr -output-comp **[other-embedding-output-directory]**/new-jwe-comp-vec -size 200 -window 5 -sample 1e-4 -negative 10 -iter 100 -threads 16 -min-count 5 -alpha 0.025 -binary 0 -comp **[subcharacter-file-location]**/New-JWE-comp.txt -char2comp **[subcharacter-file-location]**/New-JWE-char2comp.txt -join-type 1 -pos-type 3 -average-sum 1

FCWE:
./fcwe -train **[train-data-localtion]** -output **[output-directory]**/FCWE.txt -size 200 -window 5 -sample 1e-4 -negative 10 -iter 100 -threads 16 -min-count 5 -alpha 0.025 -binary 0 -fc **[subcharacter-file-location]**/FCWE-fc.txt -char2fc **[subcharacter-file-location]**/FCWE-char2fc.txt

```


## Requirements ##



>cmake version 3.10.2  

>make  GNU Make 4.1  

>gcc version 7.4.0

>python --- 3.7

>opencc --- 0.1.5

>jieba --- 0.42.1

>pandas --- 0.25.3

>Numpy  ---  1.18.1

>scipy --- 1.3.0

>Tensorflow - 2.1.0
>

## Data Processing ##


>zhWiki contains 271420881 tokens and we extract 766723 words whose word frequency is higher than 5 to keep the same min-count parameter with JWE.

>THUCNews contains 308120464 tokens and 223862 words with more than 15 occurrences, Beacause there are too many rare eneities in news collections which will introduce interference.

-------

#### 1. Chinese WikiMedia Dump

Download [Wikipedia-dump : zhwiki-latest-pages-articles.xml.bz2](https://dumps.wikimedia.org/zhwiki/latest/) as the input_file


```python
import os
# you can change the enviroment here
pythonenv = 'python3' 

# set the input_file(Wikipedia-dump) and output_file(set a dataset name)
input_file = 'zhwiki-20200301-pages-articles-multistream.xml.bz2'
output_file = 'split_wiki.txt'

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

Download [THUCNews.zip](http://thuctc.thunlp.org/message) from [thunlp](http://thuctc.thunlp.org/#%E4%B8%AD%E6%96%87%E6%96%87%E6%9C%AC%E5%88%86%E7%B1%BB%E6%95%B0%E6%8D%AE%E9%9B%86THUCNews)

unzip the THUCNews.zip and get a directory as the cmd input_Dir

```python
"""
THUCNews is a news collection dataset, its processing progress is easier than Wiki
"""


import os
# input Dir is the parent folder of all category, tmpDir is a folder to save text classification CSV dataset with more info, output file is the target output filename.
os.system(pythonenv + ' clean_thu.py --input '+ input_Dir +' --tmpDir ' + tmpDir +' --output '+ output_file)
```

## Building FCWE using cmake ##

	cd fcwe/src
    make
    
    
This will create the fcwe binary and also all relevant libraries. (In src directory)

## or using Clion

Download this project to CLion, and run default Configuration, don't forget add program arguemnets

------

This will create the fcwe binary and also all relevant libraries. (In cmake-budld-debug directory)


## Model Evaluation ##


#### 1. Data Info

> WA-953 from [CWE(Chen et al.,2015)](https://github.com/Leonard-Xu/CWE)
> WA-297 from [JWE(Yu et al.,2017)](https://github.com/HKUST-KnowComp/JWE)
> WA-7636 from [Analogy-CA8(Shenet al.,2018)](https://github.com/Embedding/Chinese-Word-Vectors)


|                  | ~~wa-953~~ | wa-1124 | wa-7676 | ws-240 | ws-297 | sl-999 |
|------------------|--------|---------|---------|--------|--------|--------|
| word pairs       | ~~953~~    | 1124    | 7676    | 240    | 297    | 999    |
| character        | ~~26.8\%~~ | 24.2\%  | 27.2\%  | 8.7\%  | 14.5\% | 17.4\% |
| componment       | ~~0~~      | 0       | 0       | 0      | 0      | 0      |
| four corner code | ~~0~~      | 0       | 0       | 0      | 0      |        |



#### 2. Evaluation script 


```python
'''
we use different source code to generate word vector which make it will throw error when evalute the analogy task with some embedding file. Therefore, we prepare two test codes to keep it normal.
'''
import os
test_file = 'your embedding file'

# Analogy 1124
os.system('python word_analogy.py -a data/analogy1.txt -e '+test_file)
os.system('python word_analogy.py -a data/analogy.txt -e '+test_file)
os.system('python word_analogy.py -a data/analogy-n.txt -e '+test_file)

# word_analogy binary exec file will be created in 'src' folder when make fcwe binary 
os.system('./word_analogy '+test_file + ' data/analogy1.txt ')
os.system('./word_analogy '+test_file + ' data/analogy.txt ')
os.system('./word_analogy '+test_file + ' data/analogy-n.txt ')

# word_similarity with three kind test datasets.
os.system('python word_sim.py -s data/240.txt -e '+test_file)
os.system('python word_sim.py -s data/297.txt -e '+test_file)
os.system('python word_sim.py -s data/SimLex-999_translated.txt -e '+test_file)

```


#### 3. Word Similarity



| Model    | WS-240-T | WS-297-T | SL-999-T | WS-240-W | WS-297-W | SL-999-W |
|----------|----------|----------|----------|----------|----------|----------|
| CBOW     | 0.5492   | 0.5906   | 0.3208   | 0.5083   | 0.5704   | 0.3198   |
| Skipgram | 0.5872   | 0.5986   | 0.3419   | 0.5584   | 0.6110   | 0.3118   |
| CWE      | 0.5792   | 0.5963   | 0.3369   | **<u>0.5677</u>**   | 0.6239   | 0.3063   |
| GWE      | <u>**0.5966**</u>   | 0.6052   | 0.3041   | 0.5660   | 0.6164   | 0.3099   |
| CW2VEC   | 0.5225   | **<u>0.6319 </u>**  | 0.3485   | 0.5625   | 0.6044   | 0.2748   |
| JWE      | 0.5378   | 0.5784   | 0.2367   | 0.5468   | **<u>0.6565</u>**   | 0.3693   |
| New-JWE  | 0.5348   | 0.6267   | 0.3564   | 0.5461   | 0.6462   | 0.3739   |
| FCWE     | 0.5313   | 0.6181   | **<u>0.4231</u>**   | 0.5349   | 0.6287   | **<u>0.3976 </u>**  |

#### 4. Word Analogy

| Model    | WA-1124-T | WA-7676-T | WA-1124-W | WA-7676-W |
|----------|-----------|-----------|-----------|-----------|
| CBOW     | 0.7269    | 0.3443    | 0.8452    | 0.4029    |
| Skipgram | 0.7455    | <u>**0.3970**</u>    | 0.8470    | 0.4175    |
| CWE      | 0.7171    | 0.3888    | 0.8452    | **<u>0.4195  </u>**  |
| GWE      | 0.7082    | 0.3717    | 0.8461    | 0.4135    |
| CW2VEC   | 0.7375    | 0.3434    | 0.8016    | 0.3809    |
| JWE      | 0.7073    | 0.3612    | 0.8461    | 0.3715    |
| New-JWE  | 0.7524    | 0.3464    | **<u>0.8594</u>**    | 0.3720    |
| FCWE     | **<u>0.7900 </u>**   | 0.3623    | 0.8461    | 0.4051    |



## Example use cases ##


./fcwe -train **[train-data-localtion]** -output **[output-directory]**/FCWE.txt -size 200 -window 5 -sample 1e-4 -negative 10 -iter 100 -threads 16 -min-count 5 -alpha 0.025 -binary 0 -fc **[subcharacter-file-location]**/FCWE-fc.txt -char2fc **[subcharacter-file-location]**/FCWE-char2fc.txt 


## Get Chinese four corner codes ##

we used our clean word_dictionary without tranditional Chinese character --- 'newRadical.txt', so we got largest index 25 in the the sorted four corner codes file. It depends on word_dict arguement.
>we add some words after origin version, so the bigest index maybe changed

 
The four corner number comes from [four-corner-method Feature](https://github.com/howl-anderson/four_corner_method), which contains four corner codes of all characters. Each Chinese character is represented by five numbers (in the range of 0-9). On this basis, we add a sixth number as index to distinguish characters with same codes. The largest index is 25, so there are 26 elements in four corner codes. we commit all the process code on [fcwe cour corner code]


```python
    git clone https://github.com/HustWolfzzb/FCWE
    unzip master.zip
    cd fourCornerMethod
    
    """
    # Make sure that the first item of each line's split array is a word
    # We use the default split way without arguement to get the array
    # You can connect dicts with ',' just like:
    #    'python3 get_all_four_corner.py --word_dict a.txt,b.txt --output 4corner.txt'
    """
    python3 get_all_four_corner.py --word_dict word_dict.txt --output 4corner.txt
    
    # if you want to get the sorded four corner codes, add a optional arguement '--sort' in 1
    
    python3 get_all_four_corner.py --word_dict word_dict.txt --output 4corner.txt --sort 1

    
```
  

**char2fourcorner file(FCWE-char2fc.txt) like this**:

    彼 2 4 2 4 7 1
    伏 2 3 2 8 4 0
    俟 2 3 2 8 4 1
    伐 2 3 2 5 0 0
    侔 2 3 2 5 0 1
    俄 2 3 2 5 0 2
    戕 2 3 2 5 0 3
    臧 2 3 2 5 0 4
    休 2 4 2 9 0 0
    貅 2 4 2 9 0 1
    伙 2 9 2 8 0 0
    伢 2 1 2 4 0 0
	......
	......

> I provided a complete lookup-table for characters in corpus，path is `FCWE/subcharacter/FCWE-char2fc.txt`.




## Full documentation ##
Invoke a command without arguments to list available arguments and their default values:

	Here is the help information! Usage:


	* The Following arguments are mandatory:
		-train              training file path
		-output         output file path
		-fc                 set of all four corner codes
		-char2fc            characters to four corner codes

	* The Following arguments are optional:
       
	    --> The following arguments for the dataset corpus are optional:
	        -min-count           minimal number of word 

	    --> The following arguments for training are optional:
            -binary              save the resulting vectors in binary moded; default:[0] (off)
            -alpha                 learning rate default:[0.025]
            -size                size of word vectors default:[200]
            -window                 size of the context window default:[5]
            -iter              number of epochs default:[100]
            -negative                number of negatives sampled default:[10]
            -sample             number of threads default:[16]
		
		
## References ##
[1] [Cao, Shaosheng, et al. "cw2vec: Learning Chinese Word Embeddings with Stroke n-gram Information." (2018). ](http://www.statnlp.org/wp-content/uploads/papers/2018/cw2vec/cw2vec.pdf)   


## Question ##

- if you have any question, you can email me by hustwolfzzb@gmail.com.






	



