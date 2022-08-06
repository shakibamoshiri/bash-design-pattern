set -C
set -Ee
set -T
set -u
set -o pipefail

# content of a file we need
FILE_MD=$(<file.md);
REPO='tmp';
CWD='/home/git/tmp';


# variable for curl using single quote => ' not double "
CURL_DATA='{
    "repository": '$REPO',
    "command": "git",
    "args": [
        "pull",
        "origin",
        "'$FILE_MD'"
    ],
    "options": {
        "cwd": '"'/home/git/tmp'"'
    }
}';

echo "$CURL_DATA";


