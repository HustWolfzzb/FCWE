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
CMAKE_SOURCE_DIR = /Users/zhangzhaobo/CLionProjects/jwe

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/zhangzhaobo/CLionProjects/jwe/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/jwe.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/jwe.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/jwe.dir/flags.make

CMakeFiles/jwe.dir/src/jwe.c.o: CMakeFiles/jwe.dir/flags.make
CMakeFiles/jwe.dir/src/jwe.c.o: ../src/jwe.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/zhangzhaobo/CLionProjects/jwe/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/jwe.dir/src/jwe.c.o"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/jwe.dir/src/jwe.c.o   -c /Users/zhangzhaobo/CLionProjects/jwe/src/jwe.c

CMakeFiles/jwe.dir/src/jwe.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/jwe.dir/src/jwe.c.i"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/zhangzhaobo/CLionProjects/jwe/src/jwe.c > CMakeFiles/jwe.dir/src/jwe.c.i

CMakeFiles/jwe.dir/src/jwe.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/jwe.dir/src/jwe.c.s"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/zhangzhaobo/CLionProjects/jwe/src/jwe.c -o CMakeFiles/jwe.dir/src/jwe.c.s

# Object files for target jwe
jwe_OBJECTS = \
"CMakeFiles/jwe.dir/src/jwe.c.o"

# External object files for target jwe
jwe_EXTERNAL_OBJECTS =

jwe: CMakeFiles/jwe.dir/src/jwe.c.o
jwe: CMakeFiles/jwe.dir/build.make
jwe: CMakeFiles/jwe.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/zhangzhaobo/CLionProjects/jwe/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable jwe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/jwe.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/jwe.dir/build: jwe

.PHONY : CMakeFiles/jwe.dir/build

CMakeFiles/jwe.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/jwe.dir/cmake_clean.cmake
.PHONY : CMakeFiles/jwe.dir/clean

CMakeFiles/jwe.dir/depend:
	cd /Users/zhangzhaobo/CLionProjects/jwe/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/zhangzhaobo/CLionProjects/jwe /Users/zhangzhaobo/CLionProjects/jwe /Users/zhangzhaobo/CLionProjects/jwe/cmake-build-debug /Users/zhangzhaobo/CLionProjects/jwe/cmake-build-debug /Users/zhangzhaobo/CLionProjects/jwe/cmake-build-debug/CMakeFiles/jwe.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/jwe.dir/depend

