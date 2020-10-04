#!/bin/sh

export prometheus_multiproc_dir=/tmp
export APP_VERSION=$(cat VERSION)

echo "Starting gunicorn"
exec gunicorn -w 4 -c config/gunicorn.py app.app:app

