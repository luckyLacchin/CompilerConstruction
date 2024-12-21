#ifndef SYMBOLTABLE_H
#define SYMBOLTABLE_H

#include <stack>
#include <vector>
#include <cstring>
#include <unordered_map>

using namespace std;


typedef vector<pair<string, string>> ArgList;
typedef unordered_map<string, string> DeclList;


struct FuncType {
    ArgList args;
    string returnType;
};

struct StructType {
    ArgList fields;
    bool isException;
};

struct Scope {
    bool isFuncScope;
    string funcReturnType;
    DeclList varDecls;
};

class SymbolTable {
private:
    unordered_map<string, FuncType> funcDefs;
    unordered_map<string, StructType> structDefs;
    stack<Scope> scopeStack;

public:
    SymbolTable();

    void addVarDecl(const string id, const string type);
    void addStructDef(const string id, const ArgList fields, const bool isException);
    void addFuncDef(const string id, const ArgList args, const string returnType);

    void enterScope();
    void leaveScope();

    string getVarType(const string id);
    string getReturnType();
    FuncType getFuncType(const string id);
    StructType getStructType(const string id);

    bool isVarIdDeclared(const string id);
    bool isFuncIdDeclared(const string id);
    bool isStructIdDeclared(const string id);

    void printFuncDefs();
    void printStructDefs();
    void printVarDecls(bool allScopes);
};

#endif
