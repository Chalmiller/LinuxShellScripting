#!/usr/bin/env bash

who | sort | awk '{print $1}'