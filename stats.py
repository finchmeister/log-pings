import os
from datetime import datetime

up_count = down_count = 0.0
offline_count = 0
previous_state = up = previous_state_change_time = None
duration = ''
last_time_went_online = current_time = None

for line in open("status.log").readlines():
    log_entry = line.rstrip()
    if 'UP' in log_entry:
        up_count = up_count + 1
        up = True
    if 'DOWN' in log_entry:
        down_count = down_count + 1
        up = False
    log_date = log_entry[0:log_entry.find('::')]
    current_time = datetime.strptime(log_date, '%a %d %b %H:%M:%S %Z %Y')
    if up is not previous_state:
        if previous_state_change_time is not None:
            duration = current_time - previous_state_change_time
        if up:
            print 'We have gone Up:\t' + log_date + '\t Down for: ' + str(duration)
            last_time_went_online = current_time
        else:
            print 'We have gone Down:\t' + log_date + '\t Up for: ' + str(duration)
            offline_count = offline_count + 1
        previous_state_change_time = current_time
    previous_state = up


if up_count is 0.0:
    up_time_percent = 0
else:
    up_time_percent = 1 - (down_count / up_count)

print 'Uptime: {:.5%}'.format(up_time_percent)
print 'Up since: ' + str(last_time_went_online) + " (" + str(current_time - last_time_went_online) + ")"
print 'Outages: ' + str(offline_count)

