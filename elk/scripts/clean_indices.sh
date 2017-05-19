# install curator, sudo pip install elasticsearch-curator
# only save latest 3 days indices
# add to crontab: 0 1 * * *  /root/elk/clean_indices.sh
/usr/local/bin/curator delete indices --older-than 3 --time-unit days --timestring '%Y.%m.%d'