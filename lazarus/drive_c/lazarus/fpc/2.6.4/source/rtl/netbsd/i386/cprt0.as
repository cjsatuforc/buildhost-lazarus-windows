#
#   This file is part of the Free Pascal run time library.
#   Copyright (c) 1999-2000 by Marco van de Voort, Michael Van Canneyt
#                                                  and Peter Vreman
#   members of the Free Pascal development team.
#
#   See the file COPYING.FPC, included in this distribution,
#   for details about the copyright.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY;without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#**********************************************************************}
#
# NetBSD standard (shared) ELF/i386 startup code for Free Pascal
# New recompiled version from release 5.1 sources

	.file	"crt0.c"
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.text
.Ltext0:
.globl __progname
	.section	.rodata
.LC0:
	.string	""
	.section	.data.rel.local,"aw",@progbits
	.align 4
	.type	__progname, @object
	.size	__progname, 4
__progname:
	.long	.LC0
.globl __ps_strings
	.bss
	.align 4
	.type	__ps_strings, @object
	.size	__ps_strings, 4
__ps_strings:
	.zero	4
#APP
		.text				
	.align	4			
	.globl	__start			
	.globl	_start			
_start:				
__start:				
	pushl	%ebx			# ps_strings	
	pushl	%ecx			# obj		
	pushl	%edx			# cleanup	
	movl	12(%esp),%eax		
	leal	20(%esp,%eax,4),%ecx	
	leal	16(%esp),%edx		
	pushl	%ecx			
	pushl	%edx			
	pushl	%eax			
	movl	%ecx,operatingsystem_parameter_envp
	movl	%eax,operatingsystem_parameter_argc
	movl	%edx,operatingsystem_parameter_argv
	call	___start
#NO_APP
	.text
.globl ___start
	.type	___start, @function
___start:
.LFB17:
	.file 1 "/usr/src/usr/src/lib/csu/i386_elf/crt0.c"
	.loc 1 68 0
	pushl	%ebp
.LCFI0:
	movl	%esp, %ebp
.LCFI1:
	pushl	%ebx
.LCFI2:
	subl	$4, %esp
.LCFI3:
	call	.L11
.L11:
	popl	%ebx
	addl	$_GLOBAL_OFFSET_TABLE_+[.-.L11], %ebx
	.loc 1 69 0
	movl	environ@GOT(%ebx), %edx
	movl	16(%ebp), %eax
	movl	%eax, (%edx)
	.loc 1 71 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	__progname@GOT(%ebx), %eax
	movl	%edx, (%eax)
	movl	__progname@GOT(%ebx), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	.L2
	.loc 1 72 0
	movl	__progname@GOT(%ebx), %eax
	movl	(%eax), %eax
	subl	$8, %esp
	pushl	$47
	pushl	%eax
.LCFI4:
	call	_strrchr
	addl	$16, %esp
	movl	%eax, %edx
	movl	__progname@GOT(%ebx), %eax
	movl	%edx, (%eax)
	movl	__progname@GOT(%ebx), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	.L4
	.loc 1 73 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	__progname@GOT(%ebx), %eax
	movl	%edx, (%eax)
	jmp	.L2
.L4:
	.loc 1 75 0
	movl	__progname@GOT(%ebx), %eax
	movl	(%eax), %eax
	leal	1(%eax), %edx
	movl	__progname@GOT(%ebx), %eax
	movl	%edx, (%eax)
.L2:
	.loc 1 78 0
	cmpl	$0, 28(%ebp)
	je	.L6
	.loc 1 79 0
	movl	__ps_strings@GOT(%ebx), %edx
	movl	28(%ebp), %eax
	movl	%eax, (%edx)
.L6:
	.loc 1 82 0
	movl	_DYNAMIC@GOT(%ebx), %eax
	testl	%eax, %eax
	je	.L8
	.loc 1 83 0
	subl	$8, %esp
	pushl	24(%ebp)
	pushl	20(%ebp)
	call	_rtld_setup@PLT
	addl	$16, %esp
.L8:
	.loc 1 88 0
	subl	$12, %esp
	movl	_mcleanup@GOT(%ebx), %eax
	pushl	%eax
	call	atexit@PLT
	addl	$16, %esp
	.loc 1 89 0
	movl	_etext@GOT(%ebx), %eax
	movl	%eax, %edx
	movl	_eprol@GOT(%ebx), %eax
	subl	$8, %esp
	pushl	%edx
	pushl	%eax
	call	monstartup@PLT
	addl	$16, %esp
	.loc 1 92 0
	subl	$12, %esp
	movl	_fini@GOT(%ebx), %eax
	pushl	%eax
	call	atexit@PLT
	addl	$16, %esp
	.loc 1 93 0
.LCFI5:
	call	_init@PLT
	.loc 1 95 0
	movl	environ@GOT(%ebx), %eax
	movl	(%eax), %eax
	subl	$4, %esp
	pushl	%eax
	pushl	12(%ebp)
	pushl	8(%ebp)
.LCFI6:
	call	main@PLT
	addl	$16, %esp
	subl	$12, %esp
	pushl	%eax
	call	exit@PLT
