-- PLUGIN : MARKER
-- version 1.0
-- By Nimish Sharma and Amit Sharma 
-- Lua code was learned from websites such as http://lua.gts-stolberg.de/en/?uml=1 and http://www.lua.org/start.html


k=nil --temporary variable
m=0 --temporary variable
array1={}
array2={}
array3={}
address=nil --temporary variable


function descriptor()

    return {
     title = "MARKER" 
     version = "1.0"; 
     author = "Amit-Nimish";
     capabilities = {"input-listener"}
   }

end


function activate()

    inpt = vlc.object.input()
    nam = vlc.input.item():name()
    address="/Users/sharmanimish55/Downloads/VlcPlugTxt/".. nam ..".txt"
    create_dialog(nam)

end

function create_dialog(a)

  lp=3
	w = vlc.dialog(a)
	w:add_label("<h4>EXTENSION</h4>",3,1,4,1)
	lst = w:add_list(1,3,5,lp)
	p=io.open(address,"r")
  if p then
    temp_func()
	end
	
  w:add_button("START", start_time,1,2+lp)
	w:add_button("STOP", stop_time,3,2+lp)
  w:add_button("PLAY", play_selected,5,2+lp)
	w:add_button("RESET", reset_all,1,3+lp)
  w:add_button("PLAYALL", play_all,3,3+lp)
	w:add_button("DELETE", delete_selected,5,3+lp)
	tb = w:add_text_input("",1,4+lp)
	w:add_button("ADD COMMENT", add_note,3,4+lp)
	w:add_button("SHOW COMMENT", show_note,5,4+lp)

end

function add_note()

	place()
	txt = tb:get_text()
	t=lst:get_selection()
	local item
	for id,item in pairs(t) do
		m=id
	end

	array3[m]=txt
	file=io.open(address,"w")
	file:close()

	file=io.open(address,"a")
	if file then
	  k=1
 	  while true do
	    if array1[k]==nil then break end
 	      file:write(array1[k] .. "  " .. array2[k] .. "-" .. array3[k] .. "\n")
   	  k=k+1
    end
  end
  
  file:close()
	lst:clear()
	temp_func()
	tb:set_text("")

end

function show_note()

	t=lst:get_selection()
	local item
	for id,item in pairs(t) do
		m=id
	end
	tb:set_text(array3[m])

end

function start_time()
    tim1 = vlc.var.get(inpt, "time") -- seconds from beginning
end

function stop_time()

    tim2 = vlc.var.get(inpt, "time") -- seconds from beginning
    file=io.open(address,"a")

    if file then
      file:write(tim1 .. " " .. tim2 .. "-\n")
    end

    file:close()
    lst:clear()
    temp_func()

end

function temp_func()
  display()
end

function reset_all()

  file=io.open(address,"w")
  vlc.var.set(inpt,"time",0)
  array1={}
  array2={}
  array3={}
  lst:clear()

end

function play_all()

    place()
    local  k=1
    while true do
      if array1[k]==nil then break end
      vlc.var.set(inpt,"time",array1[k])
      os.execute("sleep " .. array2[k]-array1[k])
      k=k+1
    end

end

function place()

  array1={}
  array2={}
  array3={}
  local k1=1
  k2=1
  i=1
  file=io.open(address,"r")

  while true do
    line = file:read()
    if line == nil then break end
    k1=string.find(line," ")
    k2=string.find(line,"%-")
    l=string.len(line)
    array1[i]=tonumber(string.sub(line,1,k1))
    array2[i]=tonumber(string.sub(line,k1+1,k2-1))
    array3[i]=string.sub(line,k2+1,l)
    i=i+1
  end

  file:close()

end

function display()  

   place()
   k=1
   f=1

   while true do
      if array1[k]==nil then 
        break
      end

      lst:add_value(array1[k] .. " " .. array2[k],f)
      k=k+1
      f=f+1
   end

end

function play_selected()

	place()
  local t=lst:get_selection()
	local item
	for id,item in pairs(t) do
    vlc.var.set(inpt,"time",array1[id])
    os.execute("sleep " .. array2[id]-array1[id])
	end

end

function delete_selected()

	local id
	place()
  local t=lst:get_selection()
	local item

	for id,item in pairs(t) do
	   y=id
	end

	file=io.open(address,"w")
	file:close()

	file=io.open(address,"a")
	if file then
	  k=1
 	  while true do

 	    if k==y then 
        k=k+1 
      end

	    if array1[k]==nil then
        break 
      end
 	    
      file:write(array1[k] .. "  " .. array2[k] .. "-" .. array3[k] .. "\n")
   	  k=k+1

   	end

  end
  
  file:close()
	lst:clear()
	temp_func()

end

function deactivate()
end
