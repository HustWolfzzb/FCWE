# Evalution


## Requirements ##

>python --- 3.7

>pandas --- 0.25.3

>Numpy  ---  1.18.1

>scipy --- 1.3.0

>Tensorflow - 2.1.0

## Model Evaluation ##


#### 1. Data Info

> WA-953 from [CWE(Chen et al.,2015)](https://github.com/Leonard-Xu/CWE) we didn't use this
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

all files and example corpus in 'data/data-process' directory 
'''
import os
test_file = 'your embedding file'

# Analogy 1124
os.system('python word_analogy.py -a analogy1.txt -e '+test_file)
os.system('python word_analogy.py -a analogy.txt -e '+test_file)
os.system('python word_analogy.py -a analogy-n.txt -e '+test_file)

# word_analogy binary exec file will be created in 'src' folder when make fcwe binary 
os.system('./word_analogy '+test_file + ' analogy1.txt ')
os.system('./word_analogy '+test_file + ' analogy.txt ')
os.system('./word_analogy '+test_file + ' analogy-n.txt ')

# word_similarity with three kind test datasets.
os.system('python word_sim.py -s 240.txt -e '+test_file)
os.system('python word_sim.py -s 297.txt -e '+test_file)
os.system('python word_sim.py -s SimLex-999_translated.txt -e '+test_file)

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



--------


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
