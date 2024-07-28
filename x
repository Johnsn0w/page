#!/bin/bash

echo repo contents:
curl -s https://api.github.com/repos/Johnsn0w/page/contents | grep '"name"' | cut -d '"' -f 4
