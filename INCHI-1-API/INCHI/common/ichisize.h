/*
 * International Chemical Identifier (InChI)
 * Version 1
 * Software version 1.04
 * September 9, 2011
 *
 * The InChI library and programs are free software developed under the
 * auspices of the International Union of Pure and Applied Chemistry (IUPAC).
 * Originally developed at NIST. Modifications and additions by IUPAC 
 * and the InChI Trust.
 *
 * IUPAC/InChI-Trust Licence No.1.0 for the 
 * International Chemical Identifier (InChI) Software version 1.04
 * Copyright (C) IUPAC and InChI Trust Limited
 * 
 * This library is free software; you can redistribute it and/or modify it 
 * under the terms of the IUPAC/InChI Trust InChI Licence No.1.0, 
 * or any later version.
 * 
 * Please note that this library is distributed WITHOUT ANY WARRANTIES 
 * whatsoever, whether expressed or implied.  See the IUPAC/InChI Trust 
 * Licence for the International Chemical Identifier (InChI) Software 
 * version 1.04, October 2011 ("IUPAC/InChI-Trust InChI Licence No.1.0") 
 * for more details.
 * 
 * You should have received a copy of the IUPAC/InChI Trust InChI 
 * Licence No. 1.0 with this library; if not, please write to:
 * 
 * The InChI Trust
 * c/o FIZ CHEMIE Berlin
 *
 * Franklinstrasse 11
 * 10587 Berlin
 * GERMANY
 *
 * or email to: ulrich@inchi-trust.org.
 * 
 */


#ifndef ___INCHISIZE_H__
#define ___INCHISIZE_H__

typedef unsigned short AT_NUMB;
typedef unsigned short AT_RANK;
#define AT_RANK_MASK   ((AT_RANK)~0)

typedef signed short NUM_H;
#define MAX_ATOMS  1024


#define CHAR_MASK  0xFF


typedef AT_RANK  *pAT_RANK;
typedef pAT_RANK *ppAT_RANK;

typedef unsigned long INCHI_MODE;

#define LEN_COORD 10
#define NUM_COORD 3
typedef char MOL_COORD[LEN_COORD*NUM_COORD + NUM_COORD-1]; /*copied 30 bytes from MOLfile */


#endif /* ___INCHISIZE_H__ */

