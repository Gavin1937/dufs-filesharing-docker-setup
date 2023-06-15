#! /usr/bin/env python

import json

port = input ('Enter app port: ')
username = input('Enter an username: ')
password = input('Enter a password: ')

with open('config.json', 'w', encoding='utf-8') as file:
	json.dump(
		{'port':port,'username':username,'password':password},
		file
	)


