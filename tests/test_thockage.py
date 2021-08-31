import unittest
import importlib

#import audio
#import thockage.definitions

SRC_PATH = "../thockage"
audio = importlib.import_module("audio", SRC_PATH)
config = importlib.import_module("config", SRC_PATH)
definitions = importlib.import_module("definitions", SRC_PATH)
keyboard_control = importlib.import_module("keyboard_control", SRC_PATH)
cli = importlib.import_module("cli", SRC_PATH)


class FileDetection(unittest.TestCase):
    pass
