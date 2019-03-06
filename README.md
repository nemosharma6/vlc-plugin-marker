## vlc-plugin-marker

This vlc plugin, named <b>marker</b> , provides you the ability to mark important sections of a video. These sections can be viewed later without the need to search for it in the entire video.

This plugin provides you the ability to mark important sections of a video. These sections can be viewed later without the need to search for it in the entire video.

All plugin options are :

<b>start</b>   	 : click to mark the start of the important section

<b>stop</b>    	 : click to mark the end of the important section

<b>play</b>    	 : click to play the selected section

<b>reset</b>   	 : click to set the marked contents to null

<b>playall</b> 	 : click to play all the marked sections of the video

<b>delete</b>  	 : click to delete a particular marked section

<b>add comment</b>  : click to add comment for the marked section

<b>show comment</b> : click to show the comment added for the selected section

### working:

The plugin works by storing the marked sections in a file(along with the comments). when the video is played again, the pop up box would contain the start and stop time of the marked sections. We can select from among the listed sections and perform our desired operation.

### installation:

create a folder to contain the .txt files. Locate the function activate in the code. Copy the address of the folder to the variable address as shown in the code and save it. 

run the following command :

#### mac Users : cp [location of the code]/marker.lua  /Applications/VLC.app/Contents/MacOS/share/lua/extensions/

#### linux Users : cp [location of the code]/marker.lua ~/.local/share/vlc/lua/extensions/

above command simply copies the code to the extensions sub-directory of our vlc application.

after completion, open vlc and enjoy the plugin.
