ps afx | awk '$3 ~ /l/'

df -Th

# Check disk usage by directory
du -sh /*

# Check running processes by CPU usage
top -bn1 | head -20

# Check network connections
netstat -tuln

# Check system logs for errors
journalctl -p err --since "1 hour ago"

# Check system load
uptime

# Check mounted filesystems
mount | column -t

df -i
