##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=SpaceInvaders
ConfigurationName      :=Debug
WorkspacePath          :=/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar
ProjectPath            :=/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=Marcus Pettersson
Date                   :=08/12/2016
CodeLitePath           :="/Users/marcuspettersson/Library/Application Support/codelite"
LinkerName             :=/Applications/gcc-arm/bin/arm-none-eabi-g++
SharedObjectLinkerName :=/Applications/gcc-arm/bin/arm-none-eabi-g++ -shared -fPIC
ObjectSuffix           :=.o
DependSuffix           :=.o.d
PreprocessSuffix       :=.i
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
SourceSwitch           :=-c 
OutputFile             :=$(IntermediateDirectory)/$(ProjectName).elf
Preprocessors          :=
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="SpaceInvaders.txt"
PCHCompileFlags        :=
MakeDirCommand         :=mkdir -p
LinkOptions            :=  -nostartfiles -nostdlib -T$(ProjectPath)/md407-ram.x
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). 
IncludePCH             := 
RcIncludePath          := 
Libs                   := $(LibrarySwitch)gcc $(LibrarySwitch)c_nano 
ArLibs                 :=  "gcc" "c_nano" 
LibPath                := $(LibraryPathSwitch). $(LibraryPathSwitch)/Applications/gcc-arm/arm-none-eabi/lib/armv6-m $(LibraryPathSwitch)/Applications/gcc-arm/lib/gcc/arm-none-eabi/5.4.1/armv6-m 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := /Applications/gcc-arm/bin/arm-none-eabi-ar rcu
CXX      := /Applications/gcc-arm/bin/arm-none-eabi-g++
CC       := /Applications/gcc-arm/bin/arm-none-eabi-gcc
CXXFLAGS :=  -g -O0 -Wall $(Preprocessors)
CFLAGS   :=  -g -O0 -mthumb -Wall -march=armv6-m -msoft-float -Wa,-adhln=test.s $(Preprocessors)
ASFLAGS  := 
AS       := /Applications/gcc-arm/bin/arm-none-eabi-as


##
## User defined environment variables
##
CodeLiteDir:=/Applications/codelite.app/Contents/SharedSupport/
Objects0=$(IntermediateDirectory)/startup.c$(ObjectSuffix) $(IntermediateDirectory)/delays.c$(ObjectSuffix) $(IntermediateDirectory)/graphic_display_controller_interface.c$(ObjectSuffix) $(IntermediateDirectory)/unit_controller.c$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild MakeIntermediateDirs
all: $(OutputFile)

$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	$(LinkerName) $(OutputSwitch)$(OutputFile) @$(ObjectsFileList) $(LibPath) $(Libs) $(LinkOptions)

PostBuild:
	@echo Executing Post Build commands ...
	arm-none-eabi-objcopy -S -O srec  ./Debug/SpaceInvaders.elf ./Debug/SpaceInvaders.s19
	@echo Done

MakeIntermediateDirs:
	@test -d ./Debug || $(MakeDirCommand) ./Debug


$(IntermediateDirectory)/.d:
	@test -d ./Debug || $(MakeDirCommand) ./Debug

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/startup.c$(ObjectSuffix): startup.c $(IntermediateDirectory)/startup.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/startup.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/startup.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/startup.c$(DependSuffix): startup.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/startup.c$(ObjectSuffix) -MF$(IntermediateDirectory)/startup.c$(DependSuffix) -MM startup.c

$(IntermediateDirectory)/startup.c$(PreprocessSuffix): startup.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/startup.c$(PreprocessSuffix)startup.c

$(IntermediateDirectory)/delays.c$(ObjectSuffix): delays.c $(IntermediateDirectory)/delays.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/delays.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/delays.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/delays.c$(DependSuffix): delays.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/delays.c$(ObjectSuffix) -MF$(IntermediateDirectory)/delays.c$(DependSuffix) -MM delays.c

$(IntermediateDirectory)/delays.c$(PreprocessSuffix): delays.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/delays.c$(PreprocessSuffix)delays.c

$(IntermediateDirectory)/graphic_display_controller_interface.c$(ObjectSuffix): graphic_display_controller_interface.c $(IntermediateDirectory)/graphic_display_controller_interface.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/graphic_display_controller_interface.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/graphic_display_controller_interface.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/graphic_display_controller_interface.c$(DependSuffix): graphic_display_controller_interface.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/graphic_display_controller_interface.c$(ObjectSuffix) -MF$(IntermediateDirectory)/graphic_display_controller_interface.c$(DependSuffix) -MM graphic_display_controller_interface.c

$(IntermediateDirectory)/graphic_display_controller_interface.c$(PreprocessSuffix): graphic_display_controller_interface.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/graphic_display_controller_interface.c$(PreprocessSuffix)graphic_display_controller_interface.c

$(IntermediateDirectory)/unit_controller.c$(ObjectSuffix): unit_controller.c $(IntermediateDirectory)/unit_controller.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/marcuspettersson/Documents/CLWorkspace/Maskinlabbar/SpaceInvaders/unit_controller.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/unit_controller.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/unit_controller.c$(DependSuffix): unit_controller.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/unit_controller.c$(ObjectSuffix) -MF$(IntermediateDirectory)/unit_controller.c$(DependSuffix) -MM unit_controller.c

$(IntermediateDirectory)/unit_controller.c$(PreprocessSuffix): unit_controller.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/unit_controller.c$(PreprocessSuffix)unit_controller.c


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


