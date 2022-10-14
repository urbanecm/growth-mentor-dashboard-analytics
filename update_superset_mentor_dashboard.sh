#!/bin/bash

cd '/home/urbanecm/Documents/Growth/mentorship/analysis'

source conda-activate-stacked 2021-04-07T23.21.00_urbanecm
export PATH=/usr/local/bin:$PATH

# web access is needed, as data about mentor counts are downloaded from the wikis
export http_proxy=http://webproxy.eqiad.wmnet:8080
export https_proxy=http://webproxy.eqiad.wmnet:8080

jupyter nbconvert --to html --execute 'mentor-dashboard-analytics.ipynb'
jupyter nbconvert --to html --execute 'update_mentor_lists.ipynb'
jupyter nbconvert --to html --execute 'mentorship-optout-analytics.ipynb'

hdfs dfs -chmod -R o+rx /user/urbanecm/growth_data
