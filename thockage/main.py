
from pynput.keyboard import Key, Listener
from audio import play_space, play_general
from keyboard_control import keyboard_control
 
# Collect all event until released
with Listener(on_press = keyboard_control) as listener:   
    listener.join()