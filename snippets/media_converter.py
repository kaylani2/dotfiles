## Convert all videos (downsize)
import os

cmd1 = 'ffmpeg -i '
cmd2 = ' -vf scale=1280:-1 -c:v libx264 -preset veryfast -crf 23 '
cmd3 = 'DOWNSIZED.mp4'


videoFormat = 'webm'
localFiles = os.popen ('ls *' + videoFormat).read ().split ('\n')[:-1]
for f in localFiles:
  os.system (cmd1 + f + cmd2 + f [:- len (videoFormat)] + cmd3)
  print (cmd1 + f + cmd2 + f [:- len (videoFormat)] + cmd3)
