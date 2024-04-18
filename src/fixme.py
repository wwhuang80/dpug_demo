#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import argparse
from collections import Counter

def process(doc,
            word_tokenize = False
            ):
    """Process a document."""
    doc = doc.lower()
    if word_tokenize: doc = doc.split()

    return doc

def main(args):
    """Open a text file from the command line and count its contents. 

    Optional: tokenize the file into words before counting.
    """
    with open(args.path, "r") as fin:
        doc = fin.read()

    doc = process(doc, args.word_tokenize)
    counts = Counter(doc)
    print(counts)

    highest_count = counts.most_common(1)

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--path", type=str, help="Path to a file")
    parser.add_argument("--word_tokenize", action="store_true",
                        help="Whether to tokenize")
    args = parser.parse_args()
    main(args)
