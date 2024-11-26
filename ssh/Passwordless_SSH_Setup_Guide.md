# Passwordless SSH Setup Guide

## Step 1: Check for Existing SSH Keys on Host A

Before generating a new SSH key pair, it's a good idea to check if you already have an SSH key on your local machine:

`ls -l ~/.ssh`

Look for files named `id_rsa`, `id_ecdsa`, `id_ed25519`, or similar, with a `.pub` extension for the public key.

## Step 2: Generate a New SSH Key Pair

If you do not have an existing key or want to create a new one specifically for this connection:

1. Open a terminal on Host A.
2. Run the SSH key generation command:

`ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa_hpc`

When prompted for a passphrase, you can either enter one for additional security or press Enter for no passphrase.

## Step 3: Copy the Public Key to Remote Host B

Use `ssh-copy-id` to copy the new public key to the remote host:

`ssh-copy-id -i ~/.ssh/id_rsa_hpc.pub user@remotehostB`

Replace `user` with your actual username on Remote Host B and `remotehostB` with the actual hostname or IP address. You'll be asked for the user's password on Remote Host B.

## Step 4: Test the SSH Connection

Test your SSH connection to ensure that you can log in without a password:

`ssh -i ~/.ssh/id_rsa_hpc user@remotehostB`

## Step 5: Secure the SSH Keys and Directories (Optional but Recommended)

Set the correct permissions for the `.ssh` directory and the `authorized_keys` file on both your local machine and the remote host:

- On Host A:

  ```bash
  chmod 700 ~/.ssh
  chmod 600 ~/.ssh/id_rsa_hpc
  ```
- On Remote Host B:

  ```bash
  ssh user@remotehostB 'chmod 700 ~/.ssh; chmod 600 ~/.ssh/authorized_keys'
  ```

## Step 6: Confirm One-Way Access

To ensure that the remote host cannot initiate an SSH connection back to your local machine, do not set up reverse SSH key authentication. Also, check the `~/.ssh/authorized_keys` file on your local machine regularly to ensure no unauthorized public keys have been added.

## Tips and Best Practices

- Always use a passphrase for SSH keys used on critical systems for an extra layer of security.
- Use `ssh-agent` on Host A to manage your keys and passphrases.
- Regularly rotate your SSH keys and update the `authorized_keys` file on your servers.
- Limit SSH access to specific IPs where possible through SSH configuration or firewall rules.

