from optparse import OptionParser

def process(file='dataset/zhwiki.txt', output='dataset/p-zhwiki.txt'):
    count = 0
    with open(output, 'w', encoding='utf8') as out:
        with open(file, 'r', encoding='utf8') as filein:
            string = ""
            for line in filein.readlines():
                if line.find('【') != -1 and line.find('】') != -1:
                    if len(string) < 10:
                        string += line.strip()
                    else:
                        out.write(string +'\n')
                        if count < 10:
                            print(len(string), string[:30],line)
                            count += 1
                        string = line.strip()
                else:
                    string += line.strip()



if __name__ == '__main__':
    parser = OptionParser()
    parser.add_option("--input", dest="input", default="", help="input file")
    parser.add_option("--output", dest="output", default="", help="output file")
    (options, args) = parser.parse_args()

    input_file = options.input
    save_path = options.output
    process()