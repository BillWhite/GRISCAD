All the tests are manual, and are in subfolders of this folder. 

1. The assemblies are listed in the files named assemblies.txt. 
   The Makefile knows to look there and get the definitions. Each
   of these should have exactly one assembly.
1. The OpenSCAD files are in the src directory. Not all these
   are named in the assemblies.txt file.
1. Run make to make stl files from the OpenSCAD files. The
   resulting .stl files will be stored in the directory stl.

These are the tests. They are all manual, so you will have to
think a little to see if they pass.
1. assembly_test/
   Test assemblies. You should be able to slice open the towers.
   The stl files should not be sliced.
1. arrow_test/
   Test the arrow module. You should be able to see arrows placed
   at various places with various directions.

