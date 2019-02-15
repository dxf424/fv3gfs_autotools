# This is the configure script for FV3GFS.

# Ed Hartnett

# Running autoconf on this file will trigger a warning if
# autoconf is not at least the specified version.
AC_PREREQ([2.59])

# Initialize with name, version, and support email address.
AC_INIT([FV3GFS], [0.1.0], [Edward.Hartnett@noaa.gov])

# Keep libtool macros in an m4 directory.
AC_CONFIG_MACRO_DIR([m4])

# Find out about the host we're building on.
AC_CANONICAL_HOST

# Find out about the target we're building for.
AC_CANONICAL_TARGET

# This call is required by automake.
AM_INIT_AUTOMAKE([foreign dist-zip subdir-objects])

# Find the C compiler.
AC_MSG_NOTICE([finding C compiler])

AC_PROG_CC
AM_PROG_CC_C_O
AC_C_CONST

# Find fortran compiler. If FC isn't set after AC_PROG_FC, we couldn't
# find a fortran compiler. If the user requested the fortran API, and
# has told us not to recover from a missing compiler, then bail out
# right here.
AC_MSG_NOTICE([finding Fortran compiler])
AC_PROG_FC
AC_PROG_F77($FC)

# If we couldn't find an F90 compiler, deal with it.
if test "${FC+set}" = set && test "x$FC" = x; then
   AC_MSG_FAILURE([Can't find F90 compiler.])
fi


AC_MSG_NOTICE([finding other utilities])

# Find the install program.
AC_PROG_INSTALL

AC_MSG_NOTICE([trying to set fortran flags for this platform])
AC_MSG_CHECKING([what FC is set to])
AC_MSG_RESULT([$FC])

# Check to see if any macros must be set to enable large (>2GB) files.
AC_SYS_LARGEFILE

AC_MSG_NOTICE([checking types, headers, and functions])

# We must check for all these, because they may be used by the netCDF
# C library.
dnl AC_CHECK_LIB([m], [floor], [], [])
dnl AC_CHECK_LIB([curl], [curl_easy_setopt], [], [])
dnl AC_SEARCH_LIBS([deflate], [zlibwapi zlibstat zlib zlib1 z], [], [])
dnl AC_SEARCH_LIBS([SZ_Compress], [szip sz], [], [])
dnl AC_SEARCH_LIBS([dlopen], [dl dld], [], [])
dnl AC_SEARCH_LIBS([H5Fflush], [hdf5dll hdf5], [], [])
dnl AC_SEARCH_LIBS([H5DSis_scale], [hdf5_hldll hdf5_hl], [], [])

# Find the netCDF header and library.
dnl AC_CHECK_HEADERS([netcdf.h], [], [AC_MSG_ERROR([netcdf.h could not be found. Please set CPPFLAGS.])])
dnl AC_SEARCH_LIBS([nc_open], [netcdf], [], [AC_MSG_ERROR([Could not link to netcdf C library. Please set LDFLAGS.])])

dnl # See if various functions are available
dnl AC_CHECK_FUNCS([nc_def_opaque nccreate nc_set_log_level oc_open])

dnl AM_CONDITIONAL([USE_NETCDF4], [test "x$nc_build_v4" = xyes])
dnl AM_CONDITIONAL([BUILD_V2], [test "x$nc_build_v2" = xyes])
dnl AM_CONDITIONAL([USE_LOGGING], [test "x$nc_has_logging" = xyes])
dnl AM_CONDITIONAL([BUILD_DAP], [test "x$nc_has_dap" = xyes])
dnl AM_CONDITIONAL([BUILD_PNETCDF], [test "x$nc_has_pnetcdf" = xyes])
dnl AM_CONDITIONAL([BUILD_PARALLEL4], [test "x$nc_has_parallel4" = xyes])
dnl AM_CONDITIONAL([BUILD_PARALLEL], [test "x$nc_has_pnetcdf" = xyes -o "x$nc_has_parallel4" = xyes])
dnl AM_CONDITIONAL([TEST_FILTERS], [test "x$enable_filter_test" = xyes])

dnl AC_CHECK_HEADER(stdlib.h, ,AC_DEFINE([NO_STDLIB_H], [], [no stdlib.h]))
dnl AC_CHECK_HEADER(sys/types.h, ,AC_DEFINE([NO_SYS_TYPES_H], [], [no sys_types.h]))
dnl AC_CHECK_HEADERS([sys/param.h])
dnl AC_CHECK_HEADERS([locale.h stdio.h stdarg.h errno.h ctype.h fcntl.h malloc.h stdlib.h string.h \
dnl 			   strings.h unistd.h sys/stat.h getopt.h sys/time.h sys/resource.h])
dnl AC_HEADER_DIRENT
dnl AC_HEADER_STDC
dnl AC_HEADER_SYS_WAIT
dnl AC_HEADER_TIME

dnl AC_FUNC_VPRINTF

dnl # Check for <stdbool.h> that conforms to C99 requirements
dnl AC_HEADER_STDBOOL

dnl # Check for these functions...
dnl AC_FUNC_ALLOCA
dnl AC_TYPE_SIZE_T
dnl AC_TYPE_OFF_T
dnl AC_CHECK_TYPES([ssize_t, ptrdiff_t, uchar, longlong])
dnl AC_C_CHAR_UNSIGNED
dnl AC_CHECK_SIZEOF(short)
dnl AC_CHECK_SIZEOF(int)
dnl AC_CHECK_SIZEOF(long)
dnl AC_CHECK_SIZEOF(float)
dnl AC_CHECK_SIZEOF(double)
dnl AC_CHECK_SIZEOF(off_t)
dnl AC_CHECK_SIZEOF(size_t)
dnl AC_CHECK_SIZEOF(ptrdiff_t)
dnl AC_COMPUTE_INT([longlong_is_long],[sizeof(long long) == sizeof(long)],[],[longlong_is_long=0])
dnl if test $longlong_is_long = 1; then
dnl    CFLAGS="$CFLAGS -DLONGLONG_IS_LONG"
dnl fi

dnl # Automake conditionals need to be called, whether the answer is yes
dnl # or no.
dnl AM_CONDITIONAL(TEST_PARALLEL, [test "x$enable_parallel_tests" = xyes])

AC_MSG_NOTICE([generating header files and makefiles])

# We will output a fortran inc file, nfconfig.inc.
#AC_CONFIG_HEADERS([config.h])
AC_CONFIG_FILES([Makefile])

AC_OUTPUT()
