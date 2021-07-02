import hashlib
from urllib.request import urlopen, Request
from bs4 import BeautifulSoup
URL = 'https://www.gta.ufrj.br/~kaylani/'
HASH_FILE = 'current_hash.sha'

url = Request (URL, headers = {'User-Agent': 'Mozilla/5.0'})

response = urlopen (url).read ()
soup = BeautifulSoup (response, 'html.parser')
publications = soup.find ('section', {'id': 'publications'}).text

new_hash = hashlib.sha224 (publications.encode ()).hexdigest ()

### K: Running for the first time.
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
  print ('algo mudou')
  with open (HASH_FILE, 'w') as f:
    f.write (new_hash)
