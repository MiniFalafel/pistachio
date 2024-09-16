-- IMPORTS
require "vscode"

-- Workspace
workspace "PISTACHIO"
	architecture "x86_64"
	
	configurations { "DEBUG", "RELEASE" }

-- BIN DIRECTORIES
outdir = "%{cfg.buildcfg}-%{cfg.architecture}/"

-- Project files
include "pistachio/pistachio"
