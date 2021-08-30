from pynput.keyboard import Key
from audio import audio

# wtb match
cpdef keyboard_control(key):
    if key == Key.space:
        audio.play_space()
    
    elif key == Key.enter:
        audio.play_enter()
        
    elif key == Key.esc:
        audio.play_esc()
    
    elif key == Key.alt:
        audio.play_alt()
    
    elif key == Key.shift:
        audio.play_shift()
    
    elif key == Key.tab:
        audio.play_tab()
        
    elif key == Key.enter:
        audio.play_enter()
    
    elif key == Key.backspace:
        audio.play_backspace()
    
    elif key == Key.ctrl:
        audio.play_ctrl()
        
    elif key == Key.cmd:
        audio.play_cmd()
    
    else:
        audio.play_general()
        
        