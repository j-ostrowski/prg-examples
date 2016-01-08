#!/usr/bin/python

import os
fout = os.open("foo", os.O_WRONLY | os.O_CREAT, 0644)
os.write(fout, "hello world\n".encode("utf-8"))
os.close(fout)


