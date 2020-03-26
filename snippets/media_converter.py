## Convert all videos (downsize)
import os

cmd1 = 'ffmpeg -i '
cmd2 = ' -vf scale=1280:-1 -c:v libx264 -preset veryfast -crf 23 '
cmd3 = '.mp4'


localFiles = os.popen ('ls *webm').read ().split ('\n')[:-1]
for f in localFiles:
  os.system (cmd1 + f + cmd2 + f [:-4] + cmd3)
  #print (cmd1 + f + cmd2 + f [:-4] + cmd3)
