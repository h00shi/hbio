set(converter ${CMAKE_ARGV3})
set(input_file ${CMAKE_ARGV4})
set(expected_output_file ${CMAKE_ARGV5})

set(output_file "${CMAKE_BINARY_DIR}/tmp.mtx")

execute_process(
  COMMAND ${converter} ${input_file}
  OUTPUT_FILE ${output_file}
  RESULT_VARIABLE ierr
  )
if(ierr)
  message(FATAL_ERROR "File conversion not successful.")
endif()

execute_process(
  COMMAND ${CMAKE_COMMAND} -E compare_files ${output_file} ${expected_output_file}
  RESULT_VARIABLE ierr
  )
if(ierr)
  message(FATAL_ERROR "Unexpected output.")
endif()
