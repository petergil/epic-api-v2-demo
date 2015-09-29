# epic-api-v2-demo

Shell script to demonstrate the use of the epic API based on 8 examples (see the 'usage' section below).

Access with administrative permissions for a prefix in an EPIC instance is needed. Please contact the EPIC operator of your choice.

# Configuration

Credentials need to be configured in a separate file. This ensures passwords don't have to be entered and are not visible during demonstrations.
This file, 'epic.credentials', has the following syntax:
```
SERVER="<epic api base url>"
PREFIX="<your prefix>"
PASSWORD="<your password>"
TEST_HANDLE="<a test handle>"
```
Where:
* "SERVER": should point to your epic instance root URL.
* "PREFIX": your epic handle prefix.
* "PASSWORD": your epic password.
* "TEST_HANDLE": a test handle (prefix/postfix) which has to pre-exist and is used in step 2, 3 and 8.

Make sure the 'pid.client.sh" file is executable.

# Usage

```
Run ./pid.client.sh (1|2|3|4|5|6|7)

Where:
	1) List all prefixes in the epic server
	2) List all handles under the prefix
	3) List the handle record
	4) Create a new handle (POST)
	5) Create a new handle (PUT)
	6) Update a handle (PUT)
	7) Delete a handle (DELETE)
	8) Search on key=value in a prefix
```

There are two addition files:
1. "new_pid.json", which specifies the (key,value) pairs that should be associated with the newly minted PID.
2. "update_pid.json", which specifies the (key,value) pairs that should be updated.
