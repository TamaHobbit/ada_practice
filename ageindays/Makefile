ageindays.exe: src/*
	gnatmake src/*

regenerate_tests: src/*
	gnattest -Pageindays.gpr --harness-dir=../testharness --tests-dir=../tests

test: tests/*
	gprbuild -Ptestharness/test_driver
	./testharness/test_runner

clean:
	rm -f *.o *.ali *.exe
