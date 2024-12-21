#include "TypeChecker.h"
#include "SymbolTable.h"
#include "debug.c"


TypeChecker::TypeChecker() {
  curType = "";
  curId = "";
  curArgList = ArgList();
  symbolTable = SymbolTable();
  curTypeListStack = stack<TypeList>();
}

void TypeChecker::visitProgram(Program *t) {} //abstract class
void TypeChecker::visitDef(Def *t) {} //abstract class
void TypeChecker::visitField(Field *t) {} //abstract class
void TypeChecker::visitArg(Arg *t) {} //abstract class
void TypeChecker::visitStm(Stm *t) {} //abstract class
void TypeChecker::visitIdIn(IdIn *t) {} //abstract class
void TypeChecker::visitExp(Exp *t) {} //abstract class
void TypeChecker::visitType(Type *t) {} //abstract class

void TypeChecker::visitPDefs(PDefs *p_defs)
{
  //check list of definitions
  if (p_defs->listdef_) p_defs->listdef_->accept(this);
}

void TypeChecker::visitDFunAdd(DFun *d_fun)
{
  //get return type
  if (d_fun->type_) d_fun->type_->accept(this);
  string returnType = curType;

  //enter scope
  symbolTable.enterScope();

  //get argument types
  if (d_fun->listarg_) d_fun->listarg_->accept(this);
  ArgList argList = curArgList;

  //add function and arguments to the symbol table -> error if already declared
  symbolTable.addFuncDef(d_fun->id_, argList, returnType);

  //leave scope
  symbolTable.leaveScope();
}

void TypeChecker::visitDFun(DFun *d_fun)
{  
  //get return type
  if (d_fun->type_) d_fun->type_->accept(this);
  string returnType = curType;

  //enter scope
  symbolTable.enterScope();

  //get argument types
  if (d_fun->listarg_) d_fun->listarg_->accept(this);
  ArgList argList = curArgList;

  //add function and arguments to the symbol table -> error if already declared
  symbolTable.addFuncDef(d_fun->id_, argList, returnType);

  //check function body
  if (d_fun->liststm_) d_fun->liststm_->accept(this);

  //leave scope
  symbolTable.leaveScope();
}

void TypeChecker::visitDStruct(DStruct *d_struct)
{
  //get argument types
  if (d_struct->listfield_) d_struct->listfield_->accept(this);
  ArgList fieldList = curArgList;

  //check that fieldList does not contain duplicate field names
  for (int i = 0; i < fieldList.size(); i++) {
    for (int j = i + 1; j < fieldList.size(); j++) {
      if (fieldList[i].first == fieldList[j].first) {
        throw "structure definition: struct " + d_struct->id_ + " contains duplicate field names.";
      }
    }
  }

  //add struct to symbol table -> error if already declared
  symbolTable.addStructDef(d_struct->id_, fieldList, false);
}

void TypeChecker::visitDStructDer(DStructDer *d_struct_der)
{
  //check parent type
  if (d_struct_der->type_) d_struct_der->type_->accept(this);
  string parentId = curId;
  string parentType = curType;

  //check that parent type is a struct or an exception
  if (!symbolTable.isStructIdDeclared(parentId) and parentType != "exception") {
    throw "structure definition: parent type " + d_struct_der->id_ + " must be a struct. But it is of type " + parentType + ".";
  }

  //get argument types
  if (d_struct_der->listfield_) d_struct_der->listfield_->accept(this);
  ArgList fieldList = curArgList;

  //check if parent is of type exception
  bool isException = false;
  if (parentType == "exception") {
    isException = true;
  }

  if (symbolTable.isStructIdDeclared(parentId)) {
    //get parent fields
    StructType parentStructType = symbolTable.getStructType(parentId);
    ArgList parentFieldList = parentStructType.fields;

    //add parent fields to child fields
    for (const auto field: parentFieldList) {
      fieldList.push_back(field);
    }

    //check if parent is of type struct exception
    if (parentStructType.isException) {
      isException = true;
    }
  }

  //check that fieldList does not contain duplicate field names
  for (int i = 0; i < fieldList.size(); i++) {
    for (int j = i + 1; j < fieldList.size(); j++) {
      if (fieldList[i].first == fieldList[j].first) {
        throw "structure definition: fields " + d_struct_der->id_ + " contain duplicate field names.";
      }
    }
  }

  //add struct to symbol table -> error if already declared
  symbolTable.addStructDef(d_struct_der->id_, fieldList, isException);
}

