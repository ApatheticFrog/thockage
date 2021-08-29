
from config import config
import random
import sounddevice as sd
import soundfile as sf

default = config.get("modes").get("default")

general_sounds = default.get("general")
alt_sounds = default.get("alt")
shift_sounds = default.get("shift")
backspace_sounds = default.get("backspace")
tab_sounds = default.get("tab")
esc_sounds = default.get("esc")
enter_sounds = default.get("enter")
space_sounds = default.get("space")
cmd_sounds = default.get("cmd")
ctrl_sounds = default.get("ctrl")


cpdef play_general():
    _play_random_sound_from_list(general_sounds)


cpdef play_space():
    _play_random_sound_from_list(space_sounds)
    

cpdef play_enter():
    _play_random_sound_from_list(enter_sounds)


cpdef play_esc():
    _play_random_sound_from_list(esc_sounds)


cpdef play_alt():
    _play_random_sound_from_list(alt_sounds)


cpdef play_shift():
    _play_random_sound_from_list(shift_sounds)
 

cpdef play_tab():
    _play_random_sound_from_list(tab_sounds)


cpdef play_backspace():
    _play_random_sound_from_list(backspace_sounds)


cpdef play_cmd():
    _play_random_sound_from_list(cmd_sounds)


cpdef play_ctrl():
    _play_random_sound_from_list(ctrl_sounds)

 
cpdef _play_random_sound_from_list(sound_list):
    cdef sound = sound_list[random.randint(0, len(sound_list)-1)]
    array, smp_rt = sf.read(sound, dtype = 'float32') 
    sd.play(array, smp_rt)
 