#!/bin/sh

gunicorn --bind 0.0.0.0 --log-level debug api:app
