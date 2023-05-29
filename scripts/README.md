# Update scripts for surveys and config

### Pre Requisites
1. Ensure python 3 with `firebase_admin` installed
    You can install it by using `pip install firebase_admin`
2. Google credentials `key.json`


### Updating Surveys
1. Write a new survey/update survey in surveys folder
2. ```python "update survey.py" --filepath "./surveys/sample survey.json"```
3. If `key.json` is not in this folder, use ```python "update survey.py" --filepath "./surveys/sample survey.json" --key <PATH TO key.json>```

### Updating Config
1. Write a new config/update config in surveys folder
2. ```python "update config.py" --filepath "./configs/v1.json"```
3. If `key.json` is not in this folder, use ```python "update config.py" --filepath "./configs/v1.json" --key <PATH TO key.json>```