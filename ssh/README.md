# Intro

SSH is used to access files on other machines, for example when you want to remotely log in or even copy files to/from git repositories (i.e. github, bitbucket).

# Getting your key

Generate with...

`ssh-keygen -lf ~/.ssh/id_rsa.pub`

# Sharing your key

It'll be the stuff in `~/.ssh/id_rsa.pub`, which means you can just view the file contents to see what it is. Ctrl+c with your keyboard to copy the output

`cat ~/.ssh/id_rsa.pub`

The output key is what you'll need to add into your github profile. 


# Saving configurations to speed up access time

The settings are usually saved in a file located at `~/.ssh/config` where *config* is the filename (no file extensions).

Other files to know:

*known_hosts*

*authorized_keys*

