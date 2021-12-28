#!/usr/bin/env bash

# MIT License
# 
# Copyright (c) 2021 Ethan Lane <ethan@vylpes.com>
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# Generate DB File
dbfile="gos.db.tar.xz"
dbpackages=$(ls packages | sed '/.sig/d')

for package in $dbpackages; do
    repo-add $dbfile packages/$package --sign
done

scp gos.* repo.vylpes.com:/mnt/blockstorage/packages/x86_64

# Upload packages to GOS Server
scp packages/* repo.vylpes.com:/mnt/blockstorage/packages/x86_64

# Upload index.html to GOS Server
scp index.html repo.vylpes.com:/mnt/blockstorage/packages