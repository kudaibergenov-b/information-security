import os
import datetime

log_file = os.path.expanduser("system_stats.log")

uptime = os.popen("uptime").read().strip()

disk_usage = os.popen("df -h /").read().strip()

timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")

log_entry = f"Timestamp: {timestamp}\nUptime: {uptime}\nDisk Usage:\n{disk_usage}\n{'-'*40}\n"

with open(log_file, "a") as file:
    file.write(log_entry)

print("System stats logged successfully!")
