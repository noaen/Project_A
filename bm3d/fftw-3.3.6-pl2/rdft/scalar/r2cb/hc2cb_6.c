/*
 * Copyright (c) 2003, 2007-14 Matteo Frigo
 * Copyright (c) 2003, 2007-14 Massachusetts Institute of Technology
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */

/* This file was automatically generated --- DO NOT EDIT */
/* Generated on Fri Jan 27 16:13:22 EST 2017 */

#include "codelet-rdft.h"

#ifdef HAVE_FMA

/* Generated by: ../../../genfft/gen_hc2c.native -fma -reorder-insns -schedule-for-pipeline -compact -variables 4 -pipeline-latency 4 -sign 1 -n 6 -dif -name hc2cb_6 -include hc2cb.h */

/*
 * This function contains 46 FP additions, 32 FP multiplications,
 * (or, 24 additions, 10 multiplications, 22 fused multiply/add),
 * 45 stack variables, 2 constants, and 24 memory accesses
 */
#include "hc2cb.h"

static void hc2cb_6(R *Rp, R *Ip, R *Rm, R *Im, const R *W, stride rs, INT mb, INT me, INT ms)
{
     DK(KP866025403, +0.866025403784438646763723170752936183471402627);
     DK(KP500000000, +0.500000000000000000000000000000000000000000000);
     {
	  INT m;
	  for (m = mb, W = W + ((mb - 1) * 10); m < me; m = m + 1, Rp = Rp + ms, Ip = Ip + ms, Rm = Rm - ms, Im = Im - ms, W = W + 10, MAKE_VOLATILE_STRIDE(24, rs)) {
	       E TK, TR, TB, TM, TL, TS;
	       {
		    E Td, TN, TO, TJ, Tn, Tk, TC, T3, Tr, T7, T8, T4, T5;
		    {
			 E TI, Tj, Tg, TH, Te, Tf, T1, T2;
			 {
			      E Tb, Tc, Th, Ti;
			      Tb = Ip[0];
			      Tc = Im[WS(rs, 2)];
			      Th = Ip[WS(rs, 1)];
			      Ti = Im[WS(rs, 1)];
			      Te = Ip[WS(rs, 2)];
			      Td = Tb - Tc;
			      TN = Tb + Tc;
			      Tf = Im[0];
			      TI = Th + Ti;
			      Tj = Th - Ti;
			 }
			 Tg = Te - Tf;
			 TH = Te + Tf;
			 T1 = Rp[0];
			 T2 = Rm[WS(rs, 2)];
			 TO = TH - TI;
			 TJ = TH + TI;
			 Tn = Tj - Tg;
			 Tk = Tg + Tj;
			 TC = T1 - T2;
			 T3 = T1 + T2;
			 Tr = FNMS(KP500000000, Tk, Td);
			 T7 = Rm[WS(rs, 1)];
			 T8 = Rp[WS(rs, 1)];
			 T4 = Rp[WS(rs, 2)];
			 T5 = Rm[0];
		    }
		    {
			 E Tl, Tq, TQ, Ts, Ta, T10, TG;
			 Rm[0] = Td + Tk;
			 {
			      E T9, TE, T6, TD, TF;
			      T9 = T7 + T8;
			      TE = T7 - T8;
			      T6 = T4 + T5;
			      TD = T4 - T5;
			      Tl = W[2];
			      Tq = W[3];
			      TQ = TD - TE;
			      TF = TD + TE;
			      Ts = T6 - T9;
			      Ta = T6 + T9;
			      T10 = TC + TF;
			      TG = FNMS(KP500000000, TF, TC);
			 }
			 {
			      E T13, TP, Tz, TZ, Tw, T14, Tv, Ty;
			      {
				   E Tt, T12, T11, Tp, Tm, To, Tu;
				   T13 = TN + TO;
				   TP = FNMS(KP500000000, TO, TN);
				   Rp[0] = T3 + Ta;
				   Tm = FNMS(KP500000000, Ta, T3);
				   Tz = FMA(KP866025403, Ts, Tr);
				   Tt = FNMS(KP866025403, Ts, Tr);
				   TZ = W[4];
				   To = FNMS(KP866025403, Tn, Tm);
				   Tw = FMA(KP866025403, Tn, Tm);
				   Tu = Tl * Tt;
				   T12 = W[5];
				   T11 = TZ * T10;
				   Tp = Tl * To;
				   Rm[WS(rs, 1)] = FMA(Tq, To, Tu);
				   T14 = T12 * T10;
				   Ip[WS(rs, 1)] = FNMS(T12, T13, T11);
				   Rp[WS(rs, 1)] = FNMS(Tq, Tt, Tp);
			      }
			      Im[WS(rs, 1)] = FMA(TZ, T13, T14);
			      Tv = W[6];
			      Ty = W[7];
			      {
				   E TX, TT, TW, TV, TY, TU, TA, Tx;
				   TK = FNMS(KP866025403, TJ, TG);
				   TU = FMA(KP866025403, TJ, TG);
				   TA = Tv * Tz;
				   Tx = Tv * Tw;
				   TX = FNMS(KP866025403, TQ, TP);
				   TR = FMA(KP866025403, TQ, TP);
				   Rm[WS(rs, 2)] = FMA(Ty, Tw, TA);
				   Rp[WS(rs, 2)] = FNMS(Ty, Tz, Tx);
				   TT = W[8];
				   TW = W[9];
				   TB = W[0];
				   TV = TT * TU;
				   TY = TW * TU;
				   TM = W[1];
				   TL = TB * TK;
				   Ip[WS(rs, 2)] = FNMS(TW, TX, TV);
				   Im[WS(rs, 2)] = FMA(TT, TX, TY);
			      }
			 }
		    }
	       }
	       Ip[0] = FNMS(TM, TR, TL);
	       TS = TM * TK;
	       Im[0] = FMA(TB, TR, TS);
	  }
     }
}

