#  [Four Corner Method](https://en.wikipedia.org/wiki/Four-Corner_Method) ##


## Principle


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


## Examleple

![Sructure of the Four CornerMethod. The example Chinese character法(method/law/France) is consists of five numbers34131](http://45.59.116.221/fourcorner.png)



## Get Chinese four corner codes ##

we used our clean word_dictionary without tranditional Chinese character --- 'newRadical.txt', so we got largest index 25 in the the sorted four corner codes file. It depends on word_dict arguement.
>we add some words after origin version, so the bigest index maybe changed

 
The four corner number comes from [four-corner-method Feature](https://github.com/howl-anderson/four_corner_method), which contains four corner codes of all characters. Each Chinese character is represented by five numbers (in the range of 0-9). On this basis, we add a sixth number as index to distinguish characters with same codes. The largest index is 25, so there are 26 elements in four corner codes. we commit all the process code on [fcwe cour corner code]


```python
    git clone https://github.com/HustWolfzzb/FCWE
    unzip master.zip
    cd FCWE/fourCornerMethod
    
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
  

**char2fourcorner file('../subcharacter/FCWE-char2fc.txt') like this**:

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

> I provided a complete lookup-table for characters in corpus，path is `../subcharacter/FCWE-char2fc.txt`.



## Full documentation ##
Invoke a command without arguments to list available arguments and their default values:

	Here is the help information! Usage:


	* The Following arguments are mandatory:
		-train              training file path
		-output             output file path
		-fc                 set of all four corner codes
		-char2fc            characters to four corner codes

	* The Following arguments are optional:
       
	    --> The following arguments for the dataset corpus are optional:
	        -min-count           minimal number of word 

	    --> The following arguments for training are optional:
            -binary              save the resulting vectors in binary moded; default:[0] (off)
            -alpha               learning rate default:[0.025]
            -size                size of word vectors default:[200]
            -window              size of the context window default:[5]
            -iter                number of epochs default:[100]
            -negative            number of negatives sampled default:[10]
            -sample              number of threads default:[16]
		
		
## References ##
[1] [Cao, Shaosheng, et al. "cw2vec: Learning Chinese Word Embeddings with Stroke n-gram Information." (2018). ](http://www.statnlp.org/wp-content/uploads/papers/2018/cw2vec/cw2vec.pdf)   


## Question ##

- if you have any question, you can email me by hustwolfzzb@gmail.com.






	



