CHUNKSERVERS=1 \
	MOUNTS=1 \
	USE_RAMDISK=YES \
	setup_local_empty_lizardfs info

cd "${info[mount0]}"

dot_hello=".hello"

if [ $(cat "${dot_hello}" | grep -E -i -c "^Hello world\!$") -ne 1 ]; then
	test_add_failure "The file '${dot_hello}' does not contain the text 'Hello world!'"
fi

if [ $(cat "${dot_hello}" | wc -l) -ne 1 ]; then
	test_add_failure "There are more than one line in file '${dot_hello}'"
fi
