
#!/bin/bash
# Diskclean-Linux.sh - Remove unused files from /tmp directories
# @author: Crunchify.com
 
# ------------- Here are Default Configuration --------------------
# CRUNCHIFY_TMP_DIRS - List of directories to search
# DEFAULT_FILE_AGE - # days ago (rounded up) that file was last accessed
# DEFAULT_LINK_AGE - # days ago (rounded up) that symlink was last accessed
# DEFAULT_SOCK_AGE - # days ago (rounded up) that socket was last accessed
 
CRUNCHIFY_TMP_DIRS="/tmp /var/tmp /usr/src/tmp /mnt/tmp"
DEFAULT_FILE_AGE=+2
DEFAULT_LINK_AGE=+2
DEFAULT_SOCK_AGE=+2
 
# Make EMPTYFILES true to delete zero-length files
EMPTYFILES=false
#EMPTYFILES=true
 
cd
/tmp/log "cleantmp.sh[$$] - Begin cleaning tmp directories"
 
echo ""
echo "delete any tmp files that are more than 2 days old"
/usr/bin/find $CRUNCHIFY_TMP_DIRS                               \
     -depth                                                     \
     -type f -a -ctime $DEFAULT_FILE_AGE                        \
     -print -delete
echo ""
