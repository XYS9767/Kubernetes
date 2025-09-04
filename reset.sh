#!/bin/bash

ansible-playbook -i ali.ini -e @v.yml 99-reset-cluster.yml 
