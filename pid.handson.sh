#!/bin/sh

source epic.credentials
ACCEPT="Accept:application/json"

function epic_request() {
	echo "Request:"
	echo "\tcurl --user $PREFIX:\$PASSWORD --header \"$ACCEPT\" \"$SERVER$1\""
	echo ""
	echo "Press any key to send the request"
	read -n 1 -s
	echo ""
	echo "Response:"
	curl --user $PREFIX:$PASSWORD --header "$ACCEPT" "$SERVER$1"
	echo ""
}

function epic_create() {
	echo "Request:"
	echo "\tcurl -s -D - --fail --user $PREFIX:\$PASSWORD --data @$2 --header \"Content-type: application/json\" \"$SERVER$1\" -o /dev/null"
        echo ""
        echo "Press any key to send the request"
        read -n 1 -s
	echo ""
        echo "Response:"
	curl -s -D - --fail --user $PREFIX:$PASSWORD --data @$2 --header "Content-type: application/json" "$SERVER$1" -o /dev/null
        echo ""
}

function epic_modify() {
	echo "Request:"
        echo "\tcurl -s -D - --user $PREFIX:\$PASSWORD --upload-file $2 --header \"Content-type: application/json\" \"$SERVER$1$3\" -o /dev/null"
        echo ""
        echo "Press any key to send the request"
        read -n 1 -s
	echo ""
        echo "Response:"
        curl -s -D - --user $PREFIX:$PASSWORD --upload-file $2 --header "Content-type: application/json" "$SERVER$1$3" -o /dev/null
        echo ""
}

function epic_delete() {
	echo "Request:"
        echo "\tcurl -s -D - --user $PREFIX:\$PASSWORD -X DELETE  \"$SERVER$1$2\" -o /dev/null"
        echo ""
        echo "Press any key to send the request"
        read -n 1 -s
	echo ""
        echo "Response:"
        curl -s -D - --user $PREFIX:$PASSWORD -X DELETE "$SERVER$1$2" -o /dev/null
        echo ""
}

case $1 in
	1)
		epic_request "/handles"
		;;
	2)
		epic_request "/handles/$PREFIX"
		;;
	3)
		epic_request "/handles/$PREFIX/$TEST_HANDLE"
		;;
	4)
		epic_create "/handles/$PREFIX/" "new_pid.json"
		;;
	5)
		epic_modify "/handles/$PREFIX/" "new_pid.json" "demo_handle"
		;;
	6)
		epic_modify "/handles/$PREFIX/" "update_pid.json" "demo_handle"
		;;
	7)
		epic_delete "/handles/$PREFIX/" "demo_handle"
		;;
	8)
		epic_request "/handles/$PREFIX/?EMAIL=john.doe@example.com"
		;;
	*)
		echo ""
		echo "Run ./pid.client.sh (1|2|3|4|5|6|7)"
		echo ""
		echo "Where:"
		echo "\t1) List all prefixes in the epic server"
		echo "\t2) List all handles under the prefix"
		echo "\t3) List the handle record"
		echo "\t4) Create a new handle (POST)"
		echo "\t5) Create a new handle (PUT)"
		echo "\t6) Update a handle (PUT)"
		echo "\t7) Delete a handle (DELETE)"
		echo "\t8) Search on key=value in a prefix"
		echo ""
		;;
esac

