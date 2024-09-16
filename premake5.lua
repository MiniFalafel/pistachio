-- IMPORTS
require "vscode"

-- Workspace
workspace "PISTACHIO"
	architecture "x86_64"
	
	configurations { "DEBUG", "RELEASE" }

-- BIN DIRECTORIES
outdir = "%{cfg.buildcfg}-%{cfg.architecture}/"

-- Project
project "PISTACHIO"
	language "C++"
	cppdialect "C++20"
	kind "ConsoleApp"
	
	targetdir ("%{prj.location}/bin" .. outdir .. "%{prj.name}")
	objdir ("%{prj.location}/bin/int" .. outdir .. "%{prj.name}")
	
	files
	{
		"src/**.h",
		"src/**.cpp"
	}
	
	includedirs
	{
		"%{prj.location}/src/"
	}
	
	filter "configurations:DEBUG"
		toolset "gcc"
		system "linux"
		symbols "on"
		runtime "debug"
		defines {"DEBUG"}
	
	filter "configurations:RELEASE"
		toolset "gcc"
		system "linux"
		optimize "on"
		runtime "release"
		defines {"RELEASE"}
