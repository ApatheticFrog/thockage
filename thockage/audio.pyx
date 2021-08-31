
from config import config
import random
import sounddevice as sd
import soundfile as sf
from definitions import modes


cdef class Audio():
    cdef list general_sounds
    cdef list alt_sounds
    cdef list shift_sounds
    cdef list backspace_sounds
    cdef list tab_sounds
    cdef list esc_sounds
    cdef list enter_sounds
    cdef list space_sounds
    cdef list cmd_sounds
    cdef list ctrl_sounds

    def __cinit__(self):
        self.sound_mode_update()

    # Call after change in mode
    cpdef sound_mode_update(self):
        # General is the bare minimum
        self.general_sounds = modes.selected_mode.get("general")
        self.alt_sounds = modes.selected_mode.get("alt")
        self.shift_sounds = modes.selected_mode.get("shift")
        self.backspace_sounds = modes.selected_mode.get("backspace")
        self.tab_sounds = modes.selected_mode.get("tab")
        self.esc_sounds = modes.selected_mode.get("esc")
        self.enter_sounds = modes.selected_mode.get("enter")
        self.space_sounds = modes.selected_mode.get("space")
        self.cmd_sounds = modes.selected_mode.get("cmd")
        self.ctrl_sounds = modes.selected_mode.get("ctrl")

        self._sound_mode_check_empty()


    cpdef _sound_mode_check_empty(self):
        if not self.general_sounds:
            print("1 sound under the general tab is the bare minimum")
        if not self.alt_sounds:
            self.alt_sounds = self.general_sounds
        if not self.shift_sounds:
            self.shift_sounds = self.general_sounds
        if not self.backspace_sounds:
            self.backspace_sounds = self.general_sounds
        if not self.tab_sounds:
            self.tab_sounds = self.general_sounds
        if not self.esc_sounds:
            self.esc_sounds = self.general_sounds
        if not self.enter_sounds:
            self.enter_sounds = self.general_sounds
        if not self.space_sounds:
            self.space_sounds = self.general_sounds
        if not self.cmd_sounds:
            self.cmd_sounds = self.general_sounds
        if not self.ctrl_sounds:
            self.ctrl_sounds = self.general_sounds
        

    cpdef play_general(self):
        self._play_random_sound_from_list(self.general_sounds)


    cpdef play_space(self):
        self._play_random_sound_from_list(self.space_sounds)


    cpdef play_enter(self):
        self._play_random_sound_from_list(self.enter_sounds)


    cpdef play_esc(self):
        self._play_random_sound_from_list(self.esc_sounds)


    cpdef play_alt(self):
        self._play_random_sound_from_list(self.alt_sounds)


    cpdef play_shift(self):
        self._play_random_sound_from_list(self.shift_sounds)
    

    cpdef play_tab(self):
        self._play_random_sound_from_list(self.tab_sounds)


    cpdef play_backspace(self):
        self._play_random_sound_from_list(self.backspace_sounds)


    cpdef play_cmd(self):
        self._play_random_sound_from_list(self.cmd_sounds)


    cpdef play_ctrl(self):
        self._play_random_sound_from_list(self.ctrl_sounds)

    
    cpdef _play_random_sound_from_list(self, sound_list):
        cdef sound = sound_list[random.randint(0, len(sound_list)-1)]
        array, smp_rt = sf.read(sound, dtype = 'float32') 
        sd.play(array, smp_rt)
 

audio = Audio()