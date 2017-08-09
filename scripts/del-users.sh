#!/bin/bash

PREFIX=workshop

for i in {1000..1999}; do
  deluser --remove-home $PREFIX$i
done
