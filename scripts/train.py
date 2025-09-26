import os
import yaml
from yolov5 import train

project_root = os.environ.get('PROJECT_ROOT')
if not project_root:
    raise ValueError("Environment variable PROJECT_ROOT is not set.")

def load_yaml_with_env(path):
    with open(path) as f:
        raw = f.read()
    resolved = os.path.expandvars(raw)
    return yaml.safe_load(resolved)

cfg_path = os.path.join(project_root, "config/config.yaml")
cfg = load_yaml_with_env(cfg_path)
# print(cfg['train'])

# train.run(epochs=cfg['train']['epochs'],
#           batch=cfg['train']['batch_size'],
#           imgsz=cfg['train']['img_size'],
#           data=os.path.join(project_root, cfg['train']['data']),
#           cfg=os.path.join(project_root, cfg['train']['cfg']),
#           weights=os.path.join(project_root, cfg['train']['weights']))
train.run(**cfg['train'])