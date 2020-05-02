import csv
import os
import jieba
import re
import sys
import time
from optparse import OptionParser


def getNewDataset(inputFile , tmpDir ):
    start = time.clock()
    times = 0
    filtrate = re.compile(u'[^\u4E00-\u9FA5]')  # 非中文
    # 现在是在分类的文件夹下，读取每个文件夹下的所有文件丢到一个csv文件里面去
    maxInt = sys.maxsize
    dirs = ["体育","家居","房产","时尚","星座","社会","股票","娱乐","彩票","教育","时政","游戏","科技","财经"]

    while True:
        # decrease the maxInt value by factor 10
        # as long as the OverflowError occurs.
        try:
            csv.field_size_limit(maxInt)
            break
        except OverflowError:
            maxInt = int(maxInt / 10)
    csvWFile = open(os.path.join(tmpDir,'text_classification_corpus.csv'), 'w', encoding='utf8', newline='')
    writer = csv.writer(csvWFile)
    index = ["label", "text", "cutword", "cutwordnum"]
    writer.writerow(index)
    Flag = True
    for dir in os.listdir(inputFile):
        if dir not in dirs:
            continue
        print(dir)
        files = os.listdir(os.path.join(inputFile, dir))
        print(files) 
        result = []
        print("Find all files in %s, file count:%d" % (dir, len(files)))
        for file in files:
            if file.find(".txt") == -1:
                continue
            with open(os.path.join(os.path.join(inputFile,dir), file), 'r', encoding='utf8') as r:
                for item in r.readlines():
                    if len(item) < 20:
                        continue
                    else:
                        element = [dir]
                        element.append(item)
                        element.append(" ".join(jieba.cut(filtrate.sub(r'', item).strip())))
                        element.append(str(element[2].count(" ")+1))
                        if int(element[3]) < 20 or int(element[3]) > 10000:
                            continue
                        result.append(element)
                        if len(result) > 10000:
                            if Flag:
                                Flag = False
                                print(result[20])
                            writer.writerows(result)
                            result = []
                            times += 1
                            end = int(time.clock() - start)
                            hour = int(end / 3600)
                            minutes = int((end - 3600 * hour) / 60)
                            seconds = end - 3600 * hour - 60 * minutes
                            print("Finished %d Items~ in %s hour %s minutes %s seconds" % ((times * 10000), hour, minutes, seconds))

        if len(result) > 0:
            writer.writerows(result)
            end = int(time.clock() - start)
            hour = int(end / 3600)
            minutes = int((end - 3600 * hour) / 60)
            seconds = end - 3600 * hour - 60 * minutes
            print(
                "Finished %d Items~ in %s hour %s minutes %s seconds"
                % ((times * 10000), hour, minutes, seconds))
            times = 0
    csvWFile.close()



def get_all_thu_data_for_cwe(tmpDir, outputfile ):
    file = os.path.join(tmpDir,'text_classification_corpus.csv')
    with open(outputfile, 'w', encoding='utf8') as out:
        csvRFile = open(file, 'r', encoding='utf8')
        reader = csv.reader(csvRFile)
        for item in reader:
            if reader.line_num == 1:
                print(item)
                print("========")
                continue
            else:
                out.write(item[2]+'\n')
        csvRFile.close()



if __name__ == '__main__':

    parser = OptionParser()
    parser.add_option("--input", dest="input", default="", help="input file")
    parser.add_option("--tmpDir", dest="tmpDir", default="", help="text_classification_corpus file")
    parser.add_option("--output", dest="output", default="", help="output file")
    (options, args) = parser.parse_args()

    
    input = options.input
    tmpDir = options.tmpDir
    output = options.output

    getNewDataset(input, tmpDir)
    get_all_thu_data_for_cwe(tmpDir, output)

