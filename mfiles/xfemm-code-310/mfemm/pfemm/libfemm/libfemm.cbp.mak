#------------------------------------------------------------------------------#
# This makefile was generated by 'cbp2make' tool rev.147                       #
#------------------------------------------------------------------------------#


WRKDIR = $(CURDIR)

CC = gcc
CXX = g++
AR = ar
LD = g++
WINDRES = windres

INC =
CFLAGS = -Wall -fPIC -fexceptions
RESINC =
LIBDIR =
LIB =
LDFLAGS =

INC_DEBUG = $(INC)
CFLAGS_DEBUG = $(CFLAGS) -g
RESINC_DEBUG = $(RESINC)
RCFLAGS_DEBUG = $(RCFLAGS)
LIBDIR_DEBUG = $(LIBDIR)
LIB_DEBUG = $(LIB)
LDFLAGS_DEBUG = $(LDFLAGS)
OBJDIR_DEBUG = $(WRKDIR)/obj/Release
DEP_DEBUG =
OUT_DEBUG = $(WRKDIR)/libfemm.a

INC_RELEASE = $(INC)
CFLAGS_RELEASE = $(CFLAGS) -O2
RESINC_RELEASE = $(RESINC)
RCFLAGS_RELEASE = $(RCFLAGS)
LIBDIR_RELEASE = $(LIBDIR)
LIB_RELEASE = $(LIB)
LDFLAGS_RELEASE = $(LDFLAGS) -s
OBJDIR_RELEASE = $(WRKDIR)/obj/Release
DEP_RELEASE =
OUT_RELEASE = $(WRKDIR)/libfemm.a

OBJ_DEBUG = $(OBJDIR_DEBUG)/complex.o $(OBJDIR_DEBUG)/fparse.o $(OBJDIR_DEBUG)/fullmatrix.o $(OBJDIR_DEBUG)/matprop.o $(OBJDIR_DEBUG)/spars.o $(OBJDIR_DEBUG)/cspars.o

OBJ_RELEASE = $(OBJDIR_RELEASE)/complex.o $(OBJDIR_RELEASE)/fparse.o $(OBJDIR_RELEASE)/fullmatrix.o $(OBJDIR_RELEASE)/matprop.o $(OBJDIR_RELEASE)/spars.o $(OBJDIR_DEBUG)/cspars.o

all: release

clean: clean_debug clean_release

before_debug:
	test -d $(OBJDIR_DEBUG) || mkdir -p $(OBJDIR_DEBUG)

after_debug:

debug: before_debug out_debug after_debug

out_debug: before_debug $(OBJ_DEBUG) $(DEP_DEBUG)
	$(AR) rcs $(OUT_DEBUG) $(OBJ_DEBUG)

$(OBJDIR_DEBUG)/complex.o: complex.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c complex.cpp -o $(OBJDIR_DEBUG)/complex.o

$(OBJDIR_DEBUG)/fparse.o: fparse.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c fparse.cpp -o $(OBJDIR_DEBUG)/fparse.o

$(OBJDIR_DEBUG)/fullmatrix.o: fullmatrix.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c fullmatrix.cpp -o $(OBJDIR_DEBUG)/fullmatrix.o

$(OBJDIR_DEBUG)/matprop.o: matprop.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c matprop.cpp -o $(OBJDIR_DEBUG)/matprop.o

$(OBJDIR_DEBUG)/spars.o: spars.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c spars.cpp -o $(OBJDIR_DEBUG)/spars.o

$(OBJDIR_DEBUG)/cspars.o: cspars.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c cspars.cpp -o $(OBJDIR_DEBUG)/cspars.o

clean_debug:
	rm -f $(OBJ_DEBUG) $(OUT_DEBUG)
	rm -rf $(OBJDIR_DEBUG)

before_release:
	echo $(WRKDIR)
	test -d $(OBJDIR_RELEASE) || mkdir -p $(OBJDIR_RELEASE)

after_release:

release: before_release out_release after_release

out_release: before_release $(OBJ_RELEASE) $(DEP_RELEASE)
	$(AR) rcs $(OUT_RELEASE) $(OBJ_RELEASE)

$(OBJDIR_RELEASE)/complex.o: complex.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c complex.cpp -o $(OBJDIR_RELEASE)/complex.o

$(OBJDIR_RELEASE)/fparse.o: fparse.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c fparse.cpp -o $(OBJDIR_RELEASE)/fparse.o

$(OBJDIR_RELEASE)/fullmatrix.o: fullmatrix.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c fullmatrix.cpp -o $(OBJDIR_RELEASE)/fullmatrix.o

$(OBJDIR_RELEASE)/matprop.o: matprop.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c matprop.cpp -o $(OBJDIR_RELEASE)/matprop.o

$(OBJDIR_RELEASE)/spars.o: spars.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c spars.cpp -o $(OBJDIR_RELEASE)/spars.o

$(OBJDIR_RELEASE)/cspars.o: cspars.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c cspars.cpp -o $(OBJDIR_RELEASE)/cspars.o

clean_release:
	rm -f $(OBJ_RELEASE) $(OUT_RELEASE)
	rm -rf $(OBJDIR_RELEASE)

.PHONY: before_debug after_debug clean_debug before_release after_release clean_release

