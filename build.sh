#!/usr/bin/env bash
set -x
# https://github.com/golang/go/issues/9326
# gdb: No struct type named runtime.rtype
# https://github.com/golang/go/commit/a25af2e99e21fe9011d4057cfab1e0cb0ffb3cdb
sed -i 's/_rctp_type = gdb.lookup_type("struct runtime.rtype").pointer()/_rctp_type = gdb.lookup_type("struct reflect.rtype").pointer()/g' /usr/local/go/src/runtime/runtime-gdb.py
export GOROOT=/usr/local/go/
hack/make.sh binary
gdb -d $GOROOT bundles/1.7.0-dev/binary/docker 
# source /usr/local/go/src/runtime/runtime-gdb.py
