-- Generated by the Nim Compiler v1.0.6
--   (c) 2019 Andreas Rumpf

local framePtr = nil
local excHandler = 0
local lastLuaError = nil
local unp = pcall(function() return unpack end) and unpack or table.unpack
function rawEcho()
  local buf = ""
  for i = 1, #arg do
    buf = buf .. toLuaStr(arg[i]);
  end
  print(buf)



end

function makeNimstrLit(c_195270)
  local ln = #c_195270
  local result = {[ln]=nil};
  for i = 1, ln do
    result[i] = string.byte(c_195270, i)
  end
  return result



end
local nim_program_result = 0;
local global_raise_hook_126418 = {nil};
local local_raise_hook_126423 = {nil};
local out_of_mem_hook_126426 = {nil};

function new_seq_195336(len_195339)
  local result_195341 = nil

  local F={procname="newSeq.newSeq",prev=framePtr,filename="system.nim",line=0};
  framePtr = F
  F.line = 971
  result_195341 = {nil}; len_195339 = nil; for i = 1, len_195339 do result_195341[i]=nil end	framePtr = F.prev

  return result_195341

end

function toLuaStr(s_195304)
  local Tmp5
  local Tmp7

  local result_195305 = nil

  local res_195378 = new_seq_195336((s_195304 ~= nil and #s_195304 or 0))
  local i_195380 = 0
  local j_195382 = 0
  do
    while true do
      if not (i_195380 < (s_195304 ~= nil and #s_195304 or 0)) then goto L2 end
      local c_195383 = s_195304[(i_195380 + 1)]
      if (c_195383 < 128) then
        res_195378[(j_195382 + 1)] = string.char(c_195383)
        i_195380 = i_195380 + 1
      else
        local helper_195406 = new_seq_195336(0)
        do
          while true do
            if not true then goto L4 end
            local code_195407 = string.format('%02X', string.byte(c_195383))
            if ((code_195407 ~= nil and #code_195407 or 0) == 1) then
              if helper_195406 ~= nil then table.insert(helper_195406, "%0") else helper_195406 = {"%0"} end
            else
              if helper_195406 ~= nil then table.insert(helper_195406, "%") else helper_195406 = {"%"} end
            end

            if helper_195406 ~= nil then table.insert(helper_195406, code_195407) else helper_195406 = {code_195407} end
            i_195380 = i_195380 + 1
            if ((s_195304 ~= nil and #s_195304 or 0) <= i_195380) then Tmp5 = true else											Tmp5 = (s_195304[(i_195380 + 1)] < 128);										end									if Tmp5 then
              goto L3
            end

            c_195383 = s_195304[(i_195380 + 1)]
						end ::L4::
					end ::L3::
					excHandler = excHandler + 1
					Tmp7 = framePtr
					local anyEXC, EXC = pcall(function()
					res_195378[(j_195382 + 1)] = decodeURIComponent(table.concat(helper_195406, ""))
					end)
					excHandler = excHandler - 1
				end
				if anyEXC then local prevLuaError = lastLuaError
					lastLuaError = EXC
					excHandler = excHandler - 1
					framePtr = Tmp7
					res_195378[(j_195382 + 1)] = table.concat(helper_195406, "")
					lastLuaError = prevJSError;
				end
				framePtr = Tmp7;
			end

      j_195382 = j_195382 + 1
		end ::L2::
	end ::L1::
  if res_195378 == nil then res_195378 = {} end
  if #res_195378 < j_195382 then for i = #res_195378+1,j_195382 do res_195378[i] = nil end
  else for i = j_195382+1, #res_195378 do table.remove(res_195378, i) end end
      result_195305 = table.concat(res_195378, "")

      return result_195305

end
rawEcho(makeNimstrLit("hello world"))