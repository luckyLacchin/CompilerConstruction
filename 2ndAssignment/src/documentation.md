# Scope Types:

* block statement: Ref: SBlock
* function definition. Ref: DFun
    * Add function to funcDefs in SymbolTable
    * Add returnType to Scope
    * Add arguments to varDecls in Scope
* structure definition. ref: DStruct, DStructDer
    * Add struct to structDefs in SymbolTable
* Opt: for-loop, while, do-while, if-else, try-catch

# Declaration Types:

* variable/argument declaration: 
    * id
    * type
* function declaration:
    * id
    * [(id, type)]
    * type
* struct declaration: 
    * id
    * [(id, type)]