#!/usr/bin/env bash

# MIT License
#
# Copyright (c) 2021 Ethan Lane <ethan@vylpes.com>

dbfile="gos.db.tar.xz"
dbpackages=$(ls packages | sed '/.sig/d')

for package in $dbpackages; do
	repo-add $dbfile packages/$package --sign
done
