(* Copyright (C) 2015-2025 Free Software Foundation, Inc.  *)
(* This file is part of GNU Modula-2.

GNU Modula-2 is free software; you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free
Software Foundation; either version 3, or (at your option) any later
version.

GNU Modula-2 is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
for more details.

You should have received a copy of the GNU General Public License
along with GCC; see the file COPYING3.  If not see
<http://www.gnu.org/licenses/>.  *)

IMPLEMENTATION MODULE mcDebug ;


FROM StrIO IMPORT WriteString, WriteLn ;
FROM mcOptions IMPORT getInternalDebugging ;
FROM mcError IMPORT internalError ;


(*
   assert - tests the boolean, q. If false then an error is reported
            and the execution is terminated.
*)

PROCEDURE assert (q: BOOLEAN) ;
BEGIN
   IF NOT q
   THEN
      internalError ('assert failed', __FILE__, __LINE__)
   END
END assert ;


(*
   writeDebug - only writes a string if internal debugging is on.
*)

PROCEDURE writeDebug (a: ARRAY OF CHAR) ;
BEGIN
   IF getInternalDebugging ()
   THEN
      WriteString(a) ; WriteLn
   END
END writeDebug ;


END mcDebug.
