#
# Copyright (c) 2014 Nico Schlömer
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
include_directories(../src/)

add_executable(sample sample.c)
target_link_libraries(sample hbio)

add_executable(hbrhs2mtx hbrhs2mtx.c)
target_link_libraries(hbrhs2mtx hbio)

add_executable(hbmat2hb hbmat2hb.c)
target_link_libraries(hbmat2hb hbio)

add_executable(hbmat2mtx hbmat2mtx.c)
target_link_libraries(hbmat2mtx hbio)

add_executable(hb2mtxstrm hb2mtxstrm.c)
target_link_libraries(hb2mtxstrm hbio)