.LFE17:
	.size	___start, .-___start
#APP
	.pushsection .ident
.asciz "$NetBSD: crt0.c,v 1.17 2007/12/01 10:16:06 yamt Exp $"
.popsection
#NO_APP
	.type	_strrchr, @function
_strrchr:
.LFB18:
	.file 2 "/usr/src/usr/src/lib/csu/i386_elf/../common_elf/common.c"
	.loc 2 43 0
	pushl	%ebp
.LCFI7:
	movl	%esp, %ebp
.LCFI8:
	subl	$20, %esp
.LCFI9:
	.loc 2 46 0
	movl	$0, -4(%ebp)
.L13:
	.loc 2 47 0
	movl	8(%ebp), %eax
	movb	(%eax), %al
	movsbl	%al,%eax
	cmpl	12(%ebp), %eax
	jne	.L14
	.loc 2 48 0
	movl	8(%ebp), %eax
	movl	%eax, -4(%ebp)
.L14:
	.loc 2 49 0
	movl	8(%ebp), %eax
	movb	(%eax), %al
	testb	%al, %al
	jne	.L16
	.loc 2 50 0
	movl	-4(%ebp), %eax
	movl	%eax, -20(%ebp)
	jmp	.L12
.L16:
	.loc 2 46 0
	incl	8(%ebp)
	.loc 2 51 0
	jmp	.L13
.L12:
	.loc 2 53 0
	movl	-20(%ebp), %eax
	leave
	ret
.LFE18:
	.size	_strrchr, .-_strrchr
#APP
	  .text
	_eprol:
	.section	.rodata
	.align 4
.LC1:
	.string	"Corrupt Obj_Entry pointer in GOT\n"
	.align 4
.LC2:
	.string	"Dynamic linker version mismatch\n"
#NO_APP
	.text
.globl _rtld_setup
	.type	_rtld_setup, @function
_rtld_setup:
.LFB19:
	.loc 2 67 0
	pushl	%ebp
.LCFI10:
	movl	%esp, %ebp
.LCFI11:
	pushl	%ebx
.LCFI12:
	subl	$4, %esp
.LCFI13:
	call	.L26
.L26:
	popl	%ebx
	addl	$_GLOBAL_OFFSET_TABLE_+[.-.L26], %ebx
	.loc 2 69 0
	cmpl	$0, 12(%ebp)
	je	.L20
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$-716130182, %eax
	je	.L22
.L20:
	.loc 2 70 0
	subl	$12, %esp
	pushl	$33
	leal	.LC1@GOTOFF(%ebx), %eax
	pushl	%eax
	pushl	$2
	pushl	$0
	pushl	$4
.LCFI14:
	call	__syscall@PLT
	addl	$32, %esp
	subl	$4, %esp
	pushl	$1
	pushl	$0
	pushl	$1
.LCFI15:
	call	__syscall@PLT
	addl	$16, %esp
.L22:
	.loc 2 71 0
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	$1, %eax
	je	.L23
	.loc 2 72 0
	subl	$12, %esp
	pushl	$32
	leal	.LC2@GOTOFF(%ebx), %eax
	pushl	%eax
	pushl	$2
	pushl	$0
	pushl	$4
.LCFI16:
	call	__syscall@PLT
	addl	$32, %esp
	subl	$4, %esp
	pushl	$1
	pushl	$0
	pushl	$1
.LCFI17:
	call	__syscall@PLT
	addl	$16, %esp
.L23:
	.loc 2 74 0
	subl	$12, %esp
	pushl	8(%ebp)
	call	atexit@PLT
	addl	$16, %esp
	.loc 2 75 0
	movl	-4(%ebp), %ebx
	leave
	ret
.LFE19:
	.size	_rtld_setup, .-_rtld_setup
	.comm	environ,4,4
        .comm operatingsystem_parameter_envp,4,4
        .comm operatingsystem_parameter_argc,4,4
        .comm operatingsystem_parameter_argv,4,4
	.weak	_DYNAMIC
# This section is needed for NetBSD to recognize a NetBSD binary as such.
# otherwise it will be startup in Linux emulation mode.

.section ".note.netbsd.ident","a"
.p2align 2

.long 7
.long 4
# ELF NOTE TYPE NETBSD TAG
.long 1
.ascii "NetBSD\0\0"
.long 199905
	.section	.debug_frame,"",@progbits
.Lframe0:
	.long	.LECIE0-.LSCIE0
.LSCIE0:
	.long	0xffffffff
	.byte	0x1
	.string	""
	.uleb128 0x1
	.sleb128 -4
	.byte	0x8
	.byte	0xc
	.uleb128 0x4
	.uleb128 0x4
	.byte	0x88
	.uleb128 0x1
	.align 4
.LECIE0:
.LSFDE0:
	.long	.LEFDE0-.LASFDE0
