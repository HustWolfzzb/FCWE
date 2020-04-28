# FCWE
Joint Embeddings of Chinese Words, Characters, and Four Corner Components


## [Four Corner Method](https://en.wikipedia.org/wiki/Four-Corner_Method) ##

* Traditional	 	

	一橫二垂三點捺，
	點下帶橫變零頭，
	叉四插五方塊六，
	七角八八小是九。

-----

* Simplified	 
	
    一横二垂三点捺，
    点下带横变零头，
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
./fcwe -train **[train-data-localtion]** -output-word **[output-directory]**/FCWE.txt -output-char **[other-embedding-output-directory]**/fcwe-chr -output-fc **[other-embedding-output-directory]**/fcwe-fc-vec -size 200 -window 5 -sample 1e-4 -negative 10 -iter 100 -threads 16 -min-count 5 -alpha 0.025 -binary 0 -comp **[subcharacter-file-location]**/FCWE-fc.txt -char2comp **[subcharacter-file-location]**/FCWE-char2fc.txt -join-type 1 -pos-type 3 -average-sum 1

```


## Requirements ##

>cmake version 3.10.2  
>make  GNU Make 4.1  
>gcc version 7.4.0
>python --- 3.7
>opencc --- 0.1.5
>jieba --- 0.42.1

## Data Processing ##


>Chinese WikiMedia Dump


>THUCNews


## Model Evaluation ##


|                  | wa-953 | wa-1124 | wa-7676 | ws-240 | ws-297 | sl-999 |
|------------------|--------|---------|---------|--------|--------|--------|
| word pairs       | 953    | 1124    | 7676    | 240    | 297    | 999    |
| character        | 26.8\% | 24.2\%  | 27.2\%  | 8.7\%  | 14.5\% | 17.4\% |
| componment       | 0      | 0       | 0       | 0      | 0      | 0      |
| four corner code | 0      | 0       | 0       | 0      | 0      |        |

>Word Similarity



>Word Analogy



## Building FCWE using cmake ##

	cd fcwe/src
    make

This will create the fcwe binary and also all relevant libraries.


## Example use cases ##


./fcwe -train **[train-data-localtion]** -output-word **[output-directory]**/FCWE.txt -output-char **[other-embedding-output-directory]**/fcwe-chr -output-fc **[other-embedding-output-directory]**/fcwe-fc-vec -size 200 -window 5 -sample 1e-4 -negative 10 -iter 100 -threads 16 -min-count 5 -alpha 0.025 -binary 0 -comp **[subcharacter-file-location]**/FCWE-fc.txt -char2comp **[subcharacter-file-location]**/FCWE-char2fc.txt -join-type 1 -pos-type 3 -average-sum 1


## Get Chinese four corner codes ##

The four corner number comes from [four-corner-method Feature](https://github.com/howl-anderson/four_corner_method), which contains four corner codes of all characters. Each Chinese character is represented by five numbers (in the range of 0-9). On this basis, we add a sixth number as index to distinguish characters with same codes. The largest index is 25, so there are 26 elements in four corner codes. we commit all the process code on [fcwe cour corner code]

    git clone https://github.com/HustWolfzzb/FCWE
    unzip master.zip
    cd fourCornerMethod
    python3 get_all_four_corner.py


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

I provided a feature file for the test，path is `FCWE/subcharacter/FCWE-char2fc.txt`.


## Substoke model output embeddings ##

- In this paper, the context word embeddings is used directly as the final word vector. However, according to the idea of fasttext, I also take into account the n-gram feature vector of the stroke information, the n-gram feature vector of the stroke information is taken as an average substitute for the word vector. 

-  There are two outputs in substoke model:
	-  output ends with vec is the context word vector.
	-  output ends with avg is the n-gram feature vector average.


## Word similarity evaluation ##

#### 1. Evaluation script ####
I have already written a Chinese word similarity evaluation script. [Chinese-Word-Similarity-and-Word-Analogy](https://github.com/bamtercelboo/Chinese_Word_Similarity_and_Word_Analogy), see the readme for details.

#### 2. Parameter Settings ####
The parameters are set as follows:  

	dim  100
	window sizes  5
	negative  5
	epoch  5
	minCount  10
	lr  skipgram(0.025)，cbow(0.05)，substoke(0.025)
	n-gram  minn=3, maxn=18

#### 3. result ####

Experimental results show follows  

![](https://i.imgur.com/u0O6RoE.jpg)
  
![](https://i.imgur.com/p4gjsaD.jpg)


## Full documentation ##
Invoke a command without arguments to list available arguments and their default values:

	./word2vec 
	usage: word2vec <command> <args>
	The commands supported by word2vec are:

	skipgram  ------ train word embedding by use skipgram model
	cbow      ------ train word embedding by use cbow model
	subword   ------ train word embedding by use subword(fasttext skipgram)  model
	substoke  ------ train chinses character embedding by use substoke(cw2vec) model

	./word2vec substoke -h
	Train Embedding By Using [substoke] model
	Here is the help information! Usage:

	The Following arguments are mandatory:
		-input              training file path
		-infeature          substoke feature file path
		-output             output file path
	
	The Following arguments are optional:
		-verbose            verbosity level[2]

	The following arguments for the dictionary are optional:
		-minCount           minimal number of word occurences default:[10]
		-bucket             number of buckets default:[2000000]
		-minn               min length of char ngram default:[3]
		-maxn               max length of char ngram default:[6]
		-t                  sampling threshold default:[0.001]

	The following arguments for training are optional:
		-lr                 learning rate default:[0.05]
		-lrUpdateRate       change the rate of updates for the learning rate default:[100]
		-dim                size of word vectors default:[100]
		-ws                 size of the context window default:[5]
		-epoch              number of epochs default:[5]
		-neg                number of negatives sampled default:[5]
		-loss               loss function {ns} default:[ns]
		-thread             number of threads default:[1]
		-pretrainedVectors  pretrained word vectors for supervised learning default:[]
		-saveOutput         whether output params should be saved default:[false]

## References ##
[1] [Cao, Shaosheng, et al. "cw2vec: Learning Chinese Word Embeddings with Stroke n-gram Information." (2018). ](http://www.statnlp.org/wp-content/uploads/papers/2018/cw2vec/cw2vec.pdf)   
[2][ Bojanowski, Piotr, et al. "Enriching word vectors with subword information." arXiv preprint arXiv:1607.04606 (2016).](https://arxiv.org/pdf/1607.04606.pdf)  
[3] [fastText-github](https://github.com/facebookresearch/fastText)  
[4] [cw2vec理论及其实现](https://bamtercelboo.github.io/2018/05/11/cw2vec/)

## Question ##

- if you have any question, you can open a issue or email bamtercelboo@{gmail.com, 163.com}.

- if you have any good suggestions, you can PR or email me.






	



