# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.28

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /snap/cmake/1361/bin/cmake

# The command to remove a file.
RM = /snap/cmake/1361/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/michael/Workspace/3DProjFinal/OpenGL-Template/src/Main

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/michael/Workspace/3DProjFinal/OpenGL-Template/bin

# Include any dependencies generated for this target.
include external/glfw-3.1.2/examples/CMakeFiles/wave.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include external/glfw-3.1.2/examples/CMakeFiles/wave.dir/compiler_depend.make

# Include the progress variables for this target.
include external/glfw-3.1.2/examples/CMakeFiles/wave.dir/progress.make

# Include the compile flags for this target's objects.
include external/glfw-3.1.2/examples/CMakeFiles/wave.dir/flags.make

external/glfw-3.1.2/examples/CMakeFiles/wave.dir/wave.c.o: external/glfw-3.1.2/examples/CMakeFiles/wave.dir/flags.make
external/glfw-3.1.2/examples/CMakeFiles/wave.dir/wave.c.o: /home/michael/Workspace/3DProjFinal/OpenGL-Template/src/Main/external/glfw-3.1.2/examples/wave.c
external/glfw-3.1.2/examples/CMakeFiles/wave.dir/wave.c.o: external/glfw-3.1.2/examples/CMakeFiles/wave.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/michael/Workspace/3DProjFinal/OpenGL-Template/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object external/glfw-3.1.2/examples/CMakeFiles/wave.dir/wave.c.o"
	cd /home/michael/Workspace/3DProjFinal/OpenGL-Template/bin/external/glfw-3.1.2/examples && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT external/glfw-3.1.2/examples/CMakeFiles/wave.dir/wave.c.o -MF CMakeFiles/wave.dir/wave.c.o.d -o CMakeFiles/wave.dir/wave.c.o -c /home/michael/Workspace/3DProjFinal/OpenGL-Template/src/Main/external/glfw-3.1.2/examples/wave.c

external/glfw-3.1.2/examples/CMakeFiles/wave.dir/wave.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/wave.dir/wave.c.i"
	cd /home/michael/Workspace/3DProjFinal/OpenGL-Template/bin/external/glfw-3.1.2/examples && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/michael/Workspace/3DProjFinal/OpenGL-Template/src/Main/external/glfw-3.1.2/examples/wave.c > CMakeFiles/wave.dir/wave.c.i

external/glfw-3.1.2/examples/CMakeFiles/wave.dir/wave.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/wave.dir/wave.c.s"
	cd /home/michael/Workspace/3DProjFinal/OpenGL-Template/bin/external/glfw-3.1.2/examples && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/michael/Workspace/3DProjFinal/OpenGL-Template/src/Main/external/glfw-3.1.2/examples/wave.c -o CMakeFiles/wave.dir/wave.c.s

# Object files for target wave
wave_OBJECTS = \
"CMakeFiles/wave.dir/wave.c.o"

# External object files for target wave
wave_EXTERNAL_OBJECTS =

external/glfw-3.1.2/examples/wave: external/glfw-3.1.2/examples/CMakeFiles/wave.dir/wave.c.o
external/glfw-3.1.2/examples/wave: external/glfw-3.1.2/examples/CMakeFiles/wave.dir/build.make
external/glfw-3.1.2/examples/wave: external/glfw-3.1.2/src/libglfw3.a
external/glfw-3.1.2/examples/wave: /usr/lib/x86_64-linux-gnu/librt.a
external/glfw-3.1.2/examples/wave: /usr/lib/x86_64-linux-gnu/libm.so
external/glfw-3.1.2/examples/wave: /usr/lib/x86_64-linux-gnu/libX11.so
external/glfw-3.1.2/examples/wave: /usr/lib/x86_64-linux-gnu/libXrandr.so
external/glfw-3.1.2/examples/wave: /usr/lib/x86_64-linux-gnu/libXinerama.so
external/glfw-3.1.2/examples/wave: /usr/lib/x86_64-linux-gnu/libXi.so
external/glfw-3.1.2/examples/wave: /usr/lib/x86_64-linux-gnu/libXxf86vm.so
external/glfw-3.1.2/examples/wave: /usr/lib/x86_64-linux-gnu/libXcursor.so
external/glfw-3.1.2/examples/wave: /usr/lib/x86_64-linux-gnu/libGL.so
external/glfw-3.1.2/examples/wave: external/glfw-3.1.2/examples/CMakeFiles/wave.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/michael/Workspace/3DProjFinal/OpenGL-Template/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable wave"
	cd /home/michael/Workspace/3DProjFinal/OpenGL-Template/bin/external/glfw-3.1.2/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/wave.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
external/glfw-3.1.2/examples/CMakeFiles/wave.dir/build: external/glfw-3.1.2/examples/wave
.PHONY : external/glfw-3.1.2/examples/CMakeFiles/wave.dir/build

external/glfw-3.1.2/examples/CMakeFiles/wave.dir/clean:
	cd /home/michael/Workspace/3DProjFinal/OpenGL-Template/bin/external/glfw-3.1.2/examples && $(CMAKE_COMMAND) -P CMakeFiles/wave.dir/cmake_clean.cmake
.PHONY : external/glfw-3.1.2/examples/CMakeFiles/wave.dir/clean

external/glfw-3.1.2/examples/CMakeFiles/wave.dir/depend:
	cd /home/michael/Workspace/3DProjFinal/OpenGL-Template/bin && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/michael/Workspace/3DProjFinal/OpenGL-Template/src/Main /home/michael/Workspace/3DProjFinal/OpenGL-Template/src/Main/external/glfw-3.1.2/examples /home/michael/Workspace/3DProjFinal/OpenGL-Template/bin /home/michael/Workspace/3DProjFinal/OpenGL-Template/bin/external/glfw-3.1.2/examples /home/michael/Workspace/3DProjFinal/OpenGL-Template/bin/external/glfw-3.1.2/examples/CMakeFiles/wave.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : external/glfw-3.1.2/examples/CMakeFiles/wave.dir/depend

