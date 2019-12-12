tags: obj/main.exe
	find . -name "*.ad[bs]" > cscope.files
	cscope -bcqR
	gnat xref -vf -aI"C:\\Program\ Files\ \(x86\)\\Gnatpro\\19.2\\include" obj/*.ali > src/tags

obj/main.exe:
	gprbuild -p -g

clean:
	rm -rf obj/