void TypeChecker::visitFDecl(FDecl *f_decl)
{
  //check type and set curType
  if (f_decl->type_) f_decl->type_->accept(this);

  //check that type is not void
  if (curType == "void") {
    throw "field declaration: field " + f_decl->id_ + " cannot have type void.";
  }
  
  //set curID
  curId = f_decl->id_;
}

void TypeChecker::visitADecl(ADecl *a_decl)
{
  //check type and set curType
  if (a_decl->type_) a_decl->type_->accept(this);

  //set curID
  curId = a_decl->id_;

  //add argument decl of function to its scope -> error if already declared
  symbolTable.addVarDecl(curId, curType);
}

void TypeChecker::visitSExp(SExp *s_exp)
{
  //check expression
  if (s_exp->exp_) s_exp->exp_->accept(this);
}

void TypeChecker::visitSDecls(SDecls *s_decls)
{
  //check decl type
  if (s_decls->type_) s_decls->type_->accept(this);


  //check listidin
  if (s_decls->listidin_) s_decls->listidin_->accept(this);
}

void TypeChecker::visitSReturn(SReturn *s_return)
{
  //check return type
  if (s_return->exp_) s_return->exp_->accept(this);

  //get type of function at start of scope
  string returnType = symbolTable.getReturnType();

  //compare both types. throw error if not equal, but allow int to be assigned to double
  if ((returnType != curType) && !(returnType == "double" && curType == "int")) {
    throw "return statement: expected type " + returnType + " but got type " + curType + ".";
  }
}

void TypeChecker::visitSReturnV(SReturnV *s_return_v)
{
  //return type of statement
  curType = "void";

  //get type of function at start of scope
  string returnType = symbolTable.getReturnType();

  //compare both types
  if (returnType != curType){
    throw "return statement: expected type " + returnType + " but got type " + curType + ".";
  }
}

void TypeChecker::visitSWhile(SWhile *s_while)
{
  //get type of expression
  if (s_while->exp_) s_while->exp_->accept(this);

  //check that exp type is of type bool
  if (curType != "bool") {
    throw "while statement: expected expression of type bool but got type " + curType + ".";
  }

  //enter new scope
  symbolTable.enterScope();

  //check statement
  if (s_while->stm_) s_while->stm_->accept(this);

  //leave scope
  symbolTable.leaveScope();
}

void TypeChecker::visitSDoWhile(SDoWhile *s_do_while)
{
  //enter new scope
  symbolTable.enterScope();

  //check statement
  if (s_do_while->stm_) s_do_while->stm_->accept(this);

  //leave scope
  symbolTable.leaveScope();

  //get type of expression
  if (s_do_while->exp_) s_do_while->exp_->accept(this);

  //check that exp type is of type bool
  if (curType != "bool") {
    throw "do while statement: expected expression of type bool but got type " + curType + ".";
  }
}

void TypeChecker::visitSFor(SFor *s_for)
{
  //check expressions
  if (s_for->exp_1) s_for->exp_1->accept(this);
  if (s_for->exp_2) s_for->exp_2->accept(this);
  string sndExpType = curType;
  if (s_for->exp_3) s_for->exp_3->accept(this);

  //check that second expression is of type bool
  if (sndExpType != "bool") {
    throw "for loop statement: expected second expression to be of type bool but it is of type " + sndExpType + ".";
  }

  //enter new scope
  symbolTable.enterScope();

  //check statement
  if (s_for->stm_) s_for->stm_->accept(this);

  //leave scope
  symbolTable.leaveScope();
}

void TypeChecker::visitSBlock(SBlock *s_block)
{
  //enter new scope
  symbolTable.enterScope();

  //check list of statements
  if (s_block->liststm_) s_block->liststm_->accept(this);

  //leave scope
  symbolTable.leaveScope();
}

