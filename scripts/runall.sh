#!/bin/bash
 for I in $(ls new*); do echo echo \.\/run\.sh $I \\\>\\\& \\\/dev\\\/null \| at now; done
