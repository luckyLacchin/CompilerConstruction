#include "SymbolTable.h"
#include "debug.c"


SymbolTable::SymbolTable() {
    funcDefs = unordered_map<string, FuncType>();
    structDefs = unordered_map<string, StructType>();
    scopeStack = stack<Scope>();
}

void SymbolTable::addVarDecl(const string id, const string type) {
    if (DEBUG) {
        printf("Adding variable declaration: %s %s\n", type.c_str(), id.c_str());
    }

    Scope& topScope = scopeStack.top();
    if (isVarIdDeclared(id)) {
        throw "variable declaration: variable " + id + " is already defined.";
    }
    else if (type == "void")
    {
        throw "variable declaration: variable " + id + " can't be of type void.";
    }
     else {
        topScope.varDecls[id] = type;
    }
}

void SymbolTable::addStructDef(const string id, const ArgList fields, const bool isException) {
    if (DEBUG) {
        printf("Adding struct definition: %s\n", id.c_str());
        for (const auto& field : fields) {
            printf("\t%s %s\n", field.first.c_str(), field.second.c_str());
        }
        printf("\tIs Exception: %s\n", isException ? "true" : "false");
    }

    for (const auto& field : fields) {
        if (strcmp(field.first.c_str(), "void") == 0) {
            throw "structure definition: struct " + id + " contains a field with type void.";
        }
    }

    if (isStructIdDeclared(id)) {
        throw "structure definition: struct " + id + " is already defined.";
    } else {
        structDefs[id] = StructType {fields, isException};
    }
}

void SymbolTable::addFuncDef(const string id, const ArgList args, const string returnType) {
    if (DEBUG) {
        printf("Adding function definition: %s\n", id.c_str());
        for (const auto& arg : args) {
            printf("\t%s %s\n", arg.first.c_str(), arg.second.c_str());
        }
        printf("\tReturn Type: %s\n", returnType.c_str());
    }

    if (isFuncIdDeclared(id)) {
        throw "function definition: function " + id + " is already defined.";
    }

    funcDefs[id] = FuncType {args, returnType};

    Scope& topScope = scopeStack.top();

    //add returnType to function scope
    topScope.isFuncScope = true;
    topScope.funcReturnType = returnType;
}

void SymbolTable::enterScope() {
    if (DEBUG) {
        printf("Entering scope. Currently %lu open scopes.\n", scopeStack.size());
    }

    scopeStack.push(Scope {0, "", unordered_map<string, string>()});

    if (DEBUG) {
        printf("Entered scope. Currently %lu open scopes.\n", scopeStack.size());
    }
}

void SymbolTable::leaveScope() {
    if (DEBUG) {
        printf("Leaving scope. Currently %lu open scopes.\n", scopeStack.size());
    }

    scopeStack.pop();

    if (DEBUG) {
        printf("Left scope. Currently %lu open scopes.\n", scopeStack.size());
    }
}

string SymbolTable::getVarType(const string id) {
    stack<Scope> tempStack = scopeStack;
    while (!tempStack.empty()) {
        Scope &topScope = tempStack.top();
        if (topScope.varDecls.find(id) != topScope.varDecls.end()) {
            return topScope.varDecls[id];
        }
        tempStack.pop();
    }
    throw "variable declaration: variable " + id + " is not declared.";
}

string SymbolTable::getReturnType() {   
    stack<Scope> tempStack = scopeStack;

    // find the innermost scope where isFuncScope is true
    while(!tempStack.empty()){
        Scope &topScope = tempStack.top();
        if(topScope.isFuncScope && topScope.funcReturnType != ""){
            return topScope.funcReturnType;
        }
        tempStack.pop();
    }
    throw "return statement: return keyword is not placed within a function.";
}

FuncType SymbolTable::getFuncType(const string id) {
    if (funcDefs.find(id) != funcDefs.end()) {
        return funcDefs[id];
    }
    throw "function definition: function " + id + " is not declared.";
}

StructType SymbolTable::getStructType(const string id) {
    if (structDefs.find(id) != structDefs.end()) {
        return structDefs[id];
    }
    throw "structure definition: struct " + id + " is not declared.";
}

bool SymbolTable::isVarIdDeclared(const string id) {
    Scope topScope = scopeStack.top();
    if (topScope.varDecls.find(id) == topScope.varDecls.end()) {
        return false;
    }
    return true;
}

bool SymbolTable::isFuncIdDeclared(const string id) {
    if (funcDefs.find(id) == funcDefs.end()) {
        return false;
    }
    return true;
}

bool SymbolTable::isStructIdDeclared(const string id) {
    if (structDefs.find(id) == structDefs.end()) {
        return false;
    }
    return true;
}

void SymbolTable::printFuncDefs() {
    printf("Function Definitions: \n");
    for (const auto& func : funcDefs) {
        printf("\tFunction: %s \n", func.first.c_str());
        printf("\t\tArguments: \n");
        for (const auto& arg : func.second.args) {
            printf("\t\t\t%s %s, \n", arg.first.c_str(), arg.second.c_str());
        }
        printf("\t\tReturn Type: %s \n", func.second.returnType.c_str());
    }
    printf("\n");
}

void SymbolTable::printVarDecls(bool allScopes) {
    printf("Variable Declarations: \n");
    stack<Scope> tempStack = scopeStack;
    while (!tempStack.empty()) {
        Scope &topScope = tempStack.top();
        printf("\tScope: \n");
        for (const auto& var : topScope.varDecls) {
            printf("\t\t%s %s, \n", var.first.c_str(), var.second.c_str());
        }
        tempStack.pop();
        if (!allScopes) {
            break;
        }
    }
    printf("\n");
}

void SymbolTable::printStructDefs() {
    printf("Struct Definitions: \n");
    for (const auto& str : structDefs) {
        printf("\tStruct: %s \n", str.first.c_str());
        printf("\t\tFields: \n");
        for (const auto& field : str.second.fields) {
            printf("\t\t\t%s %s, \n", field.first.c_str(), field.second.c_str());
        }
        printf("\t\tIs Exception: %s \n", str.second.isException ? "true" : "false");
    }
    printf("\n");
}