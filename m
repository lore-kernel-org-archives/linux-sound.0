From: Vikram Rayabhari <vikram@asterix.cis.ohio-state.edu>
Date: Mon, 29 Mar 1999 23:31:40 +0000
Subject: problems with sound
Message-Id: <marc-linux-sound-92275025610407@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


Hi,

I have installed redhat linux 5.2 (2.0.36) recently on my pentium box.
When I run sndconfig, it detects an ES1371 and I am able to hear the
sample. HEAR are the messages displayed at boot time.

obelix kernel: es1371: version v0.2 time 22:31:29 Oct 13 1998
obelix kernel: es1371: found adapter at io 0x1480 irq 11
obelix kernel: es1371: features: joystick 0x0
obelix kernel: es1371: codec vendor TRA revision 3
obelix kernel: es1371: codec features none
obelix kernel: es1371: stereo enhancement: no 3D stereo enhancement

but the problem is that I am not able to play any files. The CD player is
working fine tho. playmidi gives the message :

open /dev/sequencer: Operation not supported by device

rvplayer gives out message :

****audio: write error: 64 bytes errno: 11
****audio: write error: 64 bytes errno: 11

# ls -l /dev/audio* /dev/dsp /dev/sequencer 
crw-rw--w-   1 root     sys       14,   4 May  5  1998 /dev/audio
crw-rw--w-   1 root     sys       14,  20 May  5  1998 /dev/audio1
crw-rw--w-   1 root     sys       14,   3 May  5  1998 /dev/dsp
crw-rw--w-   1 root     sys       14,   1 May  5  1998 /dev/sequencer

I tried changing permissions to the above files, but no success!!

I am new to linux. any type of help will be appreciated.

thanks
vikram
