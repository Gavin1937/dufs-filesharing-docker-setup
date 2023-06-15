#! /usr/bin/env python

import json
import random
import string

print('Setup dufs app port')
port = input ('Enter app port: ')
print('Setup dufs user. (leave them empty to use a random username & password)')
username = input('Enter an username: ')
password = input('Enter a password: ')
detach_mode = input('Run container in detach mode? (Y/n): ')

if len(username) <= 0:
	username = ''
	for _ in range(10):
		username += random.choice(string.ascii_lowercase)

if len(password) <= 0:
	password = ''
	for _ in range(10):
		password += random.choice(string.ascii_lowercase+string.ascii_uppercase+string.digits)

if len(detach_mode) <= 0 or detach_mode.lower() == 'y':
	detach_mode = True
else:
	detach_mode = False


print('Your app opens on port:', port)
print('Your username is:', username)
print('Your password is:', password)
print('Container will be run in', 'detached' if detach_mode else 'interactive', 'mode')

with open('config.json', 'w', encoding='utf-8') as file:
	json.dump(
		{'port':port,'username':username,'password':password,'detach':detach_mode},
		file, indent=2,
	)


