From: David Luyer <luyer@ucs.uwa.edu.au>
Date: Wed, 12 May 1999 12:40:38 +0000
Subject: Patch for some sound issues in Linux 2.2.8
Message-Id: <marc-linux-sound-92656280921353@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org


The following patch (originally against 2.2.0-preX, now against
2.2.8 with no significant changes) addresses these issues:

  * CONFIG_SOUND_ADLIB
        This sound define does less than but approximately
        the same as CONFIG_SOUND_YM3812.  The help text for
        both OSS and Linux advise to 'just say Y' for the
        YM3812 but give some discussion for ADLIB.

        I moved the help text from ADLIB to YM3812 and removed
        the ADLIB define, and adjusted all the files in the
        Documentation/sound directory appropriately.

  * Object files for GUS, OPL3SA2
        Superfluous object files are built for the OPL3SA2 and
        GUS.  A comment in the Makefile says we should just ignore
        this extra file being compiled, as it has no real effect and
        just prevents recompiles when the sound config is changed.

        This is completely bogus.  Changing the sound config causes
        a recompile anyway, and more importantly, in the non-modular
        case (for example, in my system), it simply wastes
        (non-swappable kernel) memory with things which never get
        used (and don't tell me gcc/ld are smarter than that, gcc/ld
        are stupid in many cases).

  * dev_table.h, sound_calls.h
        some things in dev_table.h clearly belong in sound_calls.h.
        cleaned this up.  cleaned up whitespace in sound_calls.h.
        added a comment about SNDCARD number clash between OSS and
        msnd.h (but didn't change either).

  * OPL3SA2 sound driver when compiled in to kernel
        made the opl3sa2 sound driver work when compiled into the
        kernel, by doing things the same way as it does with modules,
        eg, if the opl3sa2 chip is detected, set always_detect on the
        MPU; added WSS card subtype 1 if this is configured, and so on.

        note that the opl3sa2 pretty much always seems to think something
        is there, even at the wrong IO address, so a misconfigured kernel
        with this compiled in non-modularly will probably have non-working
        sound.  but that's already the case.

(and any others I missed in reading the patch over and forgot over
the 5 months since I first sent it to the listed maintainers with
no comment received)

All of this seems pretty obvious stuff to me.  What do I have to do
to make sure the fixes/cleanups make their way into the kernel?

David.

PS: The Win98 sound driver for this chipset doesn't work reliably[1]
    on my notebook and I'm unofficially informed by someone at Toshiba
    on a number of other models, but the Linux one works just great once
    patched appropriately or if compiled as modules :-)

[1] ie: there is a repeatable way to crash a Win98 system with this
    sound chip using only Microsoft and Toshiba supplied code.

