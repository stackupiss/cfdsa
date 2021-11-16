#!/usr/bin/env bash
gunicorn -b ":${PORT:-3000}" main:app
