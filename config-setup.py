#! /usr/bin/env python

import json
import random
import string

print('Setup dufs app port')
port = input ('Enter app port: ')
print('Setup dufs user. (leave them empty will use a random username / password)')
username = input('Enter an username: ')
password = input('Enter a password: ')

if len(username) <= 0:
	username = ''
	for _ in range(10):
		username += random.choice(string.ascii_lowercase)

if len(password) <= 0:
	password = ''
	for _ in range(10):
		password += random.choice(string.ascii_lowercase+string.ascii_uppercase+string.digits)

print('Your app opens on port:', port)
print('Your username is:', username)
print('Your password is:', password)

with open('config.json', 'w', encoding='utf-8') as file:
	json.dump(
		{'port':port,'username':username,'password':password},
		file
	)


