From: Ari Pollak <compwiz@bigfoot.com>
Date: Wed, 16 Feb 2000 01:06:19 +0000
Subject: ac97_codec/es1371 screwy on 2.3.46-2 (pre)
Message-Id: <marc-linux-sound-95067371116782@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

I'm still getting weird oopses when trying various mixer programs with the
es1371, on kernel 2.3.46-2, with sound drivers compiled as modules.
Attached is an example - still obviously a
problem with the ac97 implementation w/ es1371. I'm still not quite sure
why ac97_codec is being used in the first place.


CPU:    0                                 Synth
EIP:    0010:[<c48150f6>]                 Pcm
Using defaults from ksymoops -t elf32-i386 -a i386
EFLAGS: 00010293                          Spkr
eax: 00000000   ebx: 00000000   ecx: 00000000   edx: 00000000
esi: 00000000   edi: 00000000   ebp: 00000003   esp: c2743eb4
ds: 0018   es: 0018   ss: 0018            CD
Process aumix (pid: 861, stackpage=C2743000)ain
Stack: 00000003 00000003 80044d03 bffff954 00000000 00000000 c48156a9 c3df1=
830
       00000003 c006ca40 ffffffe7 80044d03 c4819420 0000cd00 c01ae6e2 c4815=
050
       00000001 00000000 c2742000 00000000 c01b1fe9 00000001 c01bdb8a 00000=
246
Call Trace: [<c48156a9>] [<c4819420>] [<c01ae6e2>] [<c4815050>] [<c01b1fe9>=
] [<c01bdb8a>] [<c0112fe2>]
       [<c4819438>] [<c013928a>] [<c010ae50>]
Code: f7 ff 89 c7 bb 64 00 00 00 89 d9 29 f9 8d 34 b6 89 74 24 14

>>EIP; c48150f6 <[ac97_codec]ac97_read_mixer+a6/15c>   <=3D=3DTrace; c48156=
a9 <[ac97_codec]ac97_mixer_ioctl+209/2c8>
Trace; c4819420 <[es1371]es1371_ioctl_mixdev+0/1c>
Trace; c01ae6e2 <set_cursor+6e/80>
Trace; c4815050 <[ac97_codec]ac97_read_mixer+0/15c>
Trace; c01b1fe9 <con_flush_chars+11/18>
Trace; c01bdb8a <write_chan+272/324>
Trace; c0112fe2 <sys_rt_sigaction+7e/d8>
Trace; c4819438 <[es1371]es1371_ioctl_mixdev+18/1c>
Trace; c013928a <sys_ioctl+19e/1d4>
Trace; c010ae50 <system_call+34/38>
Code;  c48150f6 <[ac97_codec]ac97_read_mixer+a6/15c>
00000000 <_EIP>:
Code;  c48150f6 <[ac97_codec]ac97_read_mixer+a6/15c>   <=3D=3D   0:   f7 ff=
                     idivl  %edi,%eax   <=3D=3DCode;  c48150f8 <[ac97_codec=
]ac97_read_mixer+a8/15c>
   2:   89 c7                     movl   %eax,%edi
Code;  c48150fa <[ac97_codec]ac97_read_mixer+aa/15c>
   4:   bb 64 00 00 00            movl   $0x64,%ebx
Code;  c48150ff <[ac97_codec]ac97_read_mixer+af/15c>
   9:   89 d9                     movl   %ebx,%ecx
Code;  c4815101 <[ac97_codec]ac97_read_mixer+b1/15c>
   b:   29 f9                     subl   %edi,%ecx
Code;  c4815103 <[ac97_codec]ac97_read_mixer+b3/15c>
   d:   8d 34 b6                  leal   (%esi,%esi,4),%esi
Code;  c4815106 <[ac97_codec]ac97_read_mixer+b6/15c>
  10:   89 74 24 14               movl   %esi,0x14(%esp,1)


1 warning issued.  Results may not be reliable.
