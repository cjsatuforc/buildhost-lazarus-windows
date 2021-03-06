{ $Id: gtkextra.pp 41387 2013-05-24 18:30:06Z juha $ }
{
 ---------------------------------------------------------------------------
 gtkextra.pp  -  GTK(2) widgetset - additional gdk/gtk functions
 ---------------------------------------------------------------------------

 This unit contains missing gdk/gtk functions and defines for certain 
 versions of gtk or fpc.

 ---------------------------------------------------------------------------

 @created(Sun Jan 28th WET 2006)
 @lastmod($Date: 2013-05-24 19:30:06 +0100 (Fri, 24 May 2013) $)
 @author(Marc Weustink <marc@@dommelstein.nl>)

 *****************************************************************************
  This file is part of the Lazarus Component Library (LCL)

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
 }

unit GtkExtra;

{$mode objfpc}{$H+}

interface

{$I gtkdefines.inc}

{$ifdef gtk1}
{$I gtk1extrah.inc}
{$endif}

{$ifdef gtk2}
{$I gtk2extrah.inc}
{$endif}


implementation

{$ifdef gtk1}
{$I gtk1extra.inc}
{$endif}

{$ifdef gtk2}
{$I gtk2extra.inc}
{$endif}

end.