void TypeChecker::visitSIfElse(SIfElse *s_if_else)
{
  //check espression
  if (s_if_else->exp_) s_if_else->exp_->accept(this);

  if (curType != "bool"){
    throw "if else statement: expected expression of type bool but it is of type " + curType + ".";
  }
  // enter new scope
  symbolTable.enterScope();

  // check statements
  if (s_if_else->stm_1) s_if_else->stm_1->accept(this);
  if (s_if_else->stm_2) s_if_else->stm_2->accept(this);

  // leave scope
  symbolTable.leaveScope();

}

void TypeChecker::visitSTry(STry *s_try)
{
  //enter new scope
  symbolTable.enterScope();
  
  //check stm_1
  if (s_try->stm_1) s_try->stm_1->accept(this);

  //leave scope
  symbolTable.leaveScope();

  //get exception type
  if (s_try->type_) s_try->type_->accept(this);

  //check that type is of type exception or struct with type exception
  if ((curType != "exception") 
      && !(symbolTable.isStructIdDeclared(curType) && symbolTable.getStructType(curType).isException)) {
    throw "try except statement: expected argument in catch statement to be of type exception but it is of type " + curType + ".";
  } 

  //enter new scope
  symbolTable.enterScope();

  //add exception type to varDecls in symbol table
  symbolTable.addVarDecl(s_try->id_, curType);

  //check stm_2
  if (s_try->stm_2) s_try->stm_2->accept(this);

  //leave scope
  symbolTable.leaveScope();
}

void TypeChecker::visitIdNoInit(IdNoInit *id_no_init)
{
  curId = id_no_init->id_;
  //add id_np_init to symbol table -> error if already declared
  symbolTable.addVarDecl(curId, curType);
}

void TypeChecker::visitIdInit(IdInit *id_init)
{
  curId = id_init->id_;

  //add id_init to symbol table -> error if already declared
  symbolTable.addVarDecl(curId, curType);
  string declType = curType;
  string declId = curId;

  //check exp
  if (id_init->exp_) id_init->exp_->accept(this);
  string expType = curType;

  //compare types. throw error if not equal, but allow int to be assigned to double
  if ((declType != expType) 
      && !(declType == "double" && expType == "int") 
      && !(declType == "exception" && symbolTable.isStructIdDeclared(expType) && symbolTable.getStructType(expType).isException)) {
    throw "init variable declaration: expected type " + declType + " in the initialization of variable " + declId + " but got type " + expType + ".";
  }

  //set curType to declType
  curType = declType;
}

void TypeChecker::visitETrue(ETrue *e_true)
{
  curType = "bool";
}

void TypeChecker::visitEFalse(EFalse *e_false)
{
  curType = "bool";
}

void TypeChecker::visitEInt(EInt *e_int)
{
  visitInteger(e_int->integer_);
}

void TypeChecker::visitEDouble(EDouble *e_double)
{
  visitDouble(e_double->double_);
}

void TypeChecker::visitEId(EId *e_id)
{
  visitId_(e_id->id_, "var");
}

void TypeChecker::visitEApp(EApp *e_app)
{
  string funcId = e_app->id_;

  //check list of exp and set curTypeListStack
  if (e_app->listexp_) e_app->listexp_->accept(this);
  TypeList typeList = curTypeListStack.top();
  curTypeListStack.pop();

  //get function type
  FuncType funcType = symbolTable.getFuncType(funcId);

  //check that function call has right number of arguments
  int n = typeList.size();
  int m = funcType.args.size();
  if (n != m) {
    throw "function application: function " + funcId + " expects " + to_string(m) + " arguments, but received " + to_string(n) + "."; 
  }

  //check argument types
  int i = 0;
  for (int i = 0; i < m; i++) {
    if ((typeList[i] != funcType.args[i].second) 
        && (funcType.args[i].second != "double" || typeList[i] != "int")
        && !(funcType.args[i].second == "exception" 
          && symbolTable.isStructIdDeclared(typeList[i]) 
          && symbolTable.getStructType(typeList[i]).isException)) {
      throw "function application: argument number " + to_string(i + 1) + " of function " + funcId + " must have type " + funcType.args[i].second + ". But got type " + typeList[i] + ".";
    }
  }

  //set curType to the return type of the function
  curType = funcType.returnType;
}

