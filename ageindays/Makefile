ageindays.exe: src/*
	gnatmake src/*

regenerate_tests: src/*
	gnattest -Pageindays.gpr --harness-dir=../testharness --tests-dir=../tests
	sed -i 's/for Origin_Project/--for Origin_Project/' testharness/test_driver.gpr

test: tests/*
	gprbuild -Ptestharness/test_driver
	./testharness/test_runner

tags: ageindays.exe
	find . -name "*.ad[bs]" > cscope.files
	cscope -bcqR
	gnat xref -vf -aOobj *.ali | sed 's/C:\//..\/..\/..\//' | sed 's/\t\([^\/]*\.ad[bs]\)/\tsrc\/\1/' > tags

clean:
	rm -f *.o *.ali *.exe
