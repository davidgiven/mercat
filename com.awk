BEGIN {
	stderr = "/dev/stderr"
	
	token_unknown			= 0
	token_string			= 1
	token_integer			= 2
	token_word			= 3
	token_op			= 4
	token_cp			= 5
	token_ob			= 6
	token_cb			= 7
	token_os			= 8
	token_cs			= 9
	token_eos			= 10
	token_comma			= 11
	token_lessthan			= 12
	token_greaterthan		= 13
	token_lessthanequals		= 14
	token_greaterthanequals		= 15
	token_equals			= 16
	token_notequals			= 17
	token_becomes			= 18
	token_multiply			= 19
	token_divide			= 20
	token_add			= 21
	token_subtract			= 22
	token_not			= 23
	token_shiftleft			= 24
	token_shiftright		= 25
	
	line = ""
	tokenbuffer = ""
	tokensbuffer = ""
	queuecount = -1
	breakcmd = ""
	infile = ""
	sp = 1
	spmark = 0
	tag = 0
	pass = 0
	
	db["void"] = "type"
	db["void", "ntype"] = "!"
	db["void", "ntypelong"] = "!"

	db["byte"] = "type"
	db["byte", "ntype"] = "s"
	db["byte", "ntypelong"] = "int"
		
	db["int"] = "type"
	db["int", "ntype"] = "l"
	db["int", "ntypelong"] = "int"
	
	db["string"] = "type"
	db["string", "ntype"] = "o"
	db["string", "ntypelong"] = "\"\""
#	db["string", "collection"] = 1

	db["array"] = "type"
	db["array", "ntype"] = "o"
	db["array", "ntypelong"] = "array object"
	db["array", "collection"] = 2

	db["dict"] = "type"
	db["dict", "ntype"] = "o"
	db["dict", "ntypelong"] = "dict object"
	db["dict", "collection"] = 2
	
	db["array byte"] = "type"
	db["array byte", "ntype"] = "o"
	db["array byte", "ntypelong"] = "array byte"
	db["array byte", "collection"] = 1
	db["array byte", "contains"] = "int"
	
	db["array int"] = "type"
	db["array int", "ntype"] = "o"
	db["array int", "ntypelong"] = "array int"
	db["array int", "collection"] = 1
	db["array int", "contains"] = "int"
	
	db["array string"] = "type"
	db["array string", "ntype"] = "o"
	db["array string", "ntypelong"] = "array object"
	db["array string", "collection"] = 1
	db["array string", "contains"] = "string"

	db["dict string"] = "type"
	db["dict string", "ntype"] = "o"
	db["dict string", "ntypelong"] = "dict object"
	db["dict string", "collection"] = 1
	db["dict string", "contains"] = "string"

	db["dict int"] = "type"
	db["dict int", "ntype"] = "o"
	db["dict int", "ntypelong"] = "dict int"
	db["dict int", "collection"] = 1
	db["dict int", "contains"] = "int"
}

function error(s) {
	print ("Error: " s " at line " linenum) > stderr
	exit(1)
}

function emit(s) {
	if (queuecount >= 0)
		emitqueue[queuecount] = emitqueue[queuecount] s
	else
		printf("%s", s)
}

function queue() {
	queuecount++
	emitqueue[queuecount] = ""
}

function dequeue( \
s){
	s = emitqueue[queuecount]
	emitqueue[queuecount] = ""
	queuecount--
	return s
}

# --- Code emission ----------------------------------------------------------

function mktag() {
	tag = tag + 1
	return tag - 1
}

function emitop(o, arg) {
	emit("\t" o " " arg "\n")
}

function emit_tag(t) {
	emit(": _" t "\n")
}

function emit_jump(t) {
	emit("\tjump _" t "\n")
}

# --- Lexer ------------------------------------------------------------------

function getchar( \
c) {
	if (line == "")
	{
		while (line == "")
		{
			linenum++
			if (!(getline line < infile))
				error("Unexpected EOF!")
			if (pass == 2)
				emit("# " line "\n")
		}
		line = " " line
	}

	c = substr(line, 1, 1)
	sub(/^./, "", line)
	return c

}

function putchar(c) {
	line = c line
}

function peekc( \
c) {
	if (line == "")
	{
		c = getchar()
		putchar(c)
		return c
	}
	return substr(line, 1, 1)
}

# --- Parser -----------------------------------------------------------------