void TypeChecker::visitEProj(EProj *e_proj)
{
  //check that exp is of type struct 
  if (e_proj->exp_) e_proj->exp_->accept(this);
  string structId = curType;

  //check that exp if an instance of a structure
  if (!symbolTable.isStructIdDeclared(structId)) {
    throw "structure projection: only works on variables which are an instance of a struct. But the type is " + structId + "."; 
  }

  //check that id is in struct fields
  curType = "";
  StructType structType = symbolTable.getStructType(structId);
  for (const auto field: structType.fields) {
    if (e_proj->id_ == field.first) {
      //set curtype to the type of the field of the struct
      curType = field.second;
    }
  }
  if (curType == "") {
    throw "structure projection: the id " + e_proj->id_ + " is not a member of the struct " + structId + ".";
  }
}

void TypeChecker::visitEPIncr(EPIncr *ep_incr)
{
  //get type of expression
  if (ep_incr->exp_) ep_incr->exp_->accept(this);

  //check that exp type is either int or double
  if (curType != "int" && curType != "double") {
    throw "variable increment: cannot increment variable of type " + curType + ".";
  }
}

void TypeChecker::visitEPDecr(EPDecr *ep_decr)
{
  //get type of expression
  if (ep_decr->exp_) ep_decr->exp_->accept(this);

  //check that exp type is either int or double
  if (curType != "int" && curType != "double") {
    throw "variable decrement: cannot decrement variable of type " + curType + ".";
  }
}

void TypeChecker::visitEIncr(EIncr *e_incr)
{
  //get type of expression
  if (e_incr->exp_) e_incr->exp_->accept(this);

  //check that exp type is either int or double
  if (curType != "int" && curType != "double") {
    throw "variable increment: cannot increment variable of type " + curType + ".";
  }
}

void TypeChecker::visitEDecr(EDecr *e_decr)
{
  //get type of expression
  if (e_decr->exp_) e_decr->exp_->accept(this);

  //check that exp type is either int or double
  if (curType != "int" && curType != "double") {
    throw "variable decrement: cannot decrement variable of type " + curType + ".";
  }
}

void TypeChecker::visitEUPlus(EUPlus *eu_plus)
{
  //get type of expression
  if (eu_plus->exp_) eu_plus->exp_->accept(this);

  //check that exp type is either int or double
  if (curType != "int" && curType != "double") {
    throw "unary plus: cannot apply unary add to variable of type " + curType + ".";
  }
}

void TypeChecker::visitEUMinus(EUMinus *eu_minus)
{
  //get type of expression
  if (eu_minus->exp_) eu_minus->exp_->accept(this);

  //check that exp type is either int or double
  if (curType != "int" && curType != "double") {
    throw "unary minus: cannot apply unary subtract to variable of type " + curType + ".";
  }
}

void TypeChecker::visitETimes(ETimes *e_times)
{
  //get type of left expression
  if (e_times->exp_1) e_times->exp_1->accept(this);
  string leftType = curType;

  //get type of right expression
  if (e_times->exp_2) e_times->exp_2->accept(this);
  string rightType = curType;

  //check that both types are either int or double or a double and an int
  if (leftType == "int" && rightType == "int") {
    curType = "int";
  } else if ((leftType == "double" && rightType == "double") 
      || (leftType == "int" && rightType == "double") 
      || (leftType == "double" && rightType == "int")) {
    curType = "double";
  }
  else {
    throw "multiplication: cannot multiply operands of different/unallowed types " + leftType + " and " + rightType + ".";
  }
}

void TypeChecker::visitEDiv(EDiv *e_div)
{
  // get type of left operand
  if (e_div->exp_1) e_div->exp_1->accept(this);
  string leftType = curType;

  // get type of right operand
  if (e_div->exp_2) e_div->exp_2->accept(this);
  string rightType = curType;

  //check that both types are either int or double or a double and an int
  if (leftType == "int" && rightType == "int") {
    curType = "int";
  } else if ((leftType == "double" && rightType == "double") 
      || (leftType == "int" && rightType == "double") 
      || (leftType == "double" && rightType == "int")) {
    curType = "double";
  }
  else{
    throw "division: both operands must be numeric and of the same type. They are of types " + leftType + " and " + rightType + ".";
  }

}

