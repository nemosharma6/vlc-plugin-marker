# Plugin-Marker

This VLC plugin, named MARKER , provides you the ability to mark important sections of a video. These sections can be viewed later without the need to search for it in the entire video.

This plugin provides you the ability to mark important sections of a video. These sections can be viewed later without the need to search for it in the entire video.

All plugin options are :

Start   	 : Click to mark the start of the important section

Stop    	 : Click to mark the end of the important section

Play    	 : Click to play the selected section

Reset   	 : Click to set the marked contents to NULL

PlayAll 	 : Click to play all the marked sections of the video

Delete  	 : Click to delete a particular marked section

Add Comment  : Click to add comment for the marked section

Show Comment : Click to show the comment added for the selected section

Working:

The Plugin works by storing the marked sections in a file(along with the comments). Now when the video is played again, the pop up box would contain the start and stop time of the marked sections. We can select from among the listed sections and perform our desired operation.

How to Use:

Make a folder to contain the .txt files. Locate the function activate in the code. Copy the address of the folder to the variable address as shown in the code and save it. 

Now run the following command :

Mac Users : cp [location of the code]/marker.lua  /Applications/VLC.app/Contents/MacOS/share/lua/extensions/

Linux Users : cp [location of the code]/marker.lua ~/.local/share/vlc/lua/extensions/

The above command just copies our code to the extensions sub directory of our VLC Application.

After finishing, Open VLC and enjoy the plugin.
