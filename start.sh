#!/bin/bash

ansible-playbook -i ali.ini -e @v.yml 90-init-cluster.yml 
