
# Mounting File Systems via CIFS or SSHFS

This guide walks you through mounting file systems using CIFS or SSHFS on a Linux system. 
These methods are useful for accessing remote directories securely and efficiently.

---

## Prerequisites

Before starting, ensure:

1. You have **root or sudo access**.
2. Necessary packages are installed:
    - For CIFS: `sudo apt install cifs-utils`
    - For SSHFS: `sudo apt install sshfs`
3. Credentials or access keys for the remote server are ready.
4. Proper permissions on the local system to manage directories.

---

## Steps to Mount File Systems

### 1. Create the Mount Directory

This will be the local directory where the remote file system will be mounted.
```bash
mkdir -p /mnt/folder_a
```

---

### 2. Adjust Permissions

Set the appropriate permissions to allow access to the mount directory.
```bash
chmod -R 775 /mnt/folder_a
```
- `775`: Grants read/write/execute permissions to the owner and group, and read/execute permissions to others.

---

### 3. Set Ownership

Change ownership of the directory to the required user and group.
```bash
chgrp -R group_a /mnt/folder_a
chown -R user_a /mnt/folder_a
```

---

### 4. Mounting via CIFS
CIFS (Common Internet File System) is typically used for accessing SMB shares.

#### Command:
```bash
sudo mount -t cifs -o username=user_a,password=pass_a //server_a/folder_a /mnt/folder_a
```

#### Explanation:
- `-t cifs`: Specifies the CIFS file system type.
- `-o username=user_a,password=pass_a`: Provides the username and password for authentication.
- `//server_a/folder_a`: The remote SMB/CIFS share.
- `/mnt/folder_a`: The local mount point.

#### Tips:

- Use a `credentials` file for security:
    1. Create a file (e.g., `/etc/smbcredentials`):
        ```bash
        echo "username=user_a" > /etc/smbcredentials
        echo "password=pass_a" >> /etc/smbcredentials
        chmod 600 /etc/smbcredentials
        ```
    2. Update the command:
        ```bash
        sudo mount -t cifs -o credentials=/etc/smbcredentials //server_a/folder_a /mnt/folder_a
        ```

---

### 5. Mounting via SSHFS

SSHFS (SSH File System) allows mounting remote directories over SSH.

#### Command:
```bash
sudo sshfs -o allow_other,IdentityFile=~/.ssh/id_rsa user_a@server_a:/folder_a /mnt/folder_a
```

#### Explanation:
- `allow_other`: Enables access to users other than the one mounting.
- `IdentityFile=~/.ssh/id_rsa`: Specifies the SSH private key for authentication.
- `user_a@server_a:/folder_a`: The remote SSH server and directory.
- `/mnt/folder_a`: The local mount point.

#### Tips:
- Ensure the `fuse` module is loaded:
    ```bash
    sudo modprobe fuse
    ```
- To auto-mount at boot, add an entry in `/etc/fstab`:
    ```bash
    user_a@server_a:/folder_a /mnt/folder_a fuse.sshfs defaults,allow_other,IdentityFile=~/.ssh/id_rsa 0 0
    ```

---

## Additional Notes

1. **Unmounting File Systems**

   ```bash
   sudo umount /mnt/folder_a
   ```

2. **Debugging Mount Issues**
   - Verify network connectivity to the server.
   - Check for missing dependencies: `dmesg` or `/var/log/syslog` may provide clues.
   - For CIFS, ensure the remote share exists and the credentials are correct.
   - For SSHFS, test SSH access independently:
     ```bash
     ssh user_a@server_a
     ```

3. **Persistent Mounts**
   - Add entries to `/etc/fstab` for persistent mounts. Example for CIFS:
     ```bash
     //server_a/folder_a /mnt/folder_a cifs credentials=/etc/smbcredentials,iocharset=utf8,sec=ntlm 0 0
     ```

---
