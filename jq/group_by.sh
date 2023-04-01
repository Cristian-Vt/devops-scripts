#!/bin/bash

people='[
  {"name": "Alice", "age": 25, "city": "New York"},
  {"name": "Bob", "age": 30, "city": "San Francisco"},
  {"name": "Charlie", "age": 35, "city": "New York"},
  {"name": "Dave", "age": 40, "city": "Seattle"},
  {"name": "Eve", "age": 45, "city": "San Francisco"}
]'

echo $people | jq 'group_by(.city) | map({city: .[0].city, count: length})'
