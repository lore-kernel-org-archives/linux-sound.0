From: Ari Pollak <compwiz@bigfoot.com>
Date: Tue, 15 Feb 2000 01:38:36 +0000
Subject: [2.3.36pre1] Still problems with es1371/ac97_codec
Message-Id: <marc-linux-sound-95058676818812@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

OK, brief specs: ES1373 chip, running the es1371 driver, on 2.3.36pre1,
with the sound drivers loaded as modules.=20
Loading the es1371 module is fine, but as soon as I try to change the
mixer settings with some kind of OSS mixer (aumix, gmix, etc.) I get the
following panic:

CPU:    0
EIP:    0010:[<c40400f6>]
Using defaults from ksymoops -t elf32-i386 -a i386
EFLAGS: 00010293
eax: 00000000   ebx: 00000000   ecx: 00000000   edx: 00000000
esi: 00000000   edi: 00000000   ebp: 00000003   esp: c2c7beb4
ds: 0018   es: 0018   ss: 0018
Process gmix (pid: 1785, stackpage=C2c7b000)
Stack: 00000003 00000003 80044d03 bffff92c 00000000 00000000 c40406a9 c360e=
830
       00000003 c3378680 ffffffe7 80044d03 c4044420 c2c7bf24 c0138778 c4040=
050
       c3d7c7e0 00000001 c2c7a000 c3d7c760 c0149de7 c3d7c760 c11250e0 00000=
001
Call Trace: [<c40406a9>] [<c4044420>] [vfs_follow_link+44/68] [<c4040050>] =
[ext2_follow_link+27/36] [do_follow_link+93/128] [tvecs+14813/23932] [chrde=
v_open+62/76] [<c4044438>] [sys_ioctl+414/468] [system_call+52/56]
Code: f7 ff 89 c7 bb 64 00 00 00 89 d9 29 f9 8d 34 b6 89 74 24 14

>>EIP; c40400f6 <[ac97_codec]ac97_read_mixer+a6/15c>   <=3D=3DTrace; c40406=
a9 <[ac97_codec]ac97_mixer_ioctl+209/2c8>
Trace; c4044420 <[es1371]es1371_ioctl_mixdev+0/1c>
Code;  c40400f6 <[ac97_codec]ac97_read_mixer+a6/15c>
00000000 <_EIP>:
Code;  c40400f6 <[ac97_codec]ac97_read_mixer+a6/15c>   <=3D=3D   0:   f7 ff=
                     idivl  %edi,%eax   <=3D=3DCode;  c40400f8 <[ac97_codec=
]ac97_read_mixer+a8/15c>
   2:   89 c7                     movl   %eax,%edi
Code;  c40400fa <[ac97_codec]ac97_read_mixer+aa/15c>
   4:   bb 64 00 00 00            movl   $0x64,%ebx
Code;  c40400ff <[ac97_codec]ac97_read_mixer+af/15c>
   9:   89 d9                     movl   %ebx,%ecx
Code;  c4040101 <[ac97_codec]ac97_read_mixer+b1/15c>
   b:   29 f9                     subl   %edi,%ecx
Code;  c4040103 <[ac97_codec]ac97_read_mixer+b3/15c>
   d:   8d 34 b6                  leal   (%esi,%esi,4),%esi
Code;  c4040106 <[ac97_codec]ac97_read_mixer+b6/15c>
  10:   89 74 24 14               movl   %esi,0x14(%esp,1)


1 warning issued.  Results may not be reliable.

	Ari
