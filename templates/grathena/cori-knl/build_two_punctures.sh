make \
	CC=icc \
	LFLAGS=-L${GSL_DIR}/lib \
	CFLAGS="-I${GSL_DIR}/include -fPIC -O3 -g"
