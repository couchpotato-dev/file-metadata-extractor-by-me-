# Bash Recon Toolkit

A couple of bash scripts for basic recon and metadata extraction on Kali Linux.

---

### ping.sh
Checks if a host is up or down.
```bash
./ping.sh 192.168.1.1
```

### metadata.sh
Pulls and saves metadata from any file using `stat`, `ls`, `file`, and `exiftool`.
```bash
./metadata.sh photo.jpg
# saves results to photo.jpg_metadata.txt
```
Requires: `sudo apt install exiftool`
