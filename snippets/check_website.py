import hashlib
from urllib.request import urlopen, Request
URL = 'https://www.gta.ufrj.br/~kaylani/'
HASH_FILE = 'current_hash.sha'

url = Request (URL, headers = {'User-Agent': 'Mozilla/5.0'})

response = urlopen (url).read ()
new_hash = hashlib.sha224 (response).hexdigest ()


try:
  with open (HASH_FILE, 'r') as f:
    old_hash = f.read ()
except: # first time running
  with open (HASH_FILE, 'w') as f:
    f.write (new_hash)

with open (HASH_FILE, 'r') as f:
  old_hash = f.read ()

if (new_hash == old_hash):
  print ('nada mudou')
else: # enviar email
  with open (HASH_FILE, 'w') as f:
    f.write (new_hash)
