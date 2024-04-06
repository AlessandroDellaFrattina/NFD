project "NFD"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime (sruntime)
	targetdir (bin)
	objdir (binint)

	includedirs {

		"src/include"
	}

	files {

		"src/**.h"
	}

	filter "system:windows"
		systemversion "latest"
		defines "_CRT_SECURE_NO_WARNINGS"
		files "src/nfd_win.cpp"

	filter "system:linux"

		includedirs {

			"/usr/include/dbus-1.0/",
			"/usr/lib64/dbus-1.0/include/",
			"/usr/include/glib-2.0/",
			"/usr/lib64/glib-2.0/include/",
			"/usr/lib/x86_64-linux-gnu/dbus-1.0/include/"
		}

		files "src/nfd_portal.cpp"

	filter "system:macosx"
		files "src/nfd_cocoa.m"

	filter "configurations:Debug"
		runtime (debugruntime)
		symbols (debugsymbols)
		optimize (debugoptimize)

	filter "configurations:Release"
		runtime (releaseruntime)
		symbols (releasesymbols)
		optimize (releaseoptimize)

	filter "configurations:Dist"
		runtime (distruntime)
		symbols (distsymbols)
		optimize (distoptimize)
