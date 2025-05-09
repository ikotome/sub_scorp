#!/bin/bash
set -e

rm -f /subscorp/tmp/pids/server.pid

exec "$@"

