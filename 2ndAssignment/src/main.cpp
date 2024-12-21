#include <stdio.h>
#include "Parser.H"
#include "Absyn.H"
#include "SymbolTable.h"
#include "TypeChecker.h"
#include "Printer.H"
#include "debug.c"


void process(FILE* input) {
	Program *parse_tree = pProgram(input);

	if (DEBUG) {
		ShowAbsyn showAbsyn;
		char* show_parse_tree = showAbsyn.show(parse_tree);
		printf("Abtract Syntax Tree:\n\n");
		printf("%s\n\n", show_parse_tree);

		PrintAbsyn PrintAbsyn;
		char* print_parse_tree = PrintAbsyn.print(parse_tree);
		printf("Parsed Code:\n\n");
		printf("%s\n", print_parse_tree);
	}

	if (parse_tree) {
		TypeChecker* typeChecker = new TypeChecker();
		try {
			if (DEBUG) printf("Type Checking Logs: \n\n");

			parse_tree->accept(typeChecker);

			if (DEBUG) {
				printf("\nSymbol Table:\n\n");
				typeChecker->symbolTable.printFuncDefs();
				typeChecker->symbolTable.printVarDecls(true);
				typeChecker->symbolTable.printStructDefs();
				printf("\n");
			}
			printf("OK\n");
			exit(0);
		} catch (const string& str) {
			printf("TYPE ERROR\n");
			printf("%s\n", str.c_str());
			exit(1);
		} catch (const char* str) {
			printf("TYPE ERROR\n");
			printf("%s\n", str);
			exit(1);
		}
	} else {
		printf("SYNTAX ERROR\n");
		exit(1);
	}
}

int main(int argc, char ** argv) {
	FILE *input;
	char *filename = NULL;

	if (argc > 1)
		filename = argv[1];
	else
		input = stdin;

	if (filename) {
		input = fopen(filename, "r");
		if (!input) {
			printf("Cannot open the input file");
			exit(1);
		}
	} else
		input = stdin;
	process(input);
	return 0;
}

