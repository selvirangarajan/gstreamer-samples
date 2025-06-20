# Name of output binary
TARGET = gstreamer-app

# Compiler and flags
CXX = g++
CXXFLAGS = -Wall -O2

#Use pkg-config to gstreamer compile and link flags
PKG_CONFIG = pkg-config
PKG_CFLAGS = $(shell $(PKG_CONFIG) --cflags gstreamer-1.0 gstreamer-app-1.0)
PKG_LIBS = $(shell $(PKG_CONFIG) --libs gstreamer-1.0 gstreamer-app-1.0)

#Source and object files
SRCS = main.cpp
OBJS = $(SRCS:.cpp=.o)

# Default rule
all: $(TARGET)
$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) $(OBJS) -o $@ $(PKG_LIBS) 

%.o: %.cpp
	$(CXX) $(CXXFLAGS) $(PKG_CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)