void TypeChecker::visitEPlus(EPlus *e_plus)
{
  //get type of left expression
  if (e_plus->exp_1) e_plus->exp_1->accept(this);
  string leftType = curType;
  
  //get type of right expression
  if (e_plus->exp_2) e_plus->exp_2->accept(this);
  string rightType = curType;

  //check that both types are either int or double or a double and an int
  if (leftType == "int" && rightType == "int") {
    curType = "int";
  } else if ((leftType == "double" && rightType == "double") 
      || (leftType == "int" && rightType == "double") 
      || (leftType == "double" && rightType == "int")) {
    curType = "double";
  }
  else {
    throw "addition: cannot add operands of different/unallowed types " + leftType + " and " + rightType + ".";
  }
}

void TypeChecker::visitEMinus(EMinus *e_minus)
{
  //get type of left expression
  if (e_minus->exp_1) e_minus->exp_1->accept(this);
  string leftType = curType;
  
  //get type of right expression
  if (e_minus->exp_2) e_minus->exp_2->accept(this);
  string rightType = curType;

  //check that both types are either int or double or a double and an int
  if (leftType == "int" && rightType == "int") {
    curType = "int";
  } else if ((leftType == "double" && rightType == "double") 
      || (leftType == "int" && rightType == "double") 
      || (leftType == "double" && rightType == "int")) {
    curType = "double";
  }
  else {
    throw "subtract: cannot add operands of different/unallowed types " + leftType + " and " + rightType + ".";
  }
}

void TypeChecker::visitETwc(ETwc *e_twc)
{
  //get type of left expression
  if (e_twc->exp_1) e_twc->exp_1->accept(this);
  string leftType = curType;
  
  //get type of right expression
  if (e_twc->exp_2) e_twc->exp_2->accept(this);
  string rightType = curType;

  //check that both types are either int or double or a double and an int
  if ((leftType == "int" || leftType == "double") 
      && (rightType == "int" || rightType == "double")) {
    curType = "int";
  } else {
    throw "three way comparision: cannot do three-way comparison of different/unallowed types " + leftType + " and " + rightType + ".";
  }
}

void TypeChecker::visitELt(ELt *e_lt)
{
  //get type of left expression
  if (e_lt->exp_1) e_lt->exp_1->accept(this);
  string leftType = curType;

  //get type of right expression
  if (e_lt->exp_2) e_lt->exp_2->accept(this);
  string rightType = curType;

  //check that both types are either int or double or a double and an int
  if ((leftType == "int" || leftType == "double") 
      && (rightType == "int" || rightType == "double")) {
    curType = "bool";
  } else {
    throw "less than comparision: cannot do less or equal comparison of different/unallowed types " + leftType + " and " + rightType + ".";
  }
}

void TypeChecker::visitEGt(EGt *e_gt)
{
  //get type of left expression
  if (e_gt->exp_1) e_gt->exp_1->accept(this);
  string leftType = curType;

  //get type of right expression
  if (e_gt->exp_2) e_gt->exp_2->accept(this);
  string rightType = curType;

  //check that both types are either int or double or a double and an int
  if ((leftType == "int" || leftType == "double") 
      && (rightType == "int" || rightType == "double")) {
    curType = "bool";
  } else {
    throw "greater than: cannot do less or equal comparison of different/unallowed types " + leftType + " and " + rightType + ".";
  }
}

void TypeChecker::visitELtEq(ELtEq *e_lt_eq)
{
  //get type of left expression
  if (e_lt_eq->exp_1) e_lt_eq->exp_1->accept(this);
  string leftType = curType;
  
  //get type of right expression
  if (e_lt_eq->exp_2) e_lt_eq->exp_2->accept(this);
  string rightType = curType;

  //check that both types are either int or double or a double and an int
  if ((leftType == "int" || leftType == "double") 
      && (rightType == "int" || rightType == "double")) {
    curType = "bool";
  } else {
    throw "less than or equal to: cannot do less or equal comparison of different/unallowed types " + leftType + " and " + rightType + ".";
  }
}

