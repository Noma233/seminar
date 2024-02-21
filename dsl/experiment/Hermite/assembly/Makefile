.PHONY:all

all: pikg.out pyker.out

pikg.out: pikg_check.cpp
	g++ -I ~/school/seminar_origin/PIKG/inc -O3 -mfma -mavx2 -S pikg_check.cpp

pyker.out: pyker_check.cpp
	g++ -O3 -mfma -mavx2 -S pyker_check.cpp