.LASFDE0:
	.long	.Lframe0
	.long	.LFB17
	.long	.LFE17-.LFB17
	.byte	0x4
	.long	.LCFI0-.LFB17
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI1-.LCFI0
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	.LCFI3-.LCFI1
	.byte	0x83
	.uleb128 0x3
	.byte	0x4
	.long	.LCFI4-.LCFI3
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI5-.LCFI4
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI6-.LCFI5
	.byte	0x2e
	.uleb128 0x10
	.align 4
.LEFDE0:
.LSFDE2:
	.long	.LEFDE2-.LASFDE2
.LASFDE2:
	.long	.Lframe0
	.long	.LFB18
	.long	.LFE18-.LFB18
	.byte	0x4
	.long	.LCFI7-.LFB18
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI8-.LCFI7
	.byte	0xd
	.uleb128 0x5
	.align 4
.LEFDE2:
.LSFDE4:
	.long	.LEFDE4-.LASFDE4
.LASFDE4:
	.long	.Lframe0
	.long	.LFB19
	.long	.LFE19-.LFB19
	.byte	0x4
	.long	.LCFI10-.LFB19
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI11-.LCFI10
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	.LCFI13-.LCFI11
	.byte	0x83
	.uleb128 0x3
	.byte	0x4
	.long	.LCFI14-.LCFI13
	.byte	0x2e
	.uleb128 0x20
	.byte	0x4
	.long	.LCFI15-.LCFI14
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	.LCFI16-.LCFI15
	.byte	0x2e
	.uleb128 0x20
	.byte	0x4
	.long	.LCFI17-.LCFI16
	.byte	0x2e
	.uleb128 0x10
	.align 4
.LEFDE4:
	.file 3 "/usr/src/usr/src/libexec/ld.elf_so/rtld.h"
	.file 4 "/usr/src/usr/src/obj/destdir.i386/usr/include/sys/exec_elf.h"
	.file 5 "/usr/src/usr/src/obj/destdir.i386/usr/include/machine/int_types.h"
	.file 6 "/usr/src/usr/src/obj/destdir.i386/usr/include/sys/ansi.h"
	.file 7 "/usr/src/usr/src/obj/destdir.i386/usr/include/sys/types.h"
	.file 8 "/usr/src/usr/src/obj/destdir.i386/usr/include/dlfcn.h"
	.file 9 "/usr/src/usr/src/obj/destdir.i386/usr/include/link_elf.h"
	.file 10 "/usr/src/usr/src/obj/destdir.i386/usr/include/sys/exec.h"
	.file 11 "/usr/src/usr/src/lib/csu/i386_elf/../common_elf/common.h"
	.text
