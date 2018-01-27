#!/bin/bash 
konsole --noclose -e "erl -name barn@127.0.0.1 -setcookie secret -s start_module barnapp" &
konsole --noclose -e "erl -name hayfield@127.0.0.1 -setcookie secret -s start_module hayfieldapp" &
konsole --noclose -e "erl -name farmer@127.0.0.1 -setcookie secret -s start_module farmerapp" &
konsole --noclose -e "erl -name cow@127.0.0.1 -setcookie secret -s start_module cowapp" & 
konsole --noclose -e "erl -name wife@127.0.0.1 -setcookie secret -s start_module wifeapp"