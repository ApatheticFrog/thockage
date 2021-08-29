import toml
import sys

_config_path: str = "config.toml"
_config_string: str = ""
config = None

try: 
    _config_string = open(_config_path, "r").read()
except Exception as e:
    print(f"\nCould not load config file. Is there a config.toml file in the root of the program's directory?\n {e}")
    sys.exit(1)

try:
    config = toml.loads(_config_string)
except Exception as e:
    print(f"\nToml library could not interpret configuration file. Check for typos in config.toml\n{e}")
    sys.exit(1)
    
    
# Need evaluation of file names