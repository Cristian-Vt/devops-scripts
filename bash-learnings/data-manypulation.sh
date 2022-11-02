#!/bin/bash

#remove duplicates
awk 'seen[$0]++' filename