import click
from audio import audio
from definitions import modes
from pynput.keyboard import Listener
from keyboard_control import keyboard_control


@click.group()
def manager():
    pass


@manager.command()
@click.option("--mode", "-m", type=click.Choice(list(modes.available_modes.keys()), case_sensitive=False))
def run(mode):
    if mode:

        print(mode)
        modes.change_mode(mode)
        audio.sound_mode_update()
        print(modes.selected_mode)

    # Collect all event until released
    with Listener(on_press = keyboard_control) as listener:   
        listener.join()

    

