From: Gilles LAMIRAL <lamiral@mail.dotcom.fr>
Date: Sun, 25 Oct 1998 18:03:16 +0000
Subject: midiplay compilation
Message-Id: <marc-linux-sound-90935107505446@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello,

Is there anyone that succeeded in compiling midiplay ?
I have the following errors:

cd midi
xmkmf -a ; make
....
gcc -c -O2 -m486 -g   -I../include  -I/usr/X11R6/include   -D_POSIX_SOURCE -D_BSD_SOURCE -D_SVID_SOURCE -Dlinux -D__i386__ -DX_LOCALE   -DFUNCPROTO -DNARROWPROTO  -DHAS_NAS -DHAS_FILE -DHAS_VOXWARE -DDEFAULT_DIR=\"/usr/X11R6/lib/midiplay/\" -DDEFAULT_PATCH=\"/usr/X11R6/lib/midiplay/patch.mp\"  init.c
In file included from init.c:26:
/usr/include/sched.h:36: parse error before `_P'
make[1]: *** [init.o] Error 1
make[1]: Leaving directory `/usr/local/midiplay/midi/midilib'
...

Thanks in advance.
-- 
au revoir,
Gilles Lamiral. Rennes (35).
