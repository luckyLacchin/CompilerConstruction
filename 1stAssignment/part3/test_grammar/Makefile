## File generated by the BNF Converter (bnfc 2.9.5).

# Makefile for building the parser and test program.

GHC        = ghc
HAPPY      = happy
HAPPY_OPTS = --array --info --ghc --coerce
ALEX       = alex
ALEX_OPTS  = --ghc

# List of goals not corresponding to file names.

.PHONY : all clean distclean

# Default goal.

all : TestPart

# Rules for building the parser.

AbsPart.hs LexPart.x ParPart.y PrintPart.hs TestPart.hs : part1-3.cf
	bnfc --haskell part1-3.cf

%.hs : %.y
	${HAPPY} ${HAPPY_OPTS} $<

%.hs : %.x
	${ALEX} ${ALEX_OPTS} $<

TestPart : AbsPart.hs LexPart.hs ParPart.hs PrintPart.hs TestPart.hs
	${GHC} ${GHC_OPTS} $@

# Rules for cleaning generated files.

clean :
	-rm -f *.hi *.o *.log *.aux *.dvi

distclean : clean
	-rm -f AbsPart.hs AbsPart.hs.bak ComposOp.hs ComposOp.hs.bak DocPart.txt DocPart.txt.bak ErrM.hs ErrM.hs.bak LayoutPart.hs LayoutPart.hs.bak LexPart.x LexPart.x.bak ParPart.y ParPart.y.bak PrintPart.hs PrintPart.hs.bak SkelPart.hs SkelPart.hs.bak TestPart.hs TestPart.hs.bak XMLPart.hs XMLPart.hs.bak ASTPart.agda ASTPart.agda.bak ParserPart.agda ParserPart.agda.bak IOLib.agda IOLib.agda.bak Main.agda Main.agda.bak part1-3.dtd part1-3.dtd.bak TestPart LexPart.hs ParPart.hs ParPart.info ParDataPart.hs Makefile


# EOF
