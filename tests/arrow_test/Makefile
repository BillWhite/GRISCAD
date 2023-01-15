ASSEMBLIES=$(shell cat assemblies.txt)
DEP_DIR=.deps
STL_DIR=stl
SRC_DIR=src
DIRS=$(DEP_DIR) $(STL_DIR)
CLEANOBJS=$(DEP_DIR) $(STL_DIR)

OBJS=$(patsubst %, $(STL_DIR)/%.stl, $(ASSEMBLIES))
DEPS=$(patsubst %, $(DEP_DIR)/%.d, $(ASSEMBLIES))

target: $(DIRS) $(OBJS)

$(STL_DIR)/%.stl: $(SRC_DIR)/%.scad | $(DIRS)
	openscad -o $@ $< -d $(DEP_DIR)/$*.d

$(DIRS):
	mkdir $(DEP_DIR) $(STL_DIR)

clean:
	rm -rf $(CLEANOBJS)

-include $(DEPS)

########################################################################
#  This file is part of GRISCAD.
#
#  GRISCAD is free software: you can redistribute it and/or modify it under the terms
#  of the GNU General Public License as published by the Free Software Foundation,
#  either version 3 of the License, or (at your option) any later version. 
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
#  FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License along
#  with this program. If not, see <https://www.gnu.org/licenses/>.
#
########################################################################