function readtoken( \
c) {
	if (tokenbuffer == "")
	{
		while (peekc() ~ /[ \t]/)
			getchar()
			
		c = getchar()
			
		if (c == "\"")
		{
			tokens = ""
			while (peekc() !~ /"/)
			{
				if (peekc() == "\\")
					tokens = tokens getchar() getchar()
				else
					tokens = tokens getchar()
			}
				
			if (getchar() != "\"")
				error("Unmatched \"")
			
			return token_string
		} else if (c == "(")
			return token_op
		else if (c == ")")
			return token_cp
		else if (c == "{")
			return token_ob
		else if (c == "}")
			return token_cb
		else if (c == "[")
			return token_os
		else if (c == "]")
			return token_cs
		else if (c == ",")
			return token_comma
		else if (c == ";")
			return token_eos
		else if (c == "/")
		{
			if (peekc() == "/")
			{
				line = ""
				return readtoken()
			}
			return token_divide
		} else if (c == "*")
			return token_multiply
		else if (c == "+")
			return token_add
		else if (c == "-")
			return token_subtract
		else if (c == ":")
		{
			if (peekc() == "=")
			{
				getchar()
				return token_becomes
			}
		}
		else if (c == "!")
		{
			if (peekc() == "=")
			{
				getchar()
				return token_notequals
			}
			else
				return token_not
		}
		else if (c == "<")
		{
			if (peekc() == "=")
			{
				getchar()
				return token_lessthanequals
			} else if (peekc() == ">")
			{
				getchar()
				return token_notequals
			} else if (peekc() == "<")
			{
				getchar()
				return token_shiftleft
			} else
				return token_lessthan
		} else if (c == ">")
		{
			if (peekc() == "=")
			{
				getchar()
				return token_greaterthanequals
			}
			else if (peekc() == ">")
			{
				getchar()
				return token_shiftright
			}
			return token_greaterthan
		} else if (c == "=")
		{
			if (peekc() == "=")
			{
				getchar()
				return token_equals
			}
		} else if (c ~ /[0-9]/)
		{
			tokens = c
			while (peekc() ~ /[0-9]/)
				tokens = tokens getchar()
			tokens = tokens + 0
			return token_integer
		} else if (c ~ /[A-Za-z0-9_]/)
		{
			tokens = c
			while (peekc() ~ /[A-Za-z0-9_]/)
				tokens = tokens getchar()
			return token_word
		}
		
		error("Unknown character on input '"c"'")
	}
	else
	{
		c = tokenbuffer
		tokenbuffer = ""
		tokens = tokensbuffer
		tokensbuffer = ""
		return c
	}
}

function escape(c) {
	gsub(/\\n/, "\n", c)
	gsub(/\\t/, "\t", c)
	gsub(/\\\\/, "\\", c)
	gsub(/\\"/, "\"", c)
#	if (c == "n")
#		return "\n"
#	else if (c == "t")
#		return "\t"
#	else if (c == "\"")
#		return "\""
#	else if (c == "\\")
#		return "\\"
#	else
#		return c
#		error("Unknown string escape '"c"'")
#	return "\\" c
	return c
}

function peek() {
	if (tokenbuffer == "")
	{
		tokenbuffer = readtoken()
		tokensbuffer = tokens
	}

	return tokenbuffer
}

function pushtoken(t, ts) {
	if (tokenbuffer != "")
		error("Can't call pushtoken twice in succession")
	
	tokenbuffer = t
	tokensbuffer = ts
}
	
function ensuretoken(t1, t2) {
	if (t1 != t2) 
		error("Expected "t2", got "t1)
}

function ensureeos() {
	ensuretoken(readtoken(), token_eos)
}

function readtype( \
t, a, n, i, j, source, target) {
	t = ""
	while (1)
	{
		if (peek() != token_word)
			break
			
		if (db[tokens] == "")
			break
		
		if (db[tokens] != "type")
			break
		
		readtoken()
		t = t " " tokens
	}

	if (t == "")
	{
		if (db[tokens] == "")
			error("Undefined symbol `"tokens"'")
	
		if (db[tokens] != "type")
			error("Expected a type, got "tokens)
	}		
			
	sub(/^./, "", t)
	n = split(t, a)

	if (n>1)
	{	
		if (n>2)
		{
			for(i=1; i<(n-1); i++)
			{
				source = ""
				target = ""
				for (j=i; j<=n; j++)
				{
					source = source " " a[j]
					if (j != i)
						target = target " " a[j]
				}
			
				sub(/^./, "", source)
				sub(/^./, "", target)
			
				db[source] = "type"
				db[source, "ntype"] = "o"
				db[source, "ntypelong"] = db[a[i], "ntypelong"]
				db[source, "collection"] = 2
				db[source, "contains"] = target
			}
		}
		
		if (db[a[n]] == "")
			error("Undefined symbol "a[n])
		
		if (db[a[n]] != "type")
			error("Expected a type, got "a[n])
			
		if (db[a[n], "collection"] == 2)
			error("The type `"t"' is not completely specified")
	}

	tokens = t
	return db[tokens, "ntype"]
}

function outofscope(name, scope) {
	if ((scope == 2) || (scope == 3))
		if (db[name] != "")
			error("Redefined symbol "name" (already defined as global "db[name]")")
		
	if ((scope == 1) || (scope == 3))
		if (ldb[name] != "")
			error("Redefined symbol "name" (already defined as local "ldb[name]")")
}

function inscope(name, \
s) {
	s = ldb[name]
	if (s != "")
		return s
	s = db[name]
	if (s != "")
		return s
	
	error("Undefined symbol '"name"'")
}

function scope(name, \
s) {
	s = ldb[name]
	if (s != "")
		return 1
	s = db[name]
	if (s != "")
		return 2
		
	error("Undefined symbol '"name"'")
}

function collection(t) {
	return (db[t, "collection"])
}

function lookup(a, b, \
s) {
	s = ldb[a, b]
	if (s != "")
		return s
	s = db[a, b]
	if (s != "")
		return s
	error("Undefined symbol '"a"'")
}

function var(s, \
t) {
#	t = s
#	gsub(/\_/, ".", t)
#	return t
	return s
}

# --- Compiler nodes ---------------------------------------------------------

function do_pass1() {
	pass = 1
	while(1) {
		ensuretoken(readtoken(), token_word)
		if (tokens == "end")
			return
		else if ((tokens == "library") ||
			 (tokens == "global"))
			while (readtoken() != token_eos);
		else if ((tokens == "function") ||
			 (tokens == "prototype") ||
			 (tokens == "inline"))
			do_function(-1)
		else if (tokens == "endprotos")
		{}
		else
			error("Unknown directive "tokens)
	}
}

function do_pass2() {
	pass = 2
	while(1) {
		ensuretoken(readtoken(), token_word)
		if (tokens == "end")
			return
		else if (tokens == "library")
			do_library()
		else if (tokens == "global")
			do_global()
		else if (tokens == "function")
			do_function(0)
		else if (tokens == "prototype")
			do_function(1)
		else if (tokens == "inline")
			do_function(2)
		else if (tokens == "endprotos")
		{}
		else
			error("Unknown directive "tokens)
	}
}

function do_funclevel(\
t) {
	t = readtoken()
	
	if (t == token_word)
	{
		if (db[tokens] == "type")
		{
			pushtoken(token_word, tokens)
			do_local()
		}
		else if (db[tokens] == "func")
		{
			t = tokens
			if (do_funccall(t) != "void")
				error("Function call to '"t"' did not return void")
			ensureeos()
			emit("\n")
		}
		else if ((ldb[tokens] == "var") || (db[tokens] == "var"))
		{
			do_assignment(tokens)
			ensureeos()
			emit("\n")
		}
		else if (tokens == "return")
		{
			do_return()
			ensureeos()
			emit("\n")
		}
		else if (tokens == "if")
			do_if()
		else if (tokens == "while")
			do_while()
		else if (tokens == "break")
			do_break()
		else if (tokens == "do")
			do_do()
		else if (tokens == "for")
			do_for()
		else if (tokens == "sizeof")
		{
			do_setsize()
			ensureeos();
			emit("\n");
		}
		else if (tokens == "delete")
			do_delete()
		else
			error("Unexpected function-level directive '"tokens"'")
	}
	else if (t == token_ob)
	{
		while (peek() != token_cb)
		{
			do_funclevel()
		}
		ensuretoken(readtoken(), token_cb)
	}
	else
		error("Unexpected token "t)
}
	
function do_library() {
	ensuretoken(readtoken(), token_word)
	print "Importing library " tokens > stderr
	ensureeos()
}

function do_global( \
nt, st, n, t){
	nt = readtype()
	st = tokens
	ensuretoken(readtoken(), token_word)
	n = tokens
	outofscope(n, 2)
	db[n] = "var"
	db[n, "type"] = st
	emit("# global " var(n) " of type " db[n, "type"] " at " sp "\n")
	db[n, "sp"] = sp

	if (peek() == token_eos)
	{
		ensureeos();
		if (collection(st) || (st == "string"))
			emitop("pusho", db[st, "ntypelong"])
		else
			emitop("pushi", 0)
		sp = sp + 1
	}
	else
	{
		ensuretoken(readtoken(), token_becomes)
		t = do_rvalue()
		sp = sp + 1
		if (t != st)
			error("Initialisation of global '"n"' from wrong type")
		ensureeos()
	}	
}

function do_local( \
nt, st, n, t){
	nt = readtype()
	st = tokens
	ensuretoken(readtoken(), token_word)
	n = tokens
	outofscope(n, 1)
	ldb[n] = "var"
	ldb[n, "type"] = st
	ldb[n, "sp"] = sp - spmark
	emit("# local " n " of type " st " at " (sp-spmark) "\n")

	if (peek() == token_eos)
	{
		ensureeos();
#		if (collection(st))
#			emit("m." var(n) nt " = create." db[st, "ntypelong"])
		if (collection(st) || (st == "string"))
			emitop("pusho", db[st, "ntypelong"])
		else
			emitop("pushi", 0)
		sp = sp + 1
	}
	else
	{
		ensuretoken(readtoken(), token_becomes)
		t = do_rvalue()
		sp = sp + 1
		if (t != st)
			error("Initialisation of local '"n"' from wrong type")
		ensureeos()
	}	
}

function do_function(proto, \
nt, st, n, pnt, pst, pn, p, tag) {
	nt = readtype()
	st = tokens
	
	ensuretoken(readtoken(), token_word)
	n = tokens

	spmark = sp
	if (proto == 0)
		print n > stderr
	
	if (db[n, "alloced"] != -1)
		outofscope(n, 2)
		
	db[n] = "func"
	db[n, "alloced"] = proto
	db[n, "return"] = st
	
	p = 0
	while (peek() != token_ob)
	{
		pnt = readtype()
		pst = tokens
		ensuretoken(readtoken(), token_word)
		pn = tokens
		if (ldb[pn] != "")
			error("Symbol `" pn "' already defined as local " ldb[pn, "type"]);
			
		ldb[pn] = "var"
		ldb[pn, "type"] = pst
		ldb[pn, "sp"] = sp - spmark
		
		if (proto == 0)
			emit("# argument " pn " of type " ldb[pn, "type"] " at " ldb[pn, "sp"] "\n")
		
		sp = sp + 1
			
		db[n, p] = pst
		p++
		ensureeos()
	}
	db[n, "args"] = p
	if (db[st, "ntype"] == "!")
		db[n, "sp"] = sp - spmark
	else
		db[n, "sp"] = sp - spmark - 1
	
	if ((proto == 1) || (proto == -1))
	{
		ensuretoken(readtoken(), token_ob)
		p = 1
		while (p>0)
		{
			i = readtoken()
			if (i == token_ob)
				p++
			else if (i == token_cb)
				p--
		}
		for(i in ldb)
			delete ldb[i]
		sp = spmark
		return
	}
	else if (proto == 2)
	{
		ensuretoken(readtoken(), token_ob)
		ensuretoken(readtoken(), token_string)
		db[n, "value"] = tokens
		ensuretoken(readtoken(), token_cb)
		
		for(i in ldb)
			delete ldb[i]
		sp = spmark
		return
	}
	else
		ensuretoken(readtoken(), token_ob)

	tag = mktag()
	emitop("jump", "_"tag)
	emit(": " n "\n")
		
#	for(p in ldb)
#		if (p !~ /\034/)
#		{
#			pnt = db[ldb[p, "type"], "ntype"]
#			if (!(p in db))
#				emit("dim m." var(p) pnt "\n")
#			emit("m." var(p) pnt " = n." var(p) pnt "\n")
#		}
	
	while (peek() != token_cb)
	{
		funcname = n
		functype = st
		do_funclevel()
	}
	ensuretoken(readtoken(), token_cb)

	if (functype != "void")
	{
		if (collection(st))
		{
			emitop("pusho", db[functype, "ntypelong"])
			emitop("saveo", "")
		} else {
			emitop("pushi", 0)
			emitop("savei", "")
		}
	}

	emit(": _return_" n "\n")
	do_funcexit()
	for (i in ldb)
		delete ldb[i]
	emitop("return", "")
	sp = spmark
	emit_tag(tag)
}

function do_funcexit( \
	ms, i, v) {
	do {
		ms = -1
		v = ""
		for (i in ldb)
		{
			if ((i !~ /\034/) && (ldb[i] == "var"))
				if (ldb[i, "sp"] > ms)
				{
					ms = ldb[i, "sp"]
					v = i
				}
		}
		if (v != "")
		{
			ldb[v, "sp"] = -1
			emit("# retract over local var " v "\n")
			if (ldb[v, "type"] == "int")
				emitop("popi", "")
			else
				emitop("popo", "")
#			emitop("pop" db[ldb[v, "type"], "ntype"], "")
		}
	} while (ms != -1)
}

function do_rvalue( \
t1, op, s){
	queue()
	t1 = do_rvalue_medpriority()
	s = dequeue()
	op = peek()
	if ((op == token_equals) ||
	    (op == token_notequals) ||
	    (op == token_lessthan) ||
	    (op == token_lessthanequals) ||
	    (op == token_greaterthan) ||
	    (op == token_greaterthanequals) ||
	    ((op == token_word) && (tokens == "contains")))
		return do_lowpriority(readtoken(), t1 ,s)
	else
	{
		emit(s)
		return t1
	}
}

function do_rvalue_medpriority( \
t1, op, s){
	queue()
	t1 = do_rvalue_highpriority()
	s = dequeue()
	op = peek()
	if ((op == token_add) ||
	    (op == token_subtract) ||
	    (op == token_shiftleft) ||
	    (op == token_shiftright) ||
	    ((op == token_word) && (tokens == "or")))
		return do_medpriority(readtoken(), t1, s)
	else
	{
		emit(s)
		return t1
	}
}

function do_rvalue_highpriority( \
t1, op, s){
	queue()
	t1 = do_rvalue_element()
	s = dequeue()
	op = peek()
	if ((op == token_multiply) ||
	    (op == token_divide) ||
	    ((op == token_word) && (tokens == "mod")) ||
	    ((op == token_word) && (tokens == "and")))
		return do_highpriority(readtoken(), t1, s)
	else
	{
		emit(s)
		return t1
	}
}

function do_rvalue_element( \
t){
	t = readtoken()
	if (t == token_word)
	{
		if (ldb[tokens] != "")
		{
			if (ldb[tokens] == "func")
				return do_funccall(tokens)
			else if (ldb[tokens] == "var")
				return do_varlookup(tokens)
			else
				error("Unexpected use of local symbol '"tokens"'")
		}
		else if (db[tokens] != "")
		{
			if (db[tokens] == "func")
				return do_funccall(tokens)
			else if (db[tokens] == "var")
				return do_varlookup(tokens)
			else
				error("Unexpected use of global symbol '"tokens"'")
		}
		else if (tokens == "sizeof")
			return do_size()
		else if (tokens == "create")
			return do_create()
		else if (tokens == "list")
			return do_list()
		else
			error("Undefined symbol '"tokens"'")
	}
	else if (t == token_not)
		return do_not()
	else if (t == token_op)
	{
		t = do_rvalue()
		ensuretoken(readtoken(), token_cp)
		return t
	}
	else if (t == token_subtract)
	{
		ensuretoken(readtoken(), token_integer)
		emitop("pushi", -tokens)
		return "int"
	}
	else if (t == token_integer)
	{
		emitop("pushi", tokens)
		return "int"
	}
	else if (t == token_string)
	{
		emitop("pusho", "\"" tokens "\"")
		return "string"
	}
	else
		error("Unexpected token "t" (tokens="tokens")")
}

function do_funccall(funcname, \
p, t, returntype){
	ensuretoken(readtoken(), token_op)
	p = 0
	
#	emit("m." var(funcname) db[db[funcname, "return"], "ntype"])
	if (db[funcname, "alloced"] != 2)
		emitop("pushfp", "")
	if (peek() != token_cp)
	{
		do {
			t = do_rvalue()
			if (db[funcname, p] != t)
				error("In call to '"funcname"', parameter "(p+1)" is a "t" when it should be a "db[funcname, p])
			p++
			t = readtoken()
		} while (t == token_comma)
		if (p != db[funcname, "args"])
			error("In call to `"funcname"', you specified "p" parameters when you should have had "db[funcname, "args"])
		ensuretoken(t, token_cp)
	}
	else
		readtoken()

	returntype = lookup(funcname, "return")
	if (db[funcname, "alloced"] == 2)
		emit("\t" escape(db[funcname, "value"]) "\n")
	else
	{
		emitop("call", funcname)
	
		if (returntype != "void")
		{
			if (returntype == "int")
				emitop("loadi", "")
			else
				emitop("loado", "")
		}
	}
		
	return returntype
}

function do_if( \
t, tag1, tag2){
	tag1 = mktag()
	tag2 = mktag()
	
	# Conditional
	
	t = do_rvalue()
	if (t != "int")
		error("Type mismatch; expected primitive integer, got "t)
	emitop("bne", "_"tag1)
	
	do_funclevel()
	t = readtoken()
	if ((t == token_word) && (tokens == "else"))
	{
		emitop("jump", "_" tag2)
		emit_tag(tag1)
		do_funclevel()
	}
	else
	{
		emit_tag(tag1)
		pushtoken(t, tokens)
	}
	
	emit_tag(tag2)
}

function do_size( \
t){
	ensuretoken(readtoken(), token_op)
	t = do_rvalue()
	if (!collection(t) && (t != "string"))
		error("Can't use size() on something that's not an array or string")
	
	emitop("size", "")

	ensuretoken(readtoken(), token_cp)
	return "int"
}

function do_not( \
t) {
	t = do_rvalue_element()
	if (t != "int")
		error("Can't use ! on anything but a int")
	emitop("not", "")
	return "int"
}

function do_lowpriority(token, t1, lcode, \
t2, c, nt, tag1, tag2){
	emit(lcode)
	queue()
	nt = db[t1, "ntype"]
	
	if (t1 == "int")
	{
		if (token == token_equals)
		{
			emitop("sub", "")
			emitop("itb", "")
			emitop("not", "")
		}
		else if (token == token_notequals)
		{
			emitop("sub", "")
			emitop("itb", "")
		}
		else if (token == token_lessthan)
		{
			tag1 = mktag()
			tag2 = mktag()
			emitop("sub", "")
			emitop("blt", "_"tag1)
			emitop("pushi", 1)
			emitop("jump", "_"tag2)
			emit_tag(tag1)
			emitop("pushi", 0)
			emit_tag(tag2)
		}
		else if (token == token_greaterthan)
		{
			tag1 = mktag()
			tag2 = mktag()
			emitop("sub", "")
			emitop("bgt", "_"tag1)
			emitop("pushi", 1)
			emitop("jump", "_"tag2)
			emit_tag(tag1)
			emitop("pushi", 0)
			emit_tag(tag2)
		}
		else if (token == token_lessthanequals)
		{
			tag1 = mktag()
			tag2 = mktag()
			emitop("sub", "")
			emitop("ble", "_"tag1)
			emitop("pushi", 1)
			emitop("jump", "_"tag2)
			emit_tag(tag1)
			emitop("pushi", 0)
			emit_tag(tag2)
		}
		else if (token == token_greaterthanequals)
		{
			tag1 = mktag()
			tag2 = mktag()
			emitop("sub", "")
			emitop("bge", "_"tag1)
			emitop("pushi", 1)
			emitop("jump", "_"tag2)
			emit_tag(tag1)
			emitop("pushi", 0)
			emit_tag(tag2)
		}
	}
	else if (t1 == "string")
	{
		if (token == token_equals)
		{
			emitop("strcmp", "")
			emitop("itb", "")
			emitop("not", "")
		}
		else if (token == token_notequals)
		{
			emitop("strcmp", "")
			emitop("itb", "")
		}
		else if (token == token_lessthan)
		{
			tag1 = mktag()
			tag2 = mktag()
			emitop("strcmp", "")
			emitop("blt", "_"tag1)
			emitop("pushi", 1)
			emitop("jump", "_"tag2)
			emit_tag(tag1)
			emitop("pushi", 0)
			emit_tag(tag2)
		}
		else if (token == token_greaterthan)
		{
			tag1 = mktag()
			tag2 = mktag()
			emitop("strcmp", "")
			emitop("bgt", "_"tag1)
			emitop("pushi", 1)
			emitop("jump", "_"tag2)
			emit_tag(tag1)
			emitop("pushi", 0)
			emit_tag(tag2)
		}
		else if (token == token_lessthanequals)
		{
			tag1 = mktag()
			tag2 = mktag()
			emitop("strcmp", "")
			emitop("ble", "_"tag1)
			emitop("pushi", 1)
			emitop("jump", "_"tag2)
			emit_tag(tag1)
			emitop("pushi", 0)
			emit_tag(tag2)
		}
		else if (token == token_greaterthanequals)
		{
			tag1 = mktag()
			tag2 = mktag()
			emitop("strcmp", "")
			emitop("bge", "_"tag1)
			emitop("pushi", 1)
			emitop("jump", "_"tag2)
			emit_tag(tag1)
			emitop("pushi", 0)
			emit_tag(tag2)
		}
	}
	else if (t1 ~ /^dict/)
	{
		if (tokens == "contains")
		{
			emitop("statd", "")
			#emit("check." db[t1, "ntypelong"] "(" lcode ", ")
			t1 = "string"
			#if (do_rvalue_medpriority() != "string")
			#	error("Dictionaries only contain strings")
			#emit(")")
		}
		else
			error("`contains' on "t1" unimplemented")
	}
	else
		error("You can't use "token" on a "t1)
	
	c = dequeue()
			
	t2 = do_rvalue_medpriority()
	if (t1 != t2)
		error("Type mismatch in low-priority clause; "t1" is not "t2)
	emit(c)

	return "int"
}

function do_medpriority(token, t1, lcode, \
t2, c, nt){
	emit(lcode)
	
	queue()
	nt = db[t1, "ntype"]

	if (t1 == "int")
	{
		if (token == token_add)
			emitop("add", "")
		else if (token == token_subtract)
			emitop("sub", "")
		else if (token == token_word)
		{
			if (tokens == "or")
				emitop("or", "")
		}
		else if (token == token_shiftleft)
			emitop("shl", "")
		else if (token == token_shiftright)
			emitop("shr", "")
	}
	else if (t1 == "string")
	{
		if (token == token_add)
			emitop("concat", "")
		else
			error("Type mismatch in medium-priority clause; you can't use "token_add" on a "t1)
	}

	c = dequeue()
	
	t2 = do_rvalue_medpriority()
	if (t1 != t2)
		error("Type mismatch in medium-priority clause; "t1" is not "t2)
	emit(c)
	return t1
}

function do_highpriority(token, t1, lcode, \
t2, c, nt)
{
	emit(lcode)
	queue()
	nt = db[t1, "ntype"]

	if (token == token_multiply)
		emitop("mul", "")
	else if (token == token_divide)
		emitop("div", "")
	else if (token == token_word)
	{
		if (tokens == "mod")
			emitop("mod", "")
		else if (tokens == "and")
			emitop("and", "")
	}
	c = dequeue()
	
	t2 = do_rvalue_highpriority()
	if (t1 != t2)
		error("Type mismatch in high-priority clause; "t1" is not "t2)
	emit(c)
	return t1
}

function do_varlookup(name, \
ptype, pcode, itype, icode, nt){
	if (inscope(name) != "var")
		error("'"name"' is a "inscope(name)", not a var")
		
	ptype = lookup(name, "type")
	queue()
	if (lookup(ptype, "ntypelong") == "int")
		nt = "i"
	else
		nt = "o"
		
#	print lookup(ptype, "ntypelong") ":" nt > stderr
	if (scope(name) == 1)
		emitop("peek" nt, "-" lookup(name, "sp"))
	else
		emitop("peek" nt, lookup(name, "sp"))
	pcode = dequeue()
		
	while (peek() == token_os)
	{
		readtoken()
		queue()
		itype = do_rvalue()
		icode = dequeue()
		ensuretoken(readtoken(), token_cs)
		queue()
		ptype = do_lookupnode(ptype, pcode, itype, icode)
		pcode = dequeue()
	}
	emit(pcode)
	return ptype
}

function do_lookupnode(ptype, pcode, itype, icode) {
	if (ptype ~ /^array/)
	{
		if (itype != "int")
			error("Can't use a "itype" as an index to an array")
		emit(pcode)
		emit(icode)
		emitop("geta", "")
		return db[ptype, "contains"]
	} else if (ptype ~ /^dict/)
	{
		if (itype != "string")
			error("Can't use a "itype" as an index to a dictionary")
		emit(pcode)
		emit(icode)
		emitop("getd", "")
		return db[ptype, "contains"]
	} else if (ptype == "string")
	{
		if (itype != "int")
			error("Can't use a "itype" as an index to a string")
		emit(pcode)
		emit(icode)
		emitop("pushi", 1)
		emitop("sys StringMid", "")
		return "string"
	} else
		error("You can't index a "ptype)
}

function do_storenode(ptype, pcode, itype, icode, ecode) {
	if (ptype ~ /^array/)
	{
		if (itype != "int")
			error("Can't use a "itype" as an index to an array")
		emit(ecode)
		emit(pcode)
		emit(icode)
		emitop("seta", "")
		return db[ptype, "contains"]
	} else if (ptype ~ /^dict/)
	{
		if (itype != "string")
			error("Can't use a "itype" as an index to a dictionary")
		emit(ecode)
		emit(pcode)
		emit(icode)
		emitop("setd", "")
		return db[ptype, "contains"]
	} else
		error("You can't index a "ptype)
}

function do_assignment(name, \
pcode, ptype, icode, itype, etype, t, nt) {
	t = inscope(name)
	if (t != "var")
		error("'"name"' is a "t", not a var")
		
	ptype = lookup(name, "type")
	queue()
	if (lookup(ptype, "ntypelong") == "int")
		nt = "i"
	else
		nt = "o"
		
	if (scope(name) == 1)
		emitop("peek" nt, "-" lookup(name, "sp"))
	else
		emitop("peek" nt, lookup(name, "sp"))
	pcode = dequeue()
	itype = "void"
	while (peek() == token_os)
	{
		readtoken()
		queue()
		itype = do_rvalue()
		icode = dequeue()
		ensuretoken(readtoken(), token_cs)
		if (peek() == token_os)
		{
			queue()
			ptype = do_lookupnode(ptype, pcode, itype, icode)
			pcode = dequeue()
		}
	}

	ensuretoken(readtoken(), token_becomes)
	
	if (itype == "void")
	{
		if (lookup(ptype, "ntypelong") == "int")
			nt = "i"
		else
			nt = "o"
		
		etype = do_rvalue()
		if (scope(name) == 1)
			emitop("poke" nt, " -" lookup(name, "sp"))
		else
			emitop("poke" nt, lookup(name, "sp"))
		if (etype != ptype)
			error("You can't assign a "etype" value to a "ptype" variable")
	}
	else
	{
		queue()
		etype = do_rvalue()
		if (etype != lookup(ptype, "contains"))
			error("You can't assign a "etype" value to a "ptype" variable")
		do_storenode(ptype, pcode, itype, icode, dequeue())
	}
}

function do_delete( \
name, pcode, ptype, icode, type)
{
	ensuretoken(readtoken(), token_word);
	name = tokens;
	
	t = inscope(name)
	if (t != "var")
		error("'"name"' is a "t", not a var")
		
	ptype = lookup(name, "type")
	pcode = "m." var(name) lookup(ptype, "ntype")
	itype = "void"
	while (peek() == token_os)
	{
		readtoken()
		queue()
		itype = do_rvalue()
		icode = dequeue()
		ensuretoken(readtoken(), token_cs)
		if (peek() == token_os)
		{
			queue()
			ptype = do_lookupnode(ptype, pcode, itype, icode)
			pcode = dequeue()
		}
	}

	if ((ptype ~ /^dict/) || (ptype ~ /^array/))
		emit("clear." db[ptype, "ntypelong"] "(" pcode ")\n")
	else
		error("Can't delete elements yet")
	
	ensureeos()
}

function do_setsize( \
s, t){
	ensuretoken(readtoken(), token_op)
	t = do_rvalue()
	if (t !~ /^array/)
		error("Can't use size() on something that's not an array")
	ensuretoken(readtoken(), token_cp)
	ensuretoken(readtoken(), token_becomes)
	queue()
	t = do_rvalue()
	s = dequeue()
	if (t != "int")
		error("An array or dictionary size must be an integer")
	emit(s)
	emitop("resize", "")
}

function do_return( \
t) {
	if (functype != "void")
	{
#		emit("m.")
#		emit(var(funcname))
#		emit(db[functype, "ntype"])
#		emit(" = ")
		t = do_rvalue()
		if (t != functype)
			error("you tried to return a " t " from a function returning a " functype)
#		emit("\n")
		if (db[functype, "ntypelong"] == "int")
			emitop("savei", "")
		else
			emitop("saveo", "")
	}
	emitop("jump", "_return_" funcname)
}

function do_for( \
b, t, ccode, mcode, tag1, tag2) {
	ensuretoken(readtoken(), token_op)

	ensuretoken(readtoken(), token_word)
	do_assignment(tokens)
	ensureeos()
	
	queue()
	do_rvalue()
	ccode = dequeue()
	ensureeos()
	
	queue()
	ensuretoken(readtoken(), token_word)
	do_assignment(tokens)
	mcode = dequeue()
	
	ensuretoken(readtoken(), token_cp)

	tag1 = mktag();
	tag2 = mktag();
	emit_tag(tag1);
	
	emit(ccode)
	emitop("bne", "_"tag2)
	
	b = brkcmd
	queue()
	emitop("jump", "_"tag2)
	brkcmd = dequeue()
	do_funclevel()
	brkcmd = b

	emit(mcode "\n")
	
	emitop("jump", "_"tag1)
	emit_tag(tag2)
}

function do_do( \
b, tag1, tag2) {
	tag1 = mktag()
	tag2 = mktag()
	emit_tag(tag1)
	b = brkcmd
	brkcmd = "\tjump _" tag2
	do_funclevel()
	brkcmd = b
	ensuretoken(readtoken(), token_word)
	if (tokens != "while")
		error("do {} must be matched with a while")
	if (do_rvalue() != "int")
		error("Argument to while() must be a int");
	emitop("beq", "_" tag1);
	emit_tag(tag2)
	ensureeos()
}

function do_while( \
b, tag1, tag2) {
	tag1 = mktag()
	tag2 = mktag()
	
	emit_tag(tag1)
	if (do_rvalue() != "int")
		error("while() can only take ints as condition code")
	emitop("bne", "_" tag2)
	
	b = brkcmd
	brkcmd = "\tjump _" tag2
	do_funclevel()
	brkcmd = b
	
	emitop("jump", "_"tag1)
	emit_tag(tag2)
}

function do_break() {
	if (brkcmd == "")
		error("Found `break', but there's nothing to break out of");
	
	emit(brkcmd)
	emit("\n")
	ensureeos()
}

function do_create( \
t) {
	ensuretoken(readtoken(), token_op)
	readtype()
	t = tokens
	if (t == "int")
		emitop("pushi", 0)
	else
		emitop("pusho", db[t, "ntypelong"])
	ensuretoken(readtoken(), token_cp)
	return t
}

function do_list( \
t) {
	ensuretoken(readtoken(), token_op)
	t = do_rvalue()
	ensuretoken(readtoken(), token_cp)
	if (t !~ /^dict/)
		error("Can't use list() on something that's not a dictionary")
	emitop("sys", "DictToArray")
	
	return "array string"
}
		
# --- Main program -----------------------------------------------------------

BEGIN {
	infile = ARGV[1]
	ARGV[1] = ""
	print "Processing: " infile > stderr
	print "pass 1" > stderr
	linenum = 0
	do_pass1()
	close(infile)
	line=""
	linenum = 0
	print "pass 2" > stderr
	do_pass2()
	emitop("pushfp", "")
	emitop("call", "main")
	emitop("halt", "")
	emitop("end", "")
}
