# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.15

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

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\JetBrains\CLion\bin\cmake\win\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\JetBrains\CLion\bin\cmake\win\bin\cmake.exe" -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\Users\vyral\school\ZP1\lesson06

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\Users\vyral\school\ZP1\lesson06\cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/lesson06.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/lesson06.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/lesson06.dir/flags.make

CMakeFiles/lesson06.dir/main.c.obj: CMakeFiles/lesson06.dir/flags.make
CMakeFiles/lesson06.dir/main.c.obj: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\vyral\school\ZP1\lesson06\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/lesson06.dir/main.c.obj"
	C:\PROGRA~1\MINGW-~1\X86_64~1.0-W\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles\lesson06.dir\main.c.obj   -c C:\Users\vyral\school\ZP1\lesson06\main.c

CMakeFiles/lesson06.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lesson06.dir/main.c.i"
	C:\PROGRA~1\MINGW-~1\X86_64~1.0-W\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E C:\Users\vyral\school\ZP1\lesson06\main.c > CMakeFiles\lesson06.dir\main.c.i

CMakeFiles/lesson06.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lesson06.dir/main.c.s"
	C:\PROGRA~1\MINGW-~1\X86_64~1.0-W\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S C:\Users\vyral\school\ZP1\lesson06\main.c -o CMakeFiles\lesson06.dir\main.c.s

# Object files for target lesson06
lesson06_OBJECTS = \
"CMakeFiles/lesson06.dir/main.c.obj"

# External object files for target lesson06
lesson06_EXTERNAL_OBJECTS =

lesson06.exe: CMakeFiles/lesson06.dir/main.c.obj
lesson06.exe: CMakeFiles/lesson06.dir/build.make
lesson06.exe: CMakeFiles/lesson06.dir/linklibs.rsp
lesson06.exe: CMakeFiles/lesson06.dir/objects1.rsp
lesson06.exe: CMakeFiles/lesson06.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:\Users\vyral\school\ZP1\lesson06\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable lesson06.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\lesson06.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/lesson06.dir/build: lesson06.exe

.PHONY : CMakeFiles/lesson06.dir/build

CMakeFiles/lesson06.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\lesson06.dir\cmake_clean.cmake
.PHONY : CMakeFiles/lesson06.dir/clean

CMakeFiles/lesson06.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\Users\vyral\school\ZP1\lesson06 C:\Users\vyral\school\ZP1\lesson06 C:\Users\vyral\school\ZP1\lesson06\cmake-build-debug C:\Users\vyral\school\ZP1\lesson06\cmake-build-debug C:\Users\vyral\school\ZP1\lesson06\cmake-build-debug\CMakeFiles\lesson06.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/lesson06.dir/depend