void TypeChecker::visitEGtEq(EGtEq *e_gt_eq)
{
  // get type of left expression
  if (e_gt_eq->exp_1) e_gt_eq->exp_1->accept(this);
  string leftType = curType;
  
  // get type of right expression
  if (e_gt_eq->exp_2) e_gt_eq->exp_2->accept(this);
  string rightType = curType;

  //check that both types are either int or double or a double and an int
  if ((leftType == "int" || leftType == "double") 
      && (rightType == "int" || rightType == "double")) {
    curType = "bool";
  } else {
    throw "greater than or equal to: both operands of >= have to be numeric and of the same type.";
  }
}

void TypeChecker::visitEEq(EEq *e_eq)
{
  //get type of left expression
  if (e_eq->exp_1) e_eq->exp_1->accept(this);
  string leftType = curType;
  
  //get type of right expression
  if (e_eq->exp_2) e_eq->exp_2->accept(this);
  string rightType = curType;

  curType = "bool";
}

void TypeChecker::visitENEq(ENEq *en_eq)
{
  //get type of left expression
  if (en_eq->exp_1) en_eq->exp_1->accept(this);
  string leftType = curType;
  
  //get type of right expression
  if (en_eq->exp_2) en_eq->exp_2->accept(this);
  string rightType = curType;

  curType = "bool";
}

void TypeChecker::visitEAnd(EAnd *e_and)
{
  //get type of left expression
  if (e_and->exp_1) e_and->exp_1->accept(this);
  string leftType = curType;
  
  //get type of right expression
  if (e_and->exp_2) e_and->exp_2->accept(this);
  string rightType = curType;

  //check that both types are of type bool
  if (leftType == "bool" && rightType == "bool") {
    curType = "bool";
  } else {
    throw "boolean and: cannot apply and operator on unallowed types " + leftType + " and " + rightType + ".";
  }
}

void TypeChecker::visitEOr(EOr *e_or)
{
  //get type of left expression
  if (e_or->exp_1) e_or->exp_1->accept(this);
  string leftType = curType;
  
  //get type of right expression
  if (e_or->exp_2) e_or->exp_2->accept(this);
  string rightType = curType;

  //check that both types are equal
  if (leftType == "bool" && rightType == "bool") {
    curType = "bool";
  } else {
    throw "boolean or: cannot apply or operator on unallowed types " + leftType + " and " + rightType + ".";
  }
}

void TypeChecker::visitEAss(EAss *e_ass)
{
  //get type of left expression
  if (e_ass->exp_1) e_ass->exp_1->accept(this);
  string leftType = curType;
  
  //get type of right expression
  if (e_ass->exp_2) e_ass->exp_2->accept(this);
  string rightType = curType;

  //check that both types are equal
  if ((leftType == rightType)
      || (leftType == "double" && rightType == "int")) {
    curType = leftType;
  } else {
    throw "expression assignment: cannot assign type " + rightType + " to type " + leftType + ".";
  }
}

void TypeChecker::visitECond(ECond *e_cond)
{
  //get type of conditional expression
  if (e_cond->exp_1) e_cond->exp_1->accept(this);
  string condType = curType;
  
  //check that condType is of type bool
  if (condType != "bool") {
    throw "conditional expression: condition in conditional expression must by of type bool. It has type " + condType + ".";
  }

  //get type of true branch expression
  if (e_cond->exp_2) e_cond->exp_2->accept(this);
  string trueBranchType = curType;

  //get type of false branch expression
  if (e_cond->exp_3) e_cond->exp_3->accept(this);
  string falseBranchType = curType;

  //check that true and false branch expressions have the same type
  if ((trueBranchType != falseBranchType) 
      && !(trueBranchType == "double" && falseBranchType == "int") 
      && !(trueBranchType == "int" && falseBranchType == "double")) {
    throw "conditional expression: both branches of the conditional expression must have the same type. But they are of types " + trueBranchType + " and " + falseBranchType + ".";
  }

  //set curType to double or the type of the true branch
  if (trueBranchType == falseBranchType) {
    curType = trueBranchType;
  } else {
    curType = "double";
  }
}

