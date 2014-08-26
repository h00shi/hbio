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
set(input_files
  add20.rua
  dwg961a.cua
  illc1033.rra
  mahindas.rua
  utm300.rua
  young1c.csa
  )

# Download the files
INCLUDE(ExternalData)
set(
  ExternalData_URL_TEMPLATES
  "https://downloads.sourceforge.net/project/hbio-data/%(algo)/%(hash)"
  )
foreach(file ${input_files})
  ExternalData_Expand_Arguments(
    HbioTestFetchData
    OUT_DATA DATA{${CMAKE_SOURCE_DIR}/data/${file}}
    )
  # Replace the file extension by "mtx"
  string(REGEX REPLACE "\\..*" ".mtx" file_mtx ${file})
  ExternalData_Expand_Arguments(
    HbioTestFetchData
    OUT_DATA DATA{${CMAKE_SOURCE_DIR}/data/${file_mtx}}
    )
endforeach()
ExternalData_Add_Target(HbioTestFetchData)

# Finally add the tests
foreach(file ${input_files})
  string(REGEX REPLACE "\\..*" ".mtx" file_mtx ${file})
  add_test(iotest_${file}
    ${CMAKE_COMMAND} -P ${CMAKE_SOURCE_DIR}/test/generator_test.cmake
    "${CMAKE_BINARY_DIR}/bin/hb2mtxstrm"
    "${CMAKE_BINARY_DIR}/data/${file}"
    "${CMAKE_BINARY_DIR}/data/${file_mtx}"
    )
endforeach()
