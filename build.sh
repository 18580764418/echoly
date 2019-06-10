#!/bin/bash
docker build -t x11vnc:0.0.1 .
docker save x11vnc:0.0.1 > x11vnc.tar
