-- premake5.lua
workspace "golua"
   configurations { "Debug", "Release" }
   location "./build"

project "cjson"
   kind "StaticLib"
   language "C"
   targetdir "lib/"
   sysincludedirs { "/usr/local/include/luajit-2.0" }

   files { "**.h", "**.c" }

   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"