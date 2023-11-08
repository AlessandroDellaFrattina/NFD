project "NFD"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "On"
	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	includedirs "%{wks.location}/Vulture/vendor/NFD/src/include"
	files "src/**.h"

	filter "system:windows"
		systemversion "latest"
		defines "_CRT_SECURE_NO_WARNINGS"
		files "src/nfd_win.cpp"

	filter "system:linux"
		files "src/nfd_portal.cpp"

	filter "system:macosx"
		files "src/nfd_cocoa.m"

	filter "configurations:Debug"
		defines "VE_DEBUG"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		defines "VE_RELEASE"
		runtime "Release"
		symbols "On"
		optimize "On"

	filter "configurations:Dist"
		defines "VE_DIST"
		runtime "Release"
		optimize "On"
