#!/usr/local/bin/rooter -f

# mkroot files:
BOOTMKRC = src/boot/boot.mk
KERN = src/kern/mini_kernel.c
SHELL = src/bin/sh.c
INIT = src/bin/init.c

# new root directory stucture

ROOTDIR = $(ROOTERMK)
ROOTBIN = $(ROOTDIR)/bin
ROOTETC = $(ROOTDIR)/etc
ROOTDEV = $(ROOTDIR)/dev
ROOTBOOT = $(ROOTDIR)/boot
ROOTKERN = $(ROOTDIR)/kern
ROOTUSR = $(ROOTDIR)/usr
ROOTLIB = $(ROOTDIR)/lib
ROOTTMP = $(ROOTDIR)/tmp
ROOTVAR = $(ROOTDIR)/var

# C Compilers
CC = gcc
CFLAGS = -Wall -g -Iinclude

ROOTFILENAME = "MPC Mini Unix"
ROOTTARGET = ../build/root

# configs

ROOTCONFIG = root.conf
SYS = systemfiles.cfg
MKCFGROOT = mkroot