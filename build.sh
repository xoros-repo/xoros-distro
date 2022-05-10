#!/bin/sh

echo "---- System information ----------------"
echo "--- Storage ----------------------------"
df -h

echo "--- Memory -----------------------------"
free

echo "--- Processor --------------------------"
lscpu

echo "----------------------------------------"

echo "Starting build"

