#!/usr/bin/env bash

# Function to display help
usage ()
{
  echo "Script used to easily create collection of libraries needed"
  echo "to generate a Free Pascal IDE with debugger support."
  echo "Usage: Copy this script to the directory where you just compile"
  echo "a specific GNU debugger (for a specific target)"
  echo "and run ./$0 in that directory"
  echo "After, you will need to run a second script, copy-libs.sh"
  echo "with a single parameter specifying to which directory the libraries"
  echo "should be copied."
  echo "Possible parameters for this script:"
  echo "--forcestatic, to convert all -lname into $LINKLIB libname.a"
  echo "implicitlibs=\"space separated list of used system libraries\""
  echo "libdir=\"space separated list of library directories\""
}

# Try to find GNU make and GNU awk
MAKE=`which gmake 2> /dev/null`
AWK=`which gawk 2> /dev/null`
# Assume make is OK if gmake is not found
if [ "${MAKE}" == "" ]; then
  MAKE=make
fi
# Assume awk is OK if gawk is not found
if [ "${AWK}" == "" ]; then
  AWK=awk
fi
# Possible extra option to pass when rebuilding gdb executable below
MAKEOPT=

if [ "$1" == "--help" ]; then
  usage
  exit
fi


forcestatic=0

# Function to treat all command line option
handle_option ()
{
opt_handled=0
if [ "$1" == "" ] ; then
  return
fi

if [ "$1" == "--forcestatic" ]; then
  echo "Using only static libraries in gdblib.inc"
  forcestatic=1
  MAKEOPT="LDFLAGS=-static"
  opt_handled=1
fi

if [ "${1#implicitlibs=}" != "$1" ]; then
  implicitlibs=${1#implicitlibs=}
  echo "Also adding implicit libs \"$implicitlibs\""
  opt_handled=1
fi

if [ "${1#libdir=}" != "$1" ]; then
  libdir=${1#libdir=}
  echo "libdir is set to \"$libdir\""
  opt_handled=1
fi
}

# Try to handle all command line options
opt_handled=1
while [ $opt_handled -eq 1 ]
do
  handle_option "$1"
  if [ $opt_handled -eq 1 ] ; then
    shift
  fi
done

if [ "$1" != "" ]; then
  echo "Unrecognized option \"$1\""
  usage
fi

if [ "${PATHEXT}" != "" ]; then
  EXEEXT=.exe
  if [ "${DJDIR}" != "" ]; then
    libdir=${DJDIR}/lib
  else
    libdir=/lib
  fi
else
  EXEEXT=
  if [ "$libdir" == "" ]; then
    libdir=/lib
  fi
fi

if [ "$OSTYPE" == "msys" ]; then
  echo "MSYS system detected"
  in_msys=1
else
  in_msys=0
fi

echo "Deleting gdb${EXEEXT} to force recompile"
rm -f gdb${EXEEXT}
echo "Rebuilding gdb${EXEEXT}"

${MAKE} gdb${EXEEXT} ${MAKEOPT} | tee make.log

# libgdb.a will not be built automatically anymore after
# GDB release 7.4, so we need to explicitly make it.
echo "Rebuilding GDB library if needed"
${MAKE} libgdb.a ${MAKEOPT}

# version.c is an automatically generated file from gdb/version.in
# We extract GDB version from that file.
gdb_full_version=`sed -n "s:.*version.*\"\(.*\)\".*:\1:p" version.c`
gdbcvs=`sed -n "s:.*version.*\"\(.*\)cvs\(.*\)\".*:\1cvs\2:p" version.c`
gdb_version1=`sed -n "s:.*version.*\"\([0-9]*\)\.\([0-9]*\).*:\1:p" version.c`
gdb_version2=`sed -n "s:.*version.*\"\([0-9]*\)\.\([0-9]*\).*:\2:p" version.c`
gdb_version=`sed -n "s:.*version.*\"\([0-9]*\)\.\([0-9]*\).*:\1.\2:p" version.c`

echo found full version is ${gdb_full_version}
echo found version is ${gdb_version}
if [ ${gdb_version2} -lt 10 ]; then
  gdbversion=${gdb_version1}0${gdb_version2}
else
  gdbversion=${gdb_version1}${gdb_version2}
fi

cat make.log | ${AWK} '
BEGIN {
doprint=0
}
# We look for the compilation line
# either gcc or cc
/cc / { doprint=1; }

{
if ( doprint == 1 ) {
  print $0
}
}

! /\\$/ { doprint=0; }
' | tee comp-cmd.log

gcccompiler=`sed -n "s:\([A-Za-z0-9_-]*gcc\) .*:\1:p" comp-cmd.log`
if [ "$gcccompiler" != "" ]; then
  gcclibs=`$gcccompiler -print-search-dirs | sed -n "s#.*libraries: =\(.*\)#\1#p" `
  if [ "$gcclibs" != "" ]; then
    if [ $in_msys -eq 1 ]; then
      # If we are on msys, gcc is mingw, so that it uses c:/dir
      # while find is an msys utility that needs /c/dir path
      # we do this conversion below
      for let in a b c d e f g h i j k l m n o p q r s t u v w x y z; do
        gcclibs=${gcclibs//$let:/\/$let}
      done
      for let in A B C D E F G H I J K L M N O P Q R S T U V W X Y Z; do
        gcclibs=${gcclibs//$let:/\/$let}
      done
      libdir="$libdir ${gcclibs//;/ }"
    else
      # if ; is present in gcclibs,assume this is the separator instead of :
      if [ "${gcclibs//;/ }" != "${gcclibs}" ]; then
	if [ "${gcclibs// /_}" != "${gccclibs}" ]; then
          # list also contains spaces, convert ' ' into '\ '
          gcclibs=${gcclibs// /\\ }
        fi
        libdir="$libdir ${gcclibs//;/ }"
      else
        libdir="$libdir ${gcclibs//:/ }"
      fi
    fi
    echo "gcc libs are \"$libdir\""
  fi
fi

# Try to locate all libraries
echo Creating ./copy-libs.sh script
cat comp-cmd.log | ${AWK} -v libdir="${libdir}" -v implibs="${implicitlibs}" '
BEGIN {
  print "#!/usr/bin/env bash"
  print "# copy-libs.sh generated by awk script"
  print "INSTALL=`which ginstall 2> /dev/null `"
  print "if [ "$INSTALL" == "" ]; then"
  print "  INSTALL=install"
  print "fi"
  print "if [ \"$1\" != \"\" ]; then"
  print "  destdir=$1"
  print "  $INSTALL  -d ${destdir}"
  print "else"
  print "  echo $0 destdir"
  print "  echo destdir should be the location where libgdb.a"
  print "  echo and all other archives should be copied"
  print "  exit"
  print "fi"
  print "# Copy gdblib.inc file"
  print "cp -p gdblib.inc ${destdir}"
}

{
  nb = split ($0,list);

  for (i=1; i<=nb; i++) {
    if ( list[i] ~ /lib[^ ]*\.a/ ) {
      print "# Looking for static libs"
      staticlib = gensub (/([^ ]*)(lib[^ ]*\.a)/,"\\1\\2 ","g",list[i]);
      print "cp -p " staticlib " ${destdir}";
    }
    if ( list[i] ~ /lib[^ ]*\.so/ ) {
      dynamiclib = gensub (/([^ ]*)(lib[^ ]*\.so)/,"\\1\\2 ","g",list[i]);
      print "echo " dynamiclib " found";
    }
    if ( list[i] ~ /^-l/ ) {
      print "#Looking for shared libs"
      systemlib = gensub (/-l([^ ]*)/,"lib\\1.a ","g",list[i]);
      print "systemlib=`find " libdir " -iname " systemlib " -print 2> /dev/null `" ;
      print "if [ \"${systemlib}\" != \"\" ]; then";
      print "  echo System lib found: ${systemlib%%[$IFS]*}";
      print "  cp -p ${systemlib%%[$IFS]*} ${destdir}";
      print "else";
      print "  echo Library " systemlib " not found, shared library assumed";
      print "fi";
  }
  }
}
END {
  nb = split (implibs,list);
  for (i=1;i<=nb; i++) {
    systemlib = "lib" list[i] ".a";
    print "echo Adding system library " systemlib;
    print "systemlib=`find " libdir " -iname " systemlib " -print 2> /dev/null `" ;
    print "if [ \"${systemlib}\" != \"\" ]; then";
    print "  echo System lib found: ${systemlib%%[$IFS]*}";
    print "  cp -p ${systemlib%%[$IFS]*} ${destdir}";
    print "else";
    print "  echo Library " systemlib " not found, shared library assumed";
    print "fi";
  }
}
' | tee copy-libs.sh
chmod u+x ./copy-libs.sh
# For later

echo Creating ./gdblib.inc file
# Generate gdblib.inc file
cat comp-cmd.log |${AWK} -v gdbcvs=${gdbcvs} -v implibs="${implicitlibs}" \
  -v gdbversion=${gdbversion} -v forcestatic=${forcestatic} '
BEGIN {
  use_mingw=0;
  print "{ libgdb.inc file generated by awk script }"
  print "{$define GDB_V" gdbversion " }"
  if (gdbcvs) {
    print "{$define GDB_CVS}"
  }
  print "{$ifdef COMPILING_GDBINT_UNIT }"
}

{
  nb = split ($0,list);

  for (i=1; i<=nb; i++) {
  if ( list[i] ~ /lib[^ ]*\.a/ ) {
    staticlib = gensub (/([^ ]*)(lib[^ ]*\.a)/,"{$LINKLIB \\2} { found in \\1 }","g",list[i]);
    print staticlib;
    if ( list[i] ~/mingw/ ) {
    use_mingw=1
    }
  }
  if ( list[i] ~ /-D__USE_MINGW_/ ) {
    use_mingw=1
  }
  if ( list[i] ~ /lib[^ ]*\.so/ ) {
    dynamiclib = gensub (/([^ ]*)(lib[^ ]*\.so)/,"{$LINKLIB \\2} { found in \\1 }","g",list[i]);
    librarypath = gensub (/([^ ]*)(lib[^ ]*\.so)/,"{$LIBRARYPATH \\1} { for \\2 }","g",list[i]);
    print dynamiclib;
    print librarypath;
  }
  if ( list[i] ~ /-l/ ) {
    systemlib = gensub (/-l([^ ]*)/,"\\1","g",list[i]);
    if (forcestatic == 1) {
      systemlib="lib" systemlib ".a"
    }
    print "{$LINKLIB " systemlib "} { with -l gcc option}";
  }
  }
}
END {
  nb = split (implibs,list);
  for (i=1;i<=nb; i++) {
    if ( list[i] ~ /lib.*\.a/ ) {
      lib=list[i];
    } else {
      if ( forcestatic == 1 ) {
        lib="lib" list[i] ".a";
      } else {
        lib=list[i];
      }
    }
    print "{$LINKLIB " lib "} { implicit library } "
  }
  print "{$endif COMPILING_GDBINT_UNIT }"
  print "{$undef NotImplemented}"
  if ( use_mingw == 1 ) {
    print "{$define USE_MINGW_GDB}"
  }
}
' | tee  gdblib.inc


