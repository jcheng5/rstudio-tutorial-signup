#!/bin/bash

for i in {1000..1999}; do
  deluser --remove-home guest$i
done