void TypeChecker::visitEThrow(EThrow *e_throw)
{
  //get type of expression
  if (e_throw->exp_) e_throw->exp_->accept(this);

  //check that exp type is exception or a struct of type exception
  if (symbolTable.isStructIdDeclared(curType)) {
    StructType structType = symbolTable.getStructType(curType);
    if (!structType.isException) {
      throw "throw expression: cannot throw struct without parent exception";
    }
  //check that exp type is exception
  } else if (curType != "exception") {
    throw "throw expression: cannot throw expression of type " + curType + ". It must be of type exception.";
  }

  curType = "exception";
}

void TypeChecker::visitType_bool(Type_bool *type_bool)
{
  //set curType to bool
  curType = "bool";
}

void TypeChecker::visitType_int(Type_int *type_int)
{
  //set curType to int
  curType = "int";
}

void TypeChecker::visitType_double(Type_double *type_double)
{
  //set curType to double
  curType = "double";
}

void TypeChecker::visitType_void(Type_void *type_void)
{
  //set curType to void
  curType = "void";
}

void TypeChecker::visitType_exception(Type_exception *type_exception)
{
  //set curType to exception
  curType = "exception";
}

void TypeChecker::visitTypeId(TypeId *type_id)
{
  //check that id is a defined struct type
  visitId_(type_id->id_, "struct");
}


void TypeChecker::visitListDef(ListDef *list_def)
{
  for (ListDef::iterator i = list_def->begin() ; i != list_def->end() ; ++i)
  {
    (*i)->accept(this);
  }
}

void TypeChecker::visitListField(ListField *list_field)
{
  curArgList.clear();
  for (ListField::iterator i = list_field->begin() ; i != list_field->end() ; ++i)
  {
    (*i)->accept(this);
    curArgList.push_back(make_pair(curId, curType));
  }
}

void TypeChecker::visitListArg(ListArg *list_arg)
{
  curArgList.clear();
  for (ListArg::iterator i = list_arg->begin() ; i != list_arg->end() ; ++i)
  {
    (*i)->accept(this);
    curArgList.push_back(make_pair(curId, curType));
  }
}

void TypeChecker::visitListStm(ListStm *list_stm)
{
  for (ListStm::iterator i = list_stm->begin() ; i != list_stm->end() ; ++i)
  {
    (*i)->accept(this);
  }
}

void TypeChecker::visitListIdIn(ListIdIn *list_id_in)
{
  for (ListIdIn::iterator i = list_id_in->begin() ; i != list_id_in->end() ; ++i)
  {
    (*i)->accept(this);
  }
}

void TypeChecker::visitListExp(ListExp *list_exp)
{
  curTypeListStack.push(vector<string>());
  TypeList& typeList = curTypeListStack.top();
  for (ListExp::iterator i = list_exp->begin() ; i != list_exp->end() ; ++i)
  {
    (*i)->accept(this);
    if (DEBUG) printf("Add type to typeList: %s\n", curType.c_str());
    typeList.push_back(curType);
  }
  if (DEBUG) printf("typeList size: %zu\n", typeList.size());
}

void TypeChecker::visitListId(ListId *list_id)
{
  for (ListId::iterator i = list_id->begin() ; i != list_id->end() ; ++i)
  {
    visitId_(*i, "var") ;
  }
}


void TypeChecker::visitInteger(Integer x)
{
  /* Code for Integer Goes Here */
  curType = "int";
}

void TypeChecker::visitChar(Char x)
{
  /* Code for Char Goes Here */
  curType = "char";
}

void TypeChecker::visitDouble(Double x)
{
  /* Code for Double Goes Here */
  curType = "double";
}

void TypeChecker::visitString(String x)
{
  /* Code for String Goes Here */
  curType = "string";
}

void TypeChecker::visitIdent(Ident x)
{
}

void TypeChecker::visitId(Ident x)
{
}

void TypeChecker::visitId_(Id x, string type) {
  if (type == "var") {
    curType = symbolTable.getVarType(x);
    curId = x;
  } else if (type == "struct") {
    symbolTable.getStructType(x);
    curType = x;
    curId = x;
  }
}

