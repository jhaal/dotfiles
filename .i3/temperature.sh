#!/bin/bash

sensors | grep -o -P '(?<=Physical id 0:).*(?=\(h)'
