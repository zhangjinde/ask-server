# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.0

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/joshuagame/Sviluppo/ClionProjects/ask-server

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/joshuagame/Sviluppo/ClionProjects/ask-server/build

# Include any dependencies generated for this target.
include CMakeFiles/ask_server.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/ask_server.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/ask_server.dir/flags.make

CMakeFiles/ask_server.dir/askd.c.o: CMakeFiles/ask_server.dir/flags.make
CMakeFiles/ask_server.dir/askd.c.o: ../askd.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/joshuagame/Sviluppo/ClionProjects/ask-server/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/ask_server.dir/askd.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/ask_server.dir/askd.c.o   -c /home/joshuagame/Sviluppo/ClionProjects/ask-server/askd.c

CMakeFiles/ask_server.dir/askd.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ask_server.dir/askd.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/joshuagame/Sviluppo/ClionProjects/ask-server/askd.c > CMakeFiles/ask_server.dir/askd.c.i

CMakeFiles/ask_server.dir/askd.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ask_server.dir/askd.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/joshuagame/Sviluppo/ClionProjects/ask-server/askd.c -o CMakeFiles/ask_server.dir/askd.c.s

CMakeFiles/ask_server.dir/askd.c.o.requires:
.PHONY : CMakeFiles/ask_server.dir/askd.c.o.requires

CMakeFiles/ask_server.dir/askd.c.o.provides: CMakeFiles/ask_server.dir/askd.c.o.requires
	$(MAKE) -f CMakeFiles/ask_server.dir/build.make CMakeFiles/ask_server.dir/askd.c.o.provides.build
.PHONY : CMakeFiles/ask_server.dir/askd.c.o.provides

CMakeFiles/ask_server.dir/askd.c.o.provides.build: CMakeFiles/ask_server.dir/askd.c.o

# Object files for target ask_server
ask_server_OBJECTS = \
"CMakeFiles/ask_server.dir/askd.c.o"

# External object files for target ask_server
ask_server_EXTERNAL_OBJECTS =

ask_server: CMakeFiles/ask_server.dir/askd.c.o
ask_server: CMakeFiles/ask_server.dir/build.make
ask_server: /usr/local/lib/libmicrohttpd.so
ask_server: /usr/lib/x86_64-linux-gnu/libconfig.so
ask_server: CMakeFiles/ask_server.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable ask_server"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ask_server.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/ask_server.dir/build: ask_server
.PHONY : CMakeFiles/ask_server.dir/build

CMakeFiles/ask_server.dir/requires: CMakeFiles/ask_server.dir/askd.c.o.requires
.PHONY : CMakeFiles/ask_server.dir/requires

CMakeFiles/ask_server.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ask_server.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ask_server.dir/clean

CMakeFiles/ask_server.dir/depend:
	cd /home/joshuagame/Sviluppo/ClionProjects/ask-server/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/joshuagame/Sviluppo/ClionProjects/ask-server /home/joshuagame/Sviluppo/ClionProjects/ask-server /home/joshuagame/Sviluppo/ClionProjects/ask-server/build /home/joshuagame/Sviluppo/ClionProjects/ask-server/build /home/joshuagame/Sviluppo/ClionProjects/ask-server/build/CMakeFiles/ask_server.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/ask_server.dir/depend

