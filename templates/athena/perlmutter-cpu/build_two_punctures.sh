make \
	CC=cc \
	LFLAGS=`gsl-config --libs` \
	CFLAGS="`gsl-config --cflags` -fPIC -O3 -g"
