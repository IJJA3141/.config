#!/bin/sh

echo "(pkg :maj $(checkupdates | wc -l))"
