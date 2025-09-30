#!/usr/bin/python3

import signal as sig 
from time import sleep
import os

ignore_quit = False 


def signal_handler(s, frame) : 
#	print ( "réception du signal ", sig.Signals(s).name )
	if sig.Signals(sig.SIGINT).name == "SIGINT" : 
		print ( "réception du signal ", sig.Signals(s).name, "process arreté")
		exit()
	if sig.Signals(sig.SIGINT).name == "SIGQUIT" : 
		print ( "réception du signal ", sig.Signals(s).name)
		ignore_quit = True
x=1
sig.signal(sig.SIGINT, signal_handler)


while True:
	if ignore_quit == True:
		ignore_quit = False  
		continue
	print("pid=", os.getpid(), x)
	sleep(5)
	x += 1 

