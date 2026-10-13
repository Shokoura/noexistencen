#!/bin/sh
cd "$(dirname "$0")"
PORT=${1:-8080}
echo "Serving on http://localhost:$PORT"
exec node serve.js "$PORT"