begin 644 patch-2.2.8-DJL.gz
M'XL("+I#.3<"`W!A=3D&-H+3(N,BXX+41*3`#E._ESVEC2/Y._HNW,KK$1&(G#
MP.Q,+3Z2]7S&]AIG,JFM+4I(#Z.-D%@=3DQIZI_.]?=3DS\)!`@L,)EK7:D8Z_7U
MNOOU]81I#090+!JN$XBG`#]YP@@]WWH4^-D1D^+`L@78EA,^E6[N+M\?G[M&
M.!).H`>6ZQR?N<[`>@@]41H*>RSAUH*\.3HZRDHN]U&8T!Y[H#5`*[?*)ZVR
M!FJSV7Q3+!8S\$KBJ\V6JK:TIL0_FO]AH9I:K:XTM9,:\"/`GT]N"(;N@*\_
M0P>&PA,0N&"XHS$I)1A:/I@>JLH#W0<=3D1JX9VN);7!#19[!\)F3HMHVR^/V2
M6\(';XKP7CC"LPRXN;W2CO&_"KSK@/_L(*YO_8P4_7`\=3DKT`0<]NKM]=3DON]U
M;SY<G_?:YU>7I_@0H.WX$X3[!-8`GMW00R:>"4.6!&D90VL,(]T4T'^&3_I(
M'^J0GW*C_ZJ'I00ARWD@6CZ$?HC2/B,57Q\(T!T3T"?<$6K9Q#T80]<RA`)#
M=3DR)HY[X[$DR&V/O(\1EE0._QW4$PT5%C^?ONW2%))$:AS68JP86C]VWB2)N6
M&X6)%0R9$*E`),@9>HA_!YX;]E&C^4LP7><@`'13#PV/DGYVW`FX`Q3U&:D9
MPYDX4S$/2Z1T7KBUA8[T/*&;;"EV\'DW\MW0,:55EI7K,!5>)!V78KJ7`P@M'WU/87_Y))5+JP=
!OKUQWW->-S]"Y/,<-B$?4X=3D3$N#YGXQ\)B)Z^?<N>'GEF
M7<4C62RF.V^MTE2:M6I5.B]CU;2:0L\E%I`<"SZ6_]2I-%3VB&+E,"'/G#@2
MZ$UA5SY7V(W/%7;E<X6=3D^%PAU><*P`NO][G"O,\5@./*U!X4FQ3T/UOX/B%+
M^>C#Q+)M<-P`'"$D<W?,"I$>T0T=3D:(>FY4ZM;[XN(\A]M#]>5+34$)U87Y\+
M$H"Y^U#`#QB(H0;E:JNLMM3F^D201-XH"]15I=3DZ,,T#M$*XC-?I#-[0CKXRB
MOX#/PG.$'6GRTH']D?X9O>5)04'"0X.3T3[XPA9&`!:N=3DTFL_=3D:;O>BC-'&D
M^7T%]M5R^2\@ETYMW0_0N,00-X5^Z$.^>ZK6CRO:<;VJP$6WJZ!6?OY9K1_.
M:!#MK,EEGT_:_OJH@`1GX#[\K?,]Y&5V.]QBYQ`_W+_I=3DH'-%.5*?XD\6Y<,
MTHA#V!_0($@Z@Y)_*PWOY+"?=3D2X;E4IYS4&,(+(<^`@TUW$=3DZ.@>0`.P\-.T
M5KF>Y<C'Z!L=3D>K6J:.7XT"=3DSWW>CQ62(.EU^V#W%9WLIA=3DHR:.?V0[6L\O.W
M\$/H!S!P/1A@%&X=3D+L$R+]JO%#`Z!#L24#K@+B3<B1-UVN=3DJ?8UA>3V+`S%@
M[GX8LOVA">5ZJU)M:16R?^,%]Y'(VSM/21Y,RMHM>707K#4MYY?\@UDG'R0,
M%#N!&A5S.]$X)89BM[TN3<<@6?0>P^;>>18G:[6&(K=3DJE1>[M@7\C;1?K2LU
M=3D5;TXI_U>GQ0,-@Z6`'JE@TC$5550.4AU414"6(S)Y[&F"I)%@JB*+48#*@R
MQ"4.N!:5PQ/7^\R1N`!'._HA4G`IRU8JU894&4Y<KB61,U9YCL!2DE)'!#6P
MGKB`PW(9A2.1F,;8<W$'6)%.:+?]T+)I)PB1R(<`]_C'O>L/K;X.5U;?$P%"
M^+AS8N)Z3$D/@,K4@+*%L'TX*9_=3DLP"J2I\F0PM%BX1Q)XXPL>#$HE:/*GVF
M$1GQB<M^^E0!W3!<SXS4;28-?QAE)RII%;B\^R?4%*F7&]!-T\-:%E.LII6/
M:Y7R<:71.*[0[Y,R2W7>:8.JE"'?P^JV!V5%Q8(;VECM<C'/A(QH'L#L<+]!
M@'+XW-/W!3SH`=3D7-)G4K?=3D>E-:3LTD.XZ<H-,QDJ,AX<S-L^:Y5K!-VF:OZ9
M2O$Y8W+[@U8B/@?_H?!)ICK@($K(CNL4.?OJ5."C_DBP,&(4&UX:,Y8>)8RM
M/&-WKC]:)ER%SRCLWVSZ]??0\$OA1"\),RSIX?>[]=3D8WW.'&)RCT25F6KX\M--W`M6WT8=3D=
J>::&R2-L^G2<K\.=3D-CCZ`A'`W9FB0Z\P;B*(6VO`?-&BQI*X]
MK&4>=3D3R=3DXLD0WCA`-9/3H3:1SN@9R-?8'@//'=3D$#*1/'X=3D:.XB3V2^OB%BYG
MBH\(EZ-VZX?0QG@&Y1K%-K61)2TQ[D9Q46LJE>DDB_J\I>HVKJ#Q(`AJC9%Z
M8HH%>6RZ4=3D$C+D&C/O-@)/TX:I>M0(PPS=3D&8(VO'D<OE\LD$>,AM;,<R/)>:
M]TC,[C,6VJ,$SA0)"PZ)THTV0>+<W-Y;(.L'#`S'^*3C_JSC8A_/E]RTGX,9
M#8*45#(5Y4G^$D!V)J3BZ@[S\=3DU%^[QS4:*J?;4GS("R^-P,FNMISLKH/66L
MAK"+SI*5$Q0V\K]&65,::B7A@3DXYQF*=3D#;HGL89F<.F'AEP9KQ9F\46C.:F
ML$%WJR!\KCAUWN>#5XY*<\FY%9/+.+DJP3_FIZ6Y5X^N)!&:7ZV?7<U8I\^P
M)!VN.IA"B<_%_GL/TXL/'^S`TV62GBD54I4JM_'^0Y=3D,2+\Z[9]*4S!G"L9"
ML#O,,#"9&+*!I[^BD3H>)A_=3D$??$)9$8N1ZF/_)6]JWRR>II:*-94YIE-78^
M9,5C5Y+?CU+7L2D>CWWQWU`@:X_MQH]&N&R4L%["W<M!F22@V[X+^F"`R<WG
MH9]LD^*`PSZIVY)/PG/EI#?6:K89`(UPYC5,54I$8D'N5*NP>Z+&3<R%/*58
MO]FXOV@TFDJC.1T7_^&U]IK#OK>SP[ZWB\.^MZ/#OI=3DZV+^23^TR*48#K)<3
M502X07*,,%Z9(&,J&X\.DBD2XB:"RZ!HWEB"KISGS9R9:UT*E[;E!U%BI+%>
MULQ(O`@^T\DB8'2<:?DO'0M[*>F+RNR6`<OZ/CK',];QZ`W/T>7IV$8W+4WT
M1R[OZ3ZT'P9\(U$:6::%.4)6^GR!''5)([I"P\XTXC)*N]F@!H"U8;KH&$0O
MY&Y*T+5,=3D$SPK/M,<W:62HEQBJ8E[L:V5_Z.E&GY?TA=3D[N28?T3%HV*QSUM]
MTJ8P60[W%)C'45TQ!E6E07+EI*75LK1<,P*;'>FZJJCUD_A0OS4%&E`LC6A[
MG9OS#U<7H!(,LA.#A<GJ;;N[:JE+]_^I*_+E@!5H6%JM6I)9>:4HV&OP@>&M
MU;?L>&15Y\=3DC>N[[2Y8366#%ZJ*E5X!EN2Q8A;K9.R(-12TG7A"A'PN=3D]@"[
MF:BTH3%67EX"*=3D#MP$?N;O`,7W35>J-Q"&=3D#87R.QA6Z@P5%=3D,;X`!Y,57]*
M5ND1M:+*O`86_^(>R!3C7N!A_-$#`0=3D9P_Y!BK?`-XNN*5];@&4NJUJ"@R4_
M2R'*FAK`OV#_FT7H??@.]I_WH>BN6ASMP[_YM1IGJO6^Z]IP@`UCW\+XJ8_&
M7#+)VI,42E+D>]<W][VX&3F<RHD/$%&^)$$&K>S$I3OZ9S&#6+&XWJ%CJ,41
M>K-5/5GOSU/,!7>NM+3ZFN&YIE0;L3>[_?\4O\DG]7^8RQ6^DS-:P\4.Q%V$
M.N^T$X#F2/K%,MS4#1(4$:J8!B7'0@2FF[;5[W'O[Z)E[<HJPF?=3DJE;1&,?P
MZ2/"ZZ;:J#;P@TS0;^D*%1T(>T@%>.I[X,]RK./2JQD^CR?Q/!MV:,IV--2]
M@`ZUX9I"WB^@QM8TGK6R4JM/8S\W!W*^R>-O.13VL&:V/)IX3.^N,3F[P+-B
M6U"XH%J`"?`K9Q0\`N^9T[*<_.,?>M\-.9\#^JJG3R65j)EAGK=16AK-(J
MGA)IKH?03R@T'5C.U`@:6RNUGC0`O?3V$J].^\-EA!U:"#X:AQ*:=3DY4:M,W
M`'Y[I;Z%>WFY,L;CARXS&;KQT%\0!60E6\)`7M]@VTN%%-T6H*A,@"]QBOP1
MX+WKFF"90H\G)%1Z1>U$"3!_8!U*$2W$/DP?CWEX)N]U(@)R-#(W7T&\.WSZ
M*'AL]GLU;NH):BKUVNJ0U.MTK\]O+Z\E/9_""/_JC2W'T0U;K!0B#C[KMTK9
ML]M6F3R%'%]/[G:VT;W5R%H"64O%GFD@508L_:2H8]W7,NKX-M[>V$_:\P5.
MW=3D,H(,]SB%^[.8D/W9_+#K]S[;^R##'%8R^@(%$:IE8*B?7UQ4@",.5%[,;Z
M>F0%,I8DU2K6YVONK6I*K;K8/:&OG;7OSGOG%]W_N[V[^>DJE]-.<L=3D'<$8S
MP__"N?`_8S*'GZ[@Z#@%[\?+\[,<XC0(IWW7\8&>I,-V3V^O;PFX25W6PF+D
MEKA<::Q>1AH(L`:?2OM<KEI.8W_S[IXN6Y!`/6TG-"JEQ9.4Q8_M'R_>W=3DU<
MW\/\3U5-`8X."2S^5+75P"3W/'!EA1CMN_O+[CWNL9H"@.FD@07XTD^C(4=3D9
MCZZ%:3,(=3D&/8D^>W-_%]R/N!%QI!_&I`SW(&+AP-)SU9#QQ^BZC4C%%9)S9%
M3.'I][=CF1$OA2/&B^U89D5DGJ%CN[J94-!*3/JP"L_O;X6&DF;$BU1#LW+L
M9;D/V%`Y$>K&FMD$#SWVF&<!1SEL-B_V0/Y*_L^K\L:XIE2G(\??.+B])O04
MU@9&DN/:#40+#%OWA_0>"%<(0Y*I\%+0+&P1-'^?@:^PFEJW.T^M1CJ[\:P'
MR^$+II'ETYL+J39<'SVSNF/Z.*"*_ME,O$VG8KNK-A)#\K?6@`:$:>46W1;]
MLA_]L:]`65G<MY*;+>=3DR<Z%/4^8"FJ;,APWM"[T8-B./"D0.JI*FV1D78+!%
M3KV1[R]PDX_F.=3D*S+\K<IM`)4O=3D%WI'DBN<DC>TX7&)+CQ;9CD-F^U8X6`F2
MUE/;I,:)4FO.1@W6P$G8)9;KO-/6EH?0Rd9TG>\^9.;+=3DWVNY>T'7B+VFZ
M@%]68"AII"[O_LE:+:I?6+48"=3D^U/US=3D]RZNVZ=3D7%TEM%)<9+C-+9<1,EC>;
M]DQ[48RTH_"^?=3D7^Z1,?F]I)7:DUIJ^A?AWC%+*HXNS^[NKKZ:.09G[Z#L2O
M:9%?S4/31,W@LEF<YI4M7]SC&JFMV'1U?;LW!9L.G^DR16UIU5:YO+[9FZ$N
M7:94RNM>W3Y1JB?3+UM]D1JBKQO119RQ5.5R2'ZI)D,*OU#0]D00>DZ$/_)[
M+&D^6;NE<%PNR3?B:0QU#U/WD_!ZCCX2_ZI7__UM?-L<;S:*"3/6O^(NO]+V
M4O.3BB$0^_Q5MEWN##82)<)<N6..PI$(2QK_RKS3IYH:INN3665%#^KEZ5=3DZ
M<DR9BD#Y2E1`D^PQO:7_#*1K60GF<O[80W\9Y/DR7@1L!P7VHW?M_V)@>1+H
M)$B!(@W(U&+F5\2Z0_CK7V$O!I(WTH<4U7.\L]Z#"&AG^90`>EC\7K<G^K/?
M,T5`[T=3D\!RISC6-=3D+O9-E;22^Y+PUO*WKPUX4CSZ4KV_8LHU![$^\,V!SGW3
MM$)O"U1>"'[SZ!L%P`JW@]$1H3B@TQ=3DQ>Q//0OOGZ8$I'A6(_))5<C3@FPUZ
M-S(`/I!'_7"@,+:!D@3LA#-:[E@XZT@QN(P+#$^OV].7$M:C["4X6*X1V&NE
ME6^=3DT?V%]8".)F4=3DF;@+.FH]).0]+,IA.5;0BUX#A#PMS"`\X7H/.GT=3DHX=3D[
M'Z`IEMF;(YT7Q[HW\N$(_QQ+)=3D'U$'\;9:HH`EW<Q$NRDC.0]=3D3X`/]YK?>G
MLEOZQ+FN:"?35BJ9'0+/>LHRL9K'DG?0V^!LSBO*7ULA9>.&[H)IZ1V]KA)MKAN4C?8@,H.L/>=
12AHD9S%4A&Z`M\LHX\TSCEQDUL?=9C<VI>*EJVUB43?!2
M:L0M-K\I+L^2<N_DBTJA%6\]29*>IY."N3$ISSYKBM:LQ`'S]W[,"EO.R@O;
MS<H+6\[*?]UH4-BX=3DDY%S#Y?CXY@;BG\_(_$GEPB]L1Q=3D^O;L;UM;\?VMKXMV]OR=3DFQO=
^]NQO6UOQ_:65?X_%.X+Z8.(3)@KY@J9</%?K',*"Z[O2YT77G,)
M6-CJ$G"7&2_]*[FJ4BG/-7Q2Q(G^*'0OL/P@LXVC2+H9IBQG^(?W.(E?<4_;
MZ'1Q0Y?=3D#&]Q,]DQES8SZ/%7(-*V,EB=3DW&#E/@9K,^*J/63$X@:RW%`J:C/9
70OX&_I#[D[A"[@_H!?\/]6U97GU3````
`
end
