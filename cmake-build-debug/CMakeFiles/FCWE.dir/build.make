# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/zhangzhaobo/CLionProjects/FCWE

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/zhangzhaobo/CLionProjects/FCWE/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/FCWE.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/FCWE.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/FCWE.dir/flags.make

CMakeFiles/FCWE.dir/src/FCWE.c.o: CMakeFiles/FCWE.dir/flags.make
CMakeFiles/FCWE.dir/src/FCWE.c.o: ../src/FCWE.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/zhangzhaobo/CLionProjects/FCWE/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/FCWE.dir/src/FCWE.c.o"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/FCWE.dir/src/FCWE.c.o   -c /Users/zhangzhaobo/CLionProjects/FCWE/src/FCWE.c

CMakeFiles/FCWE.dir/src/FCWE.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/FCWE.dir/src/FCWE.c.i"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/zhangzhaobo/CLionProjects/FCWE/src/FCWE.c > CMakeFiles/FCWE.dir/src/FCWE.c.i

CMakeFiles/FCWE.dir/src/FCWE.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/FCWE.dir/src/FCWE.c.s"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/zhangzhaobo/CLionProjects/FCWE/src/FCWE.c -o CMakeFiles/FCWE.dir/src/FCWE.c.s

# Object files for target FCWE
FCWE_OBJECTS = \
"CMakeFiles/FCWE.dir/src/FCWE.c.o"

# External object files for target FCWE
FCWE_EXTERNAL_OBJECTS =

FCWE: CMakeFiles/FCWE.dir/src/FCWE.c.o
FCWE: CMakeFiles/FCWE.dir/build.make
FCWE: CMakeFiles/FCWE.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/zhangzhaobo/CLionProjects/FCWE/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable FCWE"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/FCWE.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/FCWE.dir/build: FCWE

.PHONY : CMakeFiles/FCWE.dir/build

CMakeFiles/FCWE.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/FCWE.dir/cmake_clean.cmake
.PHONY : CMakeFiles/FCWE.dir/clean

CMakeFiles/FCWE.dir/depend:
	cd /Users/zhangzhaobo/CLionProjects/FCWE/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/zhangzhaobo/CLionProjects/FCWE /Users/zhangzhaobo/CLionProjects/FCWE /Users/zhangzhaobo/CLionProjects/FCWE/cmake-build-debug /Users/zhangzhaobo/CLionProjects/FCWE/cmake-build-debug /Users/zhangzhaobo/CLionProjects/FCWE/cmake-build-debug/CMakeFiles/FCWE.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/FCWE.dir/depend
