#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

# Run rails dependencies commands
rails db:create
rails db:migrate
rails db:seed

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"