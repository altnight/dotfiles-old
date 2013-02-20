# coding: utf-8

import os

UPDATE_COMMAND = "brew update"
INSTALL_COMMAND = "brew install"
DOCTOR_COMMAND = "brew doctor"

package = []

with open("brewlist", "r") as f:
    lines = f.readlines()
    for line in lines:
        if line.startswith("#"):
            pass
        elif line.startswith("\n"):
            pass
        else:
            package.append(line.rstrip())
package = " ".join(package)

with open("initialize_homebrew.sh", "w") as f:
    f.write("#!/bin/sh\n")
    f.write("echo initialize start\n")
    f.write("echo brew update start\n")
    f.write(UPDATE_COMMAND)
    f.write("\n")
    f.write("echo brew update end\n")
    f.write("echo brew install start\n")
    f.write(INSTALL_COMMAND + " " + package)
    f.write("\n")
    f.write("echo brew install end\n")
    f.write("echo brew doctor start\n")
    f.write(DOCTOR_COMMAND)
    f.write("\n")
    f.write("echo brew doctor end\n")
    f.write("echo initialize end\n")

os.chmod("./initialize_homebrew.sh", 0755)
