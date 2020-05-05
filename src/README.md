# Source Code



## Requirements ##



>cmake version 3.10.2  

>make  GNU Make 4.1  

>gcc version 7.4.0


## Building FCWE using cmake ##
    
	make # yes, just make sure you installed cmake
    

This will create the fcwe, word_analogy binary and also all relevant libraries. (In src directory)
we can move the word_analogy exec file to '../evalutaion/' to test the performance of embedding.

## or using Clion

Download this project to CLion, and run default Configuration, don't forget add program arguemnets

------

This will create the fcwe binary and also all relevant libraries. (In cmake-budld-debug directory)
In this way, we need to add the word_analogy.c to CMakeLists.txt manually.


## Example use cases ##


    ./fcwe -train **[train-data-localtion]** -output **[output-directory]**/FCWE.txt -size 200 -window 5 -sample 1e-4 -negative 10 -iter 100 -threads 16 -min-count 5 -alpha 0.025 -binary 0 -fc **[subcharacter-file-location]**/FCWE-fc.txt -char2fc **[subcharacter-file-location]**/FCWE-char2fc.txt 



## Arguement documentation ##
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
		





	



