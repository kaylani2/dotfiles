## Download videos
import os

b = [
'https://www.youtube.com/watch?v=0Tqba-j2Ah4&list=PLiN-7mukU_REKTOSXby062ZAfpSk75tkQ&index=1',
'https://www.youtube.com/watch?v=Wtc8z33pYDQ&list=PLiN-7mukU_REKTOSXby062ZAfpSk75tkQ&index=2',
'https://www.youtube.com/watch?v=p-nvQtzSWYY&list=PLiN-7mukU_REKTOSXby062ZAfpSk75tkQ&index=3',
'https://www.youtube.com/watch?v=5JqGkn8exv0&list=PLiN-7mukU_REKTOSXby062ZAfpSk75tkQ&index=4',
'https://www.youtube.com/watch?v=-7zsHK2IXtg&list=PLiN-7mukU_REKTOSXby062ZAfpSk75tkQ&index=5',
'https://www.youtube.com/watch?v=lDoAHCuHEM4&list=PLiN-7mukU_REKTOSXby062ZAfpSk75tkQ&index=6',
'https://www.youtube.com/watch?v=MB0vRra5fUI&list=PLiN-7mukU_REKTOSXby062ZAfpSk75tkQ&index=7',
'https://www.youtube.com/watch?v=TTenZAxGcvo&list=PLiN-7mukU_REKTOSXby062ZAfpSk75tkQ&index=8',
'https://www.youtube.com/watch?v=KD3b11UgSvM&list=PLiN-7mukU_REKTOSXby062ZAfpSk75tkQ&index=9',
'https://www.youtube.com/watch?v=jM8dCGIm6yc&list=PLiN-7mukU_REKTOSXby062ZAfpSk75tkQ&index=10',
'https://www.youtube.com/watch?v=pD1gDSao1eA&list=PLiN-7mukU_REKTOSXby062ZAfpSk75tkQ&index=11',
'https://www.youtube.com/watch?v=dwr4SPK1_TY&list=PLiN-7mukU_REKTOSXby062ZAfpSk75tkQ&index=12',
'https://www.youtube.com/watch?v=v4xZUr0BEfE&list=PLiN-7mukU_REKTOSXby062ZAfpSk75tkQ&index=13'
]

for link in b:
  cmd = 'youtube-dl ' + link
  os.system (cmd)