.Letext0:
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LFB17-.Ltext0
	.long	.LCFI0-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI0-.Ltext0
	.long	.LCFI1-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI1-.Ltext0
	.long	.LFE17-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST1:
	.long	.LFB18-.Ltext0
	.long	.LCFI7-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI7-.Ltext0
	.long	.LCFI8-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI8-.Ltext0
	.long	.LFE18-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST2:
	.long	.LFB19-.Ltext0
	.long	.LCFI10-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI10-.Ltext0
	.long	.LCFI11-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI11-.Ltext0
	.long	.LFE19-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0x0
	.long	0x0
	.section	.debug_info
	.long	0xe3b
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.Ldebug_line0
	.long	.Letext0
	.long	.Ltext0
	.string	"GNU C 4.1.3 20080704 (prerelease) (NetBSD nb2 20081120)"
	.byte	0x1
	.string	"/usr/src/usr/src/lib/csu/i386_elf/crt0.c"
	.uleb128 0x2
	.string	"signed char"
	.byte	0x1
	.byte	0x6
	.uleb128 0x3
	.string	"__uint8_t"
	.byte	0x5
	.byte	0x2e
	.long	0x9a
	.uleb128 0x2
	.string	"unsigned char"
	.byte	0x1
	.byte	0x8
	.uleb128 0x2
	.string	"short int"
	.byte	0x2
	.byte	0x5
	.uleb128 0x3
	.string	"__uint16_t"
	.byte	0x5
	.byte	0x30
	.long	0xca
	.uleb128 0x2
	.string	"short unsigned int"
	.byte	0x2
	.byte	0x7
	.uleb128 0x3
	.string	"__int32_t"
	.byte	0x5
	.byte	0x31
	.long	0xf1
	.uleb128 0x2
	.string	"int"
	.byte	0x4
	.byte	0x5
	.uleb128 0x3
	.string	"__uint32_t"
	.byte	0x5
	.byte	0x32
	.long	0x10a
	.uleb128 0x4
	.long	.LASF0
	.byte	0x4
	.byte	0x7
	.uleb128 0x2
	.string	"long long int"
	.byte	0x8
	.byte	0x5
	.uleb128 0x3
	.string	"__uint64_t"
	.byte	0x5
	.byte	0x3a
	.long	0x134
	.uleb128 0x2
	.string	"long long unsigned int"
	.byte	0x8
	.byte	0x7
	.uleb128 0x2
	.string	"long unsigned int"
	.byte	0x4
	.byte	0x7
	.uleb128 0x4
	.long	.LASF0
	.byte	0x4
	.byte	0x7
	.uleb128 0x2
	.string	"char"
	.byte	0x1
	.byte	0x6
	.uleb128 0x3
	.string	"__caddr_t"
	.byte	0x6
	.byte	0x25
	.long	0x183
	.uleb128 0x5
	.byte	0x4
	.long	0x16a
	.uleb128 0x3
	.string	"u_int32_t"
	.byte	0x7
	.byte	0x5f
	.long	0xf8
	.uleb128 0x3
	.string	"dev_t"
	.byte	0x7
	.byte	0x9d
	.long	0xf8
	.uleb128 0x3
	.string	"ino_t"
	.byte	0x7
	.byte	0xa7
	.long	0x122
	.uleb128 0x2
	.string	"long int"
	.byte	0x4
	.byte	0x5
	.uleb128 0x6
	.string	"size_t"
	.byte	0x7
	.value	0x113
	.long	0x10a
	.uleb128 0x7
	.byte	0x4
	.uleb128 0x8
	.long	0x232
	.long	.LASF1
	.byte	0x10
	.byte	0xa
	.byte	0x6c
	.uleb128 0x9
	.string	"ps_argvstr"
	.byte	0xa
	.byte	0x6d
	.long	0x232
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.string	"ps_nargvstr"
	.byte	0xa
	.byte	0x6e
	.long	0xf1
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.string	"ps_envstr"
	.byte	0xa
	.byte	0x6f
	.long	0x232
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.string	"ps_nenvstr"
	.byte	0xa
	.byte	0x70
	.long	0xf1
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.long	0x183
	.uleb128 0x5
	.byte	0x4
	.long	0x23e
	.uleb128 0xa
	.long	0x16a
	.uleb128 0x5
	.byte	0x4
	.long	0x1d1
	.uleb128 0xb
	.long	0x2ab
	.string	"_dl_info"
	.byte	0x10
	.byte	0x8
	.byte	0x27
	.uleb128 0x9
	.string	"dli_fname"
	.byte	0x8
	.byte	0x28
	.long	0x238
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.string	"dli_fbase"
	.byte	0x8
	.byte	0x29
	.long	0x1cf
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.string	"dli_sname"
	.byte	0x8
	.byte	0x2a
	.long	0x238
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.string	"dli_saddr"
	.byte	0x8
	.byte	0x2b
	.long	0x2ab
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.long	0x2b1
	.uleb128 0xc
	.uleb128 0x3
	.string	"Dl_info"
	.byte	0x8
	.byte	0x2c
	.long	0x249
	.uleb128 0x3
	.string	"Elf_Byte"
	.byte	0x4
	.byte	0x3f
	.long	0x89
	.uleb128 0x3
	.string	"Elf32_Addr"
	.byte	0x4
	.byte	0x41
	.long	0xf8
	.uleb128 0x3
	.string	"Elf32_Off"
	.byte	0x4
	.byte	0x43
	.long	0xf8
	.uleb128 0x3
	.string	"Elf32_Sword"
	.byte	0x4
	.byte	0x45
	.long	0xe0
	.uleb128 0x3
	.string	"Elf32_Word"
	.byte	0x4
	.byte	0x47
	.long	0xf8
	.uleb128 0x3
	.string	"Elf32_Half"
	.byte	0x4
	.byte	0x49
	.long	0xb8
	.uleb128 0xd
	.long	0x3ce
	.byte	0x20
	.byte	0x4
	.value	0x12b
	.uleb128 0xe
	.string	"p_type"
	.byte	0x4
	.value	0x12c
	.long	0x307
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xe
	.string	"p_offset"
	.byte	0x4
	.value	0x12d
	.long	0x2e3
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xe
	.string	"p_vaddr"
	.byte	0x4
	.value	0x12e
	.long	0x2d1
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xe
	.string	"p_paddr"
	.byte	0x4
	.value	0x12f
	.long	0x2d1
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xe
	.string	"p_filesz"
	.byte	0x4
	.value	0x130
	.long	0x307
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xe
	.string	"p_memsz"
	.byte	0x4
	.value	0x131
	.long	0x307
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xe
	.string	"p_flags"
	.byte	0x4
	.value	0x132
	.long	0x307
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xe
	.string	"p_align"
	.byte	0x4
	.value	0x133
	.long	0x307
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0x0
	.uleb128 0x6
	.string	"Elf32_Phdr"
	.byte	0x4
	.value	0x134
	.long	0x32b
	.uleb128 0xd
	.long	0x460
	.byte	0x10
	.byte	0x4
	.value	0x19b
	.uleb128 0xe
	.string	"st_name"
	.byte	0x4
	.value	0x19c
	.long	0x307
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xe
	.string	"st_value"
	.byte	0x4
	.value	0x19d
	.long	0x307
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xe
	.string	"st_size"
	.byte	0x4
	.value	0x19e
	.long	0x307
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xe
	.string	"st_info"
	.byte	0x4
	.value	0x19f
	.long	0x2c1
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xe
	.string	"st_other"
	.byte	0x4
	.value	0x1a0
	.long	0x2c1
	.byte	0x2
	.byte	0x23
	.uleb128 0xd
	.uleb128 0xe
	.string	"st_shndx"
	.byte	0x4
	.value	0x1a1
	.long	0x319
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.byte	0x0
	.uleb128 0x6
	.string	"Elf32_Sym"
	.byte	0x4
	.value	0x1a2
	.long	0x3e1
	.uleb128 0xd
	.long	0x49d
	.byte	0x8
	.byte	0x4
	.value	0x1ee
	.uleb128 0xf
	.long	.LASF2
	.byte	0x4
	.value	0x1ef
	.long	0x307
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xe
	.string	"r_info"
	.byte	0x4
	.value	0x1f0
	.long	0x307
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x6
	.string	"Elf32_Rel"
	.byte	0x4
	.value	0x1f1
	.long	0x472
	.uleb128 0xd
	.long	0x4ee
	.byte	0xc
	.byte	0x4
	.value	0x1f3
	.uleb128 0xf
	.long	.LASF2
	.byte	0x4
	.value	0x1f4
	.long	0x307
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xe
	.string	"r_info"
	.byte	0x4
	.value	0x1f5
	.long	0x307
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xe
	.string	"r_addend"
	.byte	0x4
	.value	0x1f6
	.long	0x2f4
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x6
	.string	"Elf32_Rela"
	.byte	0x4
	.value	0x1f7
	.long	0x4af
	.uleb128 0x10
	.long	0x527
	.byte	0x4
	.byte	0x4
	.value	0x213
	.uleb128 0x11
	.string	"d_ptr"
	.byte	0x4
	.value	0x214
	.long	0x2d1
	.uleb128 0x11
	.string	"d_val"
	.byte	0x4
	.value	0x215
	.long	0x307
	.byte	0x0
	.uleb128 0xd
	.long	0x552
	.byte	0x8
	.byte	0x4
	.value	0x211
	.uleb128 0xe
	.string	"d_tag"
	.byte	0x4
	.value	0x212
	.long	0x307
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xe
	.string	"d_un"
	.byte	0x4
	.value	0x216
	.long	0x501
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x6
	.string	"Elf32_Dyn"
	.byte	0x4
	.value	0x217
	.long	0x527
	.uleb128 0x12
	.long	0x574
	.byte	0x1
	.long	0xf1
	.uleb128 0x13
	.long	0x1cf
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.long	0x564
	.uleb128 0xb
	.long	0x5df
	.string	"link_map"
	.byte	0x14
	.byte	0x9
	.byte	0xe
	.uleb128 0x9
	.string	"l_addr"
	.byte	0x9
	.byte	0xf
	.long	0x172
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.string	"l_name"
	.byte	0x9
	.byte	0x13
	.long	0x238
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.string	"l_ld"
	.byte	0x9
	.byte	0x14
	.long	0x1cf
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.string	"l_next"
	.byte	0x9
	.byte	0x15
	.long	0x5df
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x9
	.string	"l_prev"
	.byte	0x9
	.byte	0x16
	.long	0x5df
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.long	0x57a
	.uleb128 0x14
	.byte	0x1
	.uleb128 0x5
	.byte	0x4
	.long	0x5e5
	.uleb128 0x15
	.long	0x609
	.byte	0x4
	.byte	0x3
	.byte	0x47
	.uleb128 0x9
	.string	"sqe_next"
	.byte	0x3
	.byte	0x47
	.long	0x644
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0xb
	.long	0x644
	.string	"Struct_Objlist_Entry"
	.byte	0x8
	.byte	0x3
	.byte	0x46
	.uleb128 0x9
	.string	"link"
	.byte	0x3
	.byte	0x47
	.long	0x5ed
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.string	"obj"
	.byte	0x3
	.byte	0x48
	.long	0xac2
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.long	0x609
	.uleb128 0xb
	.long	0xac2
	.string	"Struct_Obj_Entry"
	.byte	0xdc
	.byte	0x3
	.byte	0x44
	.uleb128 0x9
	.string	"magic"
	.byte	0x3
	.byte	0x73
	.long	0x307
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.string	"version"
	.byte	0x3
	.byte	0x74
	.long	0x307
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.string	"next"
	.byte	0x3
	.byte	0x76
	.long	0xac2
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.string	"path"
	.byte	0x3
	.byte	0x77
	.long	0x183
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x9
	.string	"refcount"
	.byte	0x3
	.byte	0x78
	.long	0xf1
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x9
	.string	"dl_refcount"
	.byte	0x3
	.byte	0x79
	.long	0xf1
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x9
	.string	"mapbase"
	.byte	0x3
	.byte	0x7c
	.long	0x172
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x9
	.string	"mapsize"
	.byte	0x3
	.byte	0x7d
	.long	0x1c0
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x9
	.string	"textsize"
	.byte	0x3
	.byte	0x7e
	.long	0x1c0
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x9
	.string	"vaddrbase"
	.byte	0x3
	.byte	0x7f
	.long	0x2d1
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x9
	.string	"relocbase"
	.byte	0x3
	.byte	0x80
	.long	0x172
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x9
	.string	"dynamic"
	.byte	0x3
	.byte	0x81
	.long	0xbee
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x9
	.string	"entry"
	.byte	0x3
	.byte	0x82
	.long	0x172
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x9
	.string	"__junk001"
	.byte	0x3
	.byte	0x83
	.long	0xbf4
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x9
	.string	"pathlen"
	.byte	0x3
	.byte	0x84
	.long	0x1c0
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x9
	.string	"pltgot"
	.byte	0x3
	.byte	0x87
	.long	0xbff
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x9
	.string	"rel"
	.byte	0x3
	.byte	0x88
	.long	0xc05
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x9
	.string	"rellim"
	.byte	0x3
	.byte	0x89
	.long	0xc05
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x9
	.string	"rela"
	.byte	0x3
	.byte	0x8a
	.long	0xc10
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x9
	.string	"relalim"
	.byte	0x3
	.byte	0x8b
	.long	0xc10
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0x9
	.string	"pltrel"
	.byte	0x3
	.byte	0x8c
	.long	0xc05
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0x9
	.string	"pltrellim"
	.byte	0x3
	.byte	0x8d
	.long	0xc05
	.byte	0x2
	.byte	0x23
	.uleb128 0x54
	.uleb128 0x9
	.string	"pltrela"
	.byte	0x3
	.byte	0x8e
	.long	0xc10
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x9
	.string	"pltrelalim"
	.byte	0x3
	.byte	0x8f
	.long	0xc10
	.byte	0x2
	.byte	0x23
	.uleb128 0x5c
	.uleb128 0x9
	.string	"symtab"
	.byte	0x3
	.byte	0x90
	.long	0xc1b
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x9
	.string	"strtab"
	.byte	0x3
	.byte	0x91
	.long	0x238
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0x9
	.string	"strsize"
	.byte	0x3
	.byte	0x92
	.long	0x14e
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x9
	.string	"buckets"
	.byte	0x3
	.byte	0x99
	.long	0xc26
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.uleb128 0x9
	.string	"nbuckets"
	.byte	0x3
	.byte	0x9a
	.long	0x14e
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0x9
	.string	"chains"
	.byte	0x3
	.byte	0x9b
	.long	0xc26
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0x9
	.string	"nchains"
	.byte	0x3
	.byte	0x9c
	.long	0x14e
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0x9
	.string	"rpaths"
	.byte	0x3
	.byte	0x9e
	.long	0xc31
	.byte	0x2
	.byte	0x23
	.uleb128 0x7c
	.uleb128 0x9
	.string	"needed"
	.byte	0x3
	.byte	0x9f
	.long	0xc37
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0x9
	.string	"init"
	.byte	0x3
	.byte	0xa1
	.long	0x5e7
	.byte	0x3
	.byte	0x23
	.uleb128 0x84
	.uleb128 0x9
	.string	"fini"
	.byte	0x3
	.byte	0xa2
	.long	0x5e7
	.byte	0x3
	.byte	0x23
	.uleb128 0x88
	.uleb128 0x9
	.string	"_dlopen"
	.byte	0x3
	.byte	0xa5
	.long	0xc52
	.byte	0x3
	.byte	0x23
	.uleb128 0x8c
	.uleb128 0x9
	.string	"_dlsym"
	.byte	0x3
	.byte	0xa6
	.long	0xc6d
	.byte	0x3
	.byte	0x23
	.uleb128 0x90
	.uleb128 0x9
	.string	"_dlerror"
	.byte	0x3
	.byte	0xa7
	.long	0xc79
	.byte	0x3
	.byte	0x23
	.uleb128 0x94
	.uleb128 0x9
	.string	"_dlclose"
	.byte	0x3
	.byte	0xa8
	.long	0x574
	.byte	0x3
	.byte	0x23
	.uleb128 0x98
	.uleb128 0x9
	.string	"_dladdr"
	.byte	0x3
	.byte	0xa9
	.long	0xc9a
	.byte	0x3
	.byte	0x23
	.uleb128 0x9c
	.uleb128 0x16
	.string	"mainprog"
	.byte	0x3
	.byte	0xab
	.long	0x189
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0x16
	.string	"rtld"
	.byte	0x3
	.byte	0xac
	.long	0x189
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0x16
	.string	"textrel"
	.byte	0x3
	.byte	0xad
	.long	0x189
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0x16
	.string	"symbolic"
	.byte	0x3
	.byte	0xaf
	.long	0x189
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0x16
	.string	"printed"
	.byte	0x3
	.byte	0xb1
	.long	0x189
	.byte	0x4
	.byte	0x1
	.byte	0x1b
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0x16
	.string	"isdynamic"
	.byte	0x3
	.byte	0xb2
	.long	0x189
	.byte	0x4
	.byte	0x1
	.byte	0x1a
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0x16
	.string	"mainref"
	.byte	0x3
	.byte	0xb3
	.long	0x189
	.byte	0x4
	.byte	0x1
	.byte	0x19
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0x16
	.string	"globalref"
	.byte	0x3
	.byte	0xb4
	.long	0x189
	.byte	0x4
	.byte	0x1
	.byte	0x18
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0x16
	.string	"init_done"
	.byte	0x3
	.byte	0xb5
	.long	0x189
	.byte	0x4
	.byte	0x1
	.byte	0x17
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0x16
	.string	"init_called"
	.byte	0x3
	.byte	0xb6
	.long	0x189
	.byte	0x4
	.byte	0x1
	.byte	0x16
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0x16
	.string	"fini_called"
	.byte	0x3
	.byte	0xb8
	.long	0x189
	.byte	0x4
	.byte	0x1
	.byte	0x15
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0x16
	.string	"initfirst"
	.byte	0x3
	.byte	0xba
	.long	0x189
	.byte	0x4
	.byte	0x1
	.byte	0x14
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0x9
	.string	"linkmap"
	.byte	0x3
	.byte	0xbd
	.long	0x57a
	.byte	0x3
	.byte	0x23
	.uleb128 0xa4
	.uleb128 0x9
	.string	"interp"
	.byte	0x3
	.byte	0xc0
	.long	0x238
	.byte	0x3
	.byte	0x23
	.uleb128 0xb8
	.uleb128 0x9
	.string	"dldags"
	.byte	0x3
	.byte	0xc1
	.long	0xb0d
	.byte	0x3
	.byte	0x23
	.uleb128 0xbc
	.uleb128 0x9
	.string	"dagmembers"
	.byte	0x3
	.byte	0xc2
	.long	0xb0d
	.byte	0x3
	.byte	0x23
	.uleb128 0xc4
	.uleb128 0x9
	.string	"dev"
	.byte	0x3
	.byte	0xc3
	.long	0x19a
	.byte	0x3
	.byte	0x23
	.uleb128 0xcc
	.uleb128 0x9
	.string	"ino"
	.byte	0x3
	.byte	0xc4
	.long	0x1a7
	.byte	0x3
	.byte	0x23
	.uleb128 0xd0
	.uleb128 0x9
	.string	"ehdr"
	.byte	0x3
	.byte	0xc6
	.long	0x1cf
	.byte	0x3
	.byte	0x23
	.uleb128 0xd8
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.long	0x64a
	.uleb128 0xb
	.long	0xb07
	.string	"Struct_Objlist"
	.byte	0x8
	.byte	0x3
	.byte	0x4b
	.uleb128 0x9
	.string	"sqh_first"
	.byte	0x3
	.byte	0x4b
	.long	0x644
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.string	"sqh_last"
	.byte	0x3
	.byte	0x4b
	.long	0xb07
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.long	0x644
	.uleb128 0x3
	.string	"Objlist"
	.byte	0x3
	.byte	0x4b
	.long	0xac8
	.uleb128 0xb
	.long	0xb65
	.string	"Struct_Needed_Entry"
	.byte	0xc
	.byte	0x3
	.byte	0x4d
	.uleb128 0x9
	.string	"next"
	.byte	0x3
	.byte	0x4e
	.long	0xb65
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.string	"obj"
	.byte	0x3
	.byte	0x4f
	.long	0xac2
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.string	"name"
	.byte	0x3
	.byte	0x50
	.long	0x14e
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.long	0xb1c
	.uleb128 0x3
	.string	"Needed_Entry"
	.byte	0x3
	.byte	0x51
	.long	0xb1c
	.uleb128 0xb
	.long	0xbd5
	.string	"_rtld_search_path_t"
	.byte	0xc
	.byte	0x3
	.byte	0x53
	.uleb128 0x9
	.string	"sp_next"
	.byte	0x3
	.byte	0x54
	.long	0xbd5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.string	"sp_path"
	.byte	0x3
	.byte	0x55
	.long	0x238
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.string	"sp_pathlen"
	.byte	0x3
	.byte	0x56
	.long	0x1c0
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.long	0xb7f
	.uleb128 0x3
	.string	"Search_Path"
	.byte	0x3
	.byte	0x57
	.long	0xb7f
	.uleb128 0x5
	.byte	0x4
	.long	0x552
	.uleb128 0x5
	.byte	0x4
	.long	0xbfa
	.uleb128 0xa
	.long	0x3ce
	.uleb128 0x5
	.byte	0x4
	.long	0x2d1
	.uleb128 0x5
	.byte	0x4
	.long	0xc0b
	.uleb128 0xa
	.long	0x49d
	.uleb128 0x5
	.byte	0x4
	.long	0xc16
	.uleb128 0xa
	.long	0x4ee
	.uleb128 0x5
	.byte	0x4
	.long	0xc21
	.uleb128 0xa
	.long	0x460
	.uleb128 0x5
	.byte	0x4
	.long	0xc2c
	.uleb128 0xa
	.long	0x307
	.uleb128 0x5
	.byte	0x4
	.long	0xbdb
	.uleb128 0x5
	.byte	0x4
	.long	0xb6b
	.uleb128 0x12
	.long	0xc52
	.byte	0x1
	.long	0x1cf
	.uleb128 0x13
	.long	0x238
	.uleb128 0x13
	.long	0xf1
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.long	0xc3d
	.uleb128 0x12
	.long	0xc6d
	.byte	0x1
	.long	0x1cf
	.uleb128 0x13
	.long	0x1cf
	.uleb128 0x13
	.long	0x238
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.long	0xc58
	.uleb128 0x17
	.byte	0x1
	.long	0x183
	.uleb128 0x5
	.byte	0x4
	.long	0xc73
	.uleb128 0x12
	.long	0xc94
	.byte	0x1
	.long	0xf1
	.uleb128 0x13
	.long	0x2ab
	.uleb128 0x13
	.long	0xc94
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.long	0x2b2
	.uleb128 0x5
	.byte	0x4
	.long	0xc7f
	.uleb128 0x3
	.string	"Obj_Entry"
	.byte	0x3
	.byte	0xc7
	.long	0x64a
	.uleb128 0x18
	.long	0xd2b
	.byte	0x1
	.string	"___start"
	.byte	0x1
	.byte	0x44
	.byte	0x1
	.long	.LFB17
	.long	.LFE17
	.long	.LLST0
	.uleb128 0x19
	.string	"argc"
	.byte	0x1
	.byte	0x3e
	.long	0xf1
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x19
	.string	"argv"
	.byte	0x1
	.byte	0x3f
	.long	0x232
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x19
	.string	"envp"
	.byte	0x1
	.byte	0x40
	.long	0x232
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x19
	.string	"cleanup"
	.byte	0x1
	.byte	0x41
	.long	0x5e7
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x19
	.string	"obj"
	.byte	0x1
	.byte	0x42
	.long	0xd2b
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x1a
	.long	.LASF1
	.byte	0x1
	.byte	0x43
	.long	0x243
	.byte	0x2
	.byte	0x91
	.sleb128 20
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.long	0xd31
	.uleb128 0xa
	.long	0xca0
	.uleb128 0x1b
	.long	0xd80
	.string	"_strrchr"
	.byte	0x2
	.byte	0x2b
	.byte	0x1
	.long	0x183
	.long	.LFB18
	.long	.LFE18
	.long	.LLST1
	.uleb128 0x19
	.string	"p"
	.byte	0x2
	.byte	0x2a
	.long	0x183
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x19
	.string	"ch"
	.byte	0x2
	.byte	0x2a
	.long	0xf1
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1c
	.string	"save"
	.byte	0x2
	.byte	0x2c
	.long	0x183
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0x0
	.uleb128 0x18
	.long	0xdc2
	.byte	0x1
	.string	"_rtld_setup"
	.byte	0x2
	.byte	0x43
	.byte	0x1
	.long	.LFB19
	.long	.LFE19
	.long	.LLST2
	.uleb128 0x19
	.string	"cleanup"
	.byte	0x2
	.byte	0x42
	.long	0x5e7
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x19
	.string	"obj"
	.byte	0x2
	.byte	0x42
	.long	0xd2b
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.byte	0x0
	.uleb128 0x1d
	.string	"environ"
	.byte	0xb
	.byte	0x44
	.long	0x232
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	environ
	.uleb128 0x1d
	.string	"__progname"
	.byte	0xb
	.byte	0x45
	.long	0x183
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	__progname
	.uleb128 0x1d
	.string	"__ps_strings"
	.byte	0xb
	.byte	0x46
	.long	0x243
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	__ps_strings
	.uleb128 0x1e
	.string	"_DYNAMIC"
	.byte	0xb
	.byte	0x54
	.long	0xf1
	.byte	0x1
	.byte	0x1
	.uleb128 0x1e
	.string	"_etext"
	.byte	0xb
	.byte	0x5a
	.long	0x9a
	.byte	0x1
	.byte	0x1
	.uleb128 0x1e
	.string	"_eprol"
	.byte	0xb
	.byte	0x5a
	.long	0x9a
	.byte	0x1
	.byte	0x1
	.byte	0x0
	.section	.debug_abbrev
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x10
	.uleb128 0x6
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x25
	.uleb128 0x8
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0x0
	.byte	0x0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.uleb128 0x16
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.uleb128 0x26
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xf
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
	.uleb128 0x17
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
	.uleb128 0x15
	.byte	0x0
	.uleb128 0x27
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x16
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xd
	.uleb128 0xb
	.uleb128 0xc
	.uleb128 0xb
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.uleb128 0x15
	.byte	0x0
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x19
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1a
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x1c
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1e
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",@progbits
	.long	0x57
	.value	0x2
	.long	.Ldebug_info0
	.long	0xe3f
	.long	0xcb1
	.string	"___start"
	.long	0xd80
	.string	"_rtld_setup"
	.long	0xdc2
	.string	"environ"
	.long	0xdd8
	.string	"__progname"
	.long	0xdf1
	.string	"__ps_strings"
	.long	0x0
	.section	.debug_aranges,"",@progbits
	.long	0x1c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0x0
	.value	0x0
	.value	0x0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	0x0
	.long	0x0
	.section	.debug_str,"",@progbits
.LASF0:
	.string	"unsigned int"
.LASF2:
	.string	"r_offset"
.LASF1:
	.string	"ps_strings"
	.ident	"GCC: (GNU) 4.1.3 20080704 (prerelease) (NetBSD nb2 20081120)"
