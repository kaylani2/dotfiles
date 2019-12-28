## Move videos from folders in the current directory to the current directory
for d in ./*/ ; do (cd "$d" && mv *.mp4 ../); done
for d in ./*/ ; do (cd "$d" && mv *.avi ../); done
for d in ./*/ ; do (cd "$d" && mv *.mkv ../); done
for d in ./*/ ; do (cd "$d" && mv *.m4v ../); done
