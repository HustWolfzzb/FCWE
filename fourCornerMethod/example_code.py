import os


if __name__ == '__main__':
	# featurizor = Featurizor()
	# word = '历史问题'
	# print(featurizor.featurize(word))

	# word = '中'
	# for x in featurizor.featurize(word):
	# 	print(x)

	# you can change the enviroment here
	pythonenv = "/Users/zhangzhaobo/PycharmProjects/nlpCode/venv/bin/python"
	os.system(pythonenv + ' get_all_four_corner.py --word_dict newRadical.txt --output 4corner.txt --sort 1')