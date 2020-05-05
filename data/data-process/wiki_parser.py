# -*- coding: utf-8 -*-
"""
主要用于解析wiki
"""

from gensim.corpora.wikicorpus import extract_pages, filter_wiki
import bz2file
import re
from opencc import OpenCC
from tqdm import tqdm
import codecs
import pandas as pd
from optparse import OptionParser


def wiki_replace(d):
    openCC = OpenCC('t2s')
    s = d[1]
    s = re.sub(':*{\|[\s\S]*?\|}', '', s)
    s = re.sub('<gallery>[\s\S]*?</gallery>', '', s)
    s = re.sub('(.){{([^{}\n]*?\|[^{}\n]*?)}}', '\\1[[\\2]]', s)
    s = filter_wiki(s)
    s = re.sub('\* *\n|\'{2,}', '', s)
    s = re.sub('\n+', '\n', s)
    s = re.sub('\n[:;]|\n +', '\n', s)
    s = re.sub('\n==', '\n\n==', s)
    s = u'【' + d[0] + u'】\n' + s
    return openCC.convert(s)


def wiki_process(input_file, save_path):
    # wikicorpus解析
    wiki = extract_pages(bz2file.open(input_file))
    # 处理并导出
    i = 0
    f = codecs.open(save_path, 'w', encoding='utf-8')
    w = tqdm(wiki, desc=u'已获取0篇文章')
    openCC = OpenCC('t2s')
    for d in w:
        if not re.findall('^[a-zA-Z]+:', d[0]) and d[0] and not re.findall(u'^#', d[1]):
            s = wiki_replace(d)
            f.write(s + '\n\n\n')
            i += 1
            if i % 100 == 0:
                w.set_description(u'已获取%s篇文章' % i)

    f.close()


if __name__ == '__main__':
    parser = OptionParser()
    parser.add_option("--input", dest="input", default="", help="input file")
    parser.add_option("--output", dest="output", default="", help="output file")
    (options, args) = parser.parse_args()

    input_file = options.input
    save_path = options.output
    # we check the input_path and if it is wrong, we will search match file in the directory.
    wiki_process(input_file, save_path)
    # >>> 已获取0篇文章: 46it [00:02, 16.40it/s]