From: Iqbal Maraqa <iqbal.maraqa@kawo2.rwth-aachen.de>
Date: Sun, 18 May 2003 22:52:07 +0000
Subject: alsa-0.9.3a - kernel panic
Message-Id: <marc-linux-sound-105329915731842@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

Hi,
i have a problem with my ens1371 and i hope u can help me. I'm runing
a 2.4.20 kernel compiled with gcc-2.95.3. I compiled and tried the last
3 releases of the alsa driver, lib and utils and i get always the same=20
kernel panic. My lsmod says :


Module                  Size  Used by    Not tainted
snd-seq-midi            4096   0  (autoclean) (unused)
snd-seq-oss            29152   0  (unused)
snd-seq-midi-event      3336   0  [snd-seq-midi snd-seq-oss]
snd-seq                37648   2  [snd-seq-midi snd-seq-oss
snd-seq-midi-event]
snd-pcm-oss            39108   0  (unused)
snd-mixer-oss          13720   0  [snd-pcm-oss]
snd-ens1371            11660   0
snd-pcm                62432   0  [snd-pcm-oss snd-ens1371]
snd-page-alloc          5244   0  [snd-pcm]
snd-timer              14824   0  [snd-seq snd-pcm]
snd-ac97-codec         39240   0  [snd-ens1371]
snd-rawmidi            14048   0  [snd-seq-midi snd-ens1371]
snd-seq-device          4368   0  [snd-seq-midi snd-seq-oss snd-seq
snd-rawmidi]snd                    31748   4  [snd-seq-midi snd-seq-oss
snd-seq-midi-event snd-seq snd-pcm-oss snd-mixer-oss snd-ens1371
snd-pcm snd-timer snd-ac97-codec snd-rawmidi snd-seq-device]
soundcore               3620   8  [snd]


and when i ` cat file.wav > /dev/audio` i get :


Unable to handle kernel NULL pointer dereference at virtual address
00000000
 printing eip:
c0111f13
*pde =3D 00000000
Oops: 0000
CPU:    0
EIP:    0010:[<c0111f13>]    Not tainted
EFLAGS: 00010097
eax: ed9a1984   ebx: ed9a1984   ecx: 00000000   edx: 00000003
esi: ed9a1988   edi: 00000001   ebp: eda59f2c   esp: eda59f14
ds: 0018   es: 0018   ss: 0018
Process alsamixer (pid: 14413, stackpage=EDa59000)
Stack: eb007cc0 ed27cac0 ed9a1800 ed9a1988 00000286 00000003 ed9a194c
f89a1511
       eae425c0 00000286 ed9a195c e54499c0 ed9a195c e54499c0 f89a304d
ed9a1800
       ed27cac0 00000000 e54499e0 ed9a195c ed27cac0 eae425c0 c1c1e380
e2114dc0
Call Trace:    [<f89a1511>] [<f89a304d>] [<c0131c2c>] [<c0130be5>]
[<c0130c33>]
  [<c0106cf7>]

Code: 8b 01 85 45 fc 74 4c 31 c0 9c 5e fa c7 01 00 00 00 00 83 79
 Segmentation fault


and it doesn't return after that. I tried to start alsamixer and i got
the same thing, but it retrund to the shell this time, so i was able to
copy this output. I compiled the soundcore and es1371 as loadable
kernel modules. Loading them and the other alsa modules is no problem.
I hope i made my self  clear and gave you enough info to help me on
this one.

Thanks alot,
Iqbal
--=20
echo "[q]sa[ln0=3Daln256%Pln256/snlbx]sb9110849205086363247337574050075\
032905184391195412274100697358608023133864165787933915045683432087129\
472907338347329339706073226139582008068077725378669120069632snlbxq"|dc

