#include "Absyn.H"
#include "Parser.H"
#include <cstdint>
#include <stdio.h>
#include "llvm/Support/raw_ostream.h"
#include "CodeGen.H"

int process(FILE *input) {
  Program *parse_tree = pProgram(input);

  CodeGen codeGen;

  parse_tree->accept(&codeGen);
  codeGen.dumpLLVMIR();
  return 0;
}

int main(int argc, char **argv) {
  FILE *input;
  char *filename = NULL;

  if (argc > 1) {
    filename = argv[1];
  } else {
    input = stdin;
  }

  if (filename) {
    input = fopen(filename, "r");
    if (!input) {
      printf("Cannot open the input file");
      exit(1);
    }
  } else {
    input = stdin;
  }
  process(input);
  return 0;
}
