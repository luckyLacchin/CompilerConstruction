#ifndef TYPECHECKER_H
#define TYPECHECKER_H

#include "Absyn.H"
#include "SymbolTable.h"


typedef vector<string> TypeList;

class TypeChecker : public Visitor
{
private:
  string curType;
  string curId;
  ArgList curArgList;
  stack<TypeList> curTypeListStack;

public:
  SymbolTable symbolTable;

  TypeChecker();

  void visitProgram(Program *p);
  void visitDef(Def *p);
  void visitField(Field *p);
  void visitArg(Arg *p);
  void visitStm(Stm *p);
  void visitIdIn(IdIn *p);
  void visitExp(Exp *p);
  void visitType(Type *p);
  void visitPDefs(PDefs *p);
  void visitDFun(DFun *p);
  void visitDFunAdd(DFun *p);
  void visitDStruct(DStruct *p);
  void visitDStructDer(DStructDer *p);
  void visitFDecl(FDecl *p);
  void visitADecl(ADecl *p);
  void visitSExp(SExp *p);
  void visitSDecls(SDecls *p);
  void visitSReturn(SReturn *p);
  void visitSReturnV(SReturnV *p);
  void visitSWhile(SWhile *p);
  void visitSDoWhile(SDoWhile *p);
  void visitSFor(SFor *p);
  void visitSBlock(SBlock *p);
  void visitSIfElse(SIfElse *p);
  void visitSTry(STry *p);
  void visitIdNoInit(IdNoInit *p);
  void visitIdInit(IdInit *p);
  void visitETrue(ETrue *p);
  void visitEFalse(EFalse *p);
  void visitEInt(EInt *p);
  void visitEDouble(EDouble *p);
  void visitEId(EId *p);
  void visitEApp(EApp *p);
  void visitEProj(EProj *p);
  void visitEPIncr(EPIncr *p);
  void visitEPDecr(EPDecr *p);
  void visitEIncr(EIncr *p);
  void visitEDecr(EDecr *p);
  void visitEUPlus(EUPlus *p);
  void visitEUMinus(EUMinus *p);
  void visitETimes(ETimes *p);
  void visitEDiv(EDiv *p);
  void visitEPlus(EPlus *p);
  void visitEMinus(EMinus *p);
  void visitETwc(ETwc *p);
  void visitELt(ELt *p);
  void visitEGt(EGt *p);
  void visitELtEq(ELtEq *p);
  void visitEGtEq(EGtEq *p);
  void visitEEq(EEq *p);
  void visitENEq(ENEq *p);
  void visitEAnd(EAnd *p);
  void visitEOr(EOr *p);
  void visitEAss(EAss *p);
  void visitECond(ECond *p);
  void visitEThrow(EThrow *p);
  void visitType_bool(Type_bool *p);
  void visitType_int(Type_int *p);
  void visitType_double(Type_double *p);
  void visitType_void(Type_void *p);
  void visitType_exception(Type_exception *p);
  void visitTypeId(TypeId *p);
  void visitListDef(ListDef *p);
  void visitListField(ListField *p);
  void visitListArg(ListArg *p);
  void visitListStm(ListStm *p);
  void visitListIdIn(ListIdIn *p);
  void visitListExp(ListExp *p);
  void visitListId(ListId *p);

  void visitInteger(Integer x);
  void visitChar(Char x);
  void visitDouble(Double x);
  void visitString(String x);
  void visitIdent(Ident x);
  void visitId(Id x);
  void visitId_(Id x, string type);

};


#endif
