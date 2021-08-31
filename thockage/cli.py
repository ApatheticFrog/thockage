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
        modes.change_mode(mode)
        audio.sound_mode_update()

    # Collect all event until released
    with Listener(on_press=keyboard_control) as listener:
        listener.join()


def main() -> None:
    manager()


if __name__ == "__main__":
    main()
