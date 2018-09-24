ageindays.exe: src/*
	gnatmake src/*

regenerate_tests: src/*
	gnattest -Pageindays.gpr --harness-dir=../testharness --tests-dir=../tests

test: tests/*
	gprbuild -Ptestharness/test_driver
	./testharness/test_runner

tags: ageindays.exe
	find . -name "*.ad[bs]" > cscope.files
	cscope -bcqR
	gnat xref -vf -aOobj *.ali | sed 's/C:\//..\/..\/..\//' | sed 's/\t\([^\/]*\.ad[bs]\)/\tsrc\/\1/' > tags

clean:
	rm -f *.o *.ali *.exe