static const tw_instr twinstr[] = {
     {TW_FULL, 1, 6},
     {TW_NEXT, 1, 0}
};

static const hc2c_desc desc = { 6, "hc2cb_6", twinstr, &GENUS, {24, 10, 22, 0} };

void X(codelet_hc2cb_6) (planner *p) {
     X(khc2c_register) (p, hc2cb_6, &desc, HC2C_VIA_RDFT);
}
#else				/* HAVE_FMA */

/* Generated by: ../../../genfft/gen_hc2c.native -compact -variables 4 -pipeline-latency 4 -sign 1 -n 6 -dif -name hc2cb_6 -include hc2cb.h */

/*
 * This function contains 46 FP additions, 28 FP multiplications,
 * (or, 32 additions, 14 multiplications, 14 fused multiply/add),
 * 25 stack variables, 2 constants, and 24 memory accesses
 */
#include "hc2cb.h"

static void hc2cb_6(R *Rp, R *Ip, R *Rm, R *Im, const R *W, stride rs, INT mb, INT me, INT ms)
{
     DK(KP500000000, +0.500000000000000000000000000000000000000000000);
     DK(KP866025403, +0.866025403784438646763723170752936183471402627);
     {
	  INT m;
	  for (m = mb, W = W + ((mb - 1) * 10); m < me; m = m + 1, Rp = Rp + ms, Ip = Ip + ms, Rm = Rm - ms, Im = Im - ms, W = W + 10, MAKE_VOLATILE_STRIDE(24, rs)) {
	       E T3, Ty, Td, TE, Ta, TO, Tr, TB, Tk, TL, Tn, TH;
	       {
		    E T1, T2, Tb, Tc;
		    T1 = Rp[0];
		    T2 = Rm[WS(rs, 2)];
		    T3 = T1 + T2;
		    Ty = T1 - T2;
		    Tb = Ip[0];
		    Tc = Im[WS(rs, 2)];
		    Td = Tb - Tc;
		    TE = Tb + Tc;
	       }
	       {
		    E T6, Tz, T9, TA;
		    {
			 E T4, T5, T7, T8;
			 T4 = Rp[WS(rs, 2)];
			 T5 = Rm[0];
			 T6 = T4 + T5;
			 Tz = T4 - T5;
			 T7 = Rm[WS(rs, 1)];
			 T8 = Rp[WS(rs, 1)];
			 T9 = T7 + T8;
			 TA = T7 - T8;
		    }
		    Ta = T6 + T9;
		    TO = KP866025403 * (Tz - TA);
		    Tr = KP866025403 * (T6 - T9);
		    TB = Tz + TA;
	       }
	       {
		    E Tg, TG, Tj, TF;
		    {
			 E Te, Tf, Th, Ti;
			 Te = Ip[WS(rs, 2)];
			 Tf = Im[0];
			 Tg = Te - Tf;
			 TG = Te + Tf;
			 Th = Ip[WS(rs, 1)];
			 Ti = Im[WS(rs, 1)];
			 Tj = Th - Ti;
			 TF = Th + Ti;
		    }
		    Tk = Tg + Tj;
		    TL = KP866025403 * (TG + TF);
		    Tn = KP866025403 * (Tj - Tg);
		    TH = TF - TG;
	       }
	       Rp[0] = T3 + Ta;
	       Rm[0] = Td + Tk;
	       {
		    E TC, TI, Tx, TD;
		    TC = Ty + TB;
		    TI = TE - TH;
		    Tx = W[4];
		    TD = W[5];
		    Ip[WS(rs, 1)] = FNMS(TD, TI, Tx * TC);
		    Im[WS(rs, 1)] = FMA(TD, TC, Tx * TI);
	       }
	       {
		    E To, Tu, Ts, Tw, Tm, Tq;
		    Tm = FNMS(KP500000000, Ta, T3);
		    To = Tm - Tn;
		    Tu = Tm + Tn;
		    Tq = FNMS(KP500000000, Tk, Td);
		    Ts = Tq - Tr;
		    Tw = Tr + Tq;
		    {
			 E Tl, Tp, Tt, Tv;
			 Tl = W[2];
			 Tp = W[3];
			 Rp[WS(rs, 1)] = FNMS(Tp, Ts, Tl * To);
			 Rm[WS(rs, 1)] = FMA(Tl, Ts, Tp * To);
			 Tt = W[6];
			 Tv = W[7];
			 Rp[WS(rs, 2)] = FNMS(Tv, Tw, Tt * Tu);
			 Rm[WS(rs, 2)] = FMA(Tt, Tw, Tv * Tu);
		    }
	       }
	       {
		    E TM, TS, TQ, TU, TK, TP;
		    TK = FNMS(KP500000000, TB, Ty);
		    TM = TK - TL;
		    TS = TK + TL;
		    TP = FMA(KP500000000, TH, TE);
		    TQ = TO + TP;
		    TU = TP - TO;
		    {
			 E TJ, TN, TR, TT;
			 TJ = W[0];
			 TN = W[1];
			 Ip[0] = FNMS(TN, TQ, TJ * TM);
			 Im[0] = FMA(TN, TM, TJ * TQ);
			 TR = W[8];
			 TT = W[9];
			 Ip[WS(rs, 2)] = FNMS(TT, TU, TR * TS);
			 Im[WS(rs, 2)] = FMA(TT, TS, TR * TU);
		    }
	       }
	  }
     }
}

static const tw_instr twinstr[] = {
     {TW_FULL, 1, 6},
     {TW_NEXT, 1, 0}
};

static const hc2c_desc desc = { 6, "hc2cb_6", twinstr, &GENUS, {32, 14, 14, 0} };

void X(codelet_hc2cb_6) (planner *p) {
     X(khc2c_register) (p, hc2cb_6, &desc, HC2C_VIA_RDFT);
}
#endif				/* HAVE_FMA */
