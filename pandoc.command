#!/bin/bash

cd `dirname "$0"`

pandoc --defaults pdfoutput.yaml
