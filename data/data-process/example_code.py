import os
if __name__ == '__main__':

    # you can change the enviroment here
    pythonenv = "/Users/zhangzhaobo/PycharmProjects/nlpCode/venv/bin/python"
    
    input_file = 'zhwiki-20200301-pages-articles-multistream.xml.bz2'
    output_file = 'split_wiki.txt'
    tmp1_file = 'tmp1-wiki_origin-pattern-data.txt'
    tmp2_file = 'tmp2-wiki_clean-pattern-text.txt'
    
    tmp2_file = 'short-wiki-without-tab_for_test_code.txt'

    #get data from the dump file, auto-search filename with 'zhwiki'
    # os.system(pythonenv+' wiki_parser.py --input '+ input_file +' --output '+tmp1_file)
    
    # # transform the data to text 
    # os.system(pythonenv+' wiki_clean.py --input '+ tmp1_file +' --output '+tmp2_file)

    # transform the data to text 
    os.system(pythonenv + ' clean-corpus.py --input '+ tmp2_file +' --output '+ output_file)


    input_file = '/Users/zhangzhaobo/CLionProjects/FCWE/dataset/THUCNews'
    tmpDir = '/Users/zhangzhaobo/Documents/Papers/emnlp2020/codes/data-process'
    output_file = 'split_thu.txt'
    # get THUCNews corpus
    os.system(pythonenv + ' clean_thu.py --input '+ input_file +' --tmpDir ' + tmpDir +' --output '+ output_file)

