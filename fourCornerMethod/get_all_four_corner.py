import os

from hanzi_char_featurizer import Featurizor
from optparse import OptionParser


def get4Corner( files, featurizor, output_file):
    with open(output_file, 'w', encoding='utf8') as o:
        words = set()
        for file in files:
            with open(file, 'r', encoding='utf8') as f:
                for line in f.readlines():
                    try:
                        word = line.strip().split()[0]
                        if word not in words:
                            words.add(word)
                        else:
                            continue
                        result = [int(x[0]) for x in featurizor.featurize(word)[3:]]
                        print(result)
                        stri = ""
                        for i in result[:-1]:
                            stri += (str(i) + " ")
                        stri += str(result[-1])
                        o.write(word + ',' + stri + '\n')
                    except TypeError as e:
                        print('catch the error', e)

                        continue


def getSorted4Corner(files , featurizor, output_file):
    with open(output_file, 'w', encoding='utf8') as o:
        words = set()
        c2w = {}
        print(files)
        for file in files:
            with open(file, 'r', encoding='utf8') as f:
                for line in f.readlines():
                    word = line.strip().split()[0]
                    if word not in words:
                        words.add(word)
                    else:
                        continue
                    result = [x[0] for x in featurizor.featurize(word)[3:]]
                    codes = " ".join(result)
                    if not c2w.get(codes):
                        c2w[codes] = [word]
                    else:
                        c2w[codes].append(word)

        stri = ""
        for code in c2w.keys():
            words = c2w[code]
            for idx in range(len(words)):
                try:
                    stri = (words[idx] + ',' + code + " " + str(idx))
                    o.write(stri+'\n')
                except TypeError as e:
                    print(word)
                    print(code)




if __name__ == '__main__':
    parser = OptionParser()
    parser.add_option("--word_dict", dest="word_dict", default="", help="make sure that the first item of each line's split array is a word, and you can connect dicts with ',")
    parser.add_option("--output", dest="output", default="", help="output file")
    parser.add_option("--sort", dest="sort", default=0, help="get the sorted four corner codes, default no")
    (options, args) = parser.parse_args()

    word_dict = options.word_dict
    output = options.output
    sort = options.sort
    featurizor = Featurizor()
    if sort == 0:
        get4Corner(word_dict.strip().split(','), featurizor, output)
    else:
        getSorted4Corner(word_dict.strip().split(','), featurizor, output)



