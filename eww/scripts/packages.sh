#!/bin/sh

echo "(package :count '$(checkupdates | wc -l)')"
