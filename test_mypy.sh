#!/bin/bash
serverIp=159.89.154.87
pip install mypy
python3 typecheck.py
eval "$(ssh-agent -s)"
chmod 600 root_key
ssh-keyscan $serverIp >> ~/.ssh/known_hosts
ssh-add root_key
zip -r mypy_test_cache.zip mypy_test_cacheyes | scp -i root_key ./mypy_test_cache.zip root@$serverIp:~/cache/scikit-learn---scikit-learn.zip
yes | scp -i root_key ./mypy_test_report.txt root@$serverIp:~/report/scikit-learn---scikit-learn.txt
