#!/usr/local/bin/python3.7

#coding:utf-8

#Author:Lightful_H

# 封装请求

import requests
from urllib import parse
import json
import re


# ===参数替换===
# target_str目标字符串  arguments对象
# "_"和java中的privat类似 为私有不允许外面调用
def _replace_argument(target_str, arguments):
	# {"project_id":2,""token":"xxxxx"}
	# /project/{{project_id}}
	if not arguments:
		return target_str
	while True:
		#查找结果，匹配
		search_result = re.search(r"{{(.+?)}}",target_str)
		if not search_result:
			break
		#获取参数名字，只有一组（）获取第一个分组的名字
		argument_name = search_result.group(1)
		#判断参数是否在字典中
		if argument_name in arguments:
			target_str = re.sub("{{"+argument_name+"}}",arguments[argument_name],target_str)
		else:
			target_str = re.sub("{{"+argument_name+"}}",argument_name,target_str)

	return target_str


# arguments存放参数
def request(api,arguments=None):
	host = api.host.host
	method = api.http_method
	path = api.path

	url = parse.urljoin(host, path)
	url = _replace_argument(url, arguments)

	data ={}
	if api.data:
		data_list =json.loads(api.data, encoding='utf-8')
		for data_dict in data_list:

			data[data_dict['name']] =_replace_argument(data_dict['value'],arguments)
	headers = {}
	if api.headers:
		header_list = json.loads(api.headers, encoding='utf-8')
		for header_dict in header_list:
			headers[header_dict['name']] = _replace_argument(header_dict['value'],arguments)

	resp = requests.request(method, url, headers=headers, data=data)

	return resp
