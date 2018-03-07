CC = g++
CFLAGS = -O3
HDRS = treeminer.h timetrack.h calcdb.h eqclass.h stats.h hashtree.h
OBJS = calcdb.o eqclass.o stats.o hashtree.o treeminer.o

LIBS = 
TARGET = htreeminer

default: $(TARGET)

clean:
	rm -rf *~ *.o $(TARGET)

htreeminer: $(OBJS) $(HDRS)
	$(CC) $(CFLAGS) -o htreeminer $(OBJS) $(LIBS)
	strip htreeminer

.SUFFIXES: .o .cpp

.cpp.o:
	$(CC) $(CFLAGS) -c $<


# dependencies
# $(OBJS): $(HFILES)
calcdb.o: calcdb.h treeminer.h
hashtree.o: hashtree.h treeminer.h eqclass.h
eqclass.o: eqclass.h treeminer.h
stats.o: stats.h
treeminer.o: treeminer.h calcdb.h stats.h
