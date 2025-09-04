#!/bin/bash

ansible-playbook -i ali.ini -e @v.yml 81-add-worker.yml 
