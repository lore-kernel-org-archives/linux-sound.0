From: Martin Adler <rockshox@web-regional.net>
Date: Sun, 20 Jun 1999 11:00:11 +0000
Subject: 
Message-Id: <marc-linux-sound-93038866401409@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Got the following problem with the SBLive 0.2b driver under SuSE 6.0 with Kernel 2.2.10:

adler-martin-lnx:~ # insmod -f sblive
Warning: kernel-module version mismatch
        /lib/modules/2.2.10/misc/sblive.o was compiled for kernel version 2.2.5
        while this kernel is version 2.2.10

/lib/modules/2.2.10/misc/sblive.o: unresolved symbol unregister_sound_dsp
/lib/modules/2.2.10/misc/sblive.o: unresolved symbol unregister_sound_midi
/lib/modules/2.2.10/misc/sblive.o: unresolved symbol register_sound_dsp
/lib/modules/2.2.10/misc/sblive.o: unresolved symbol register_sound_mixer
/lib/modules/2.2.10/misc/sblive.o: unresolved symbol unregister_sound_mixer
/lib/modules/2.2.10/misc/sblive.o: unresolved symbol unregister_sound_special
/lib/modules/2.2.10/misc/sblive.o: unresolved symbol register_sound_special
/lib/modules/2.2.10/misc/sblive.o: unresolved symbol register_sound_midi
adler-martin-lnx:~ #

I followed all the procedures in the readme file. Anyone have a solutions.


Thanx alot,

Martin

---------------------------------------------
| Martin Adler ~~ rockshox@web-regional.net |
|                                           |
| LAN-Administration ~~~~~~~~~ CSC Ploenzke |
---------------------------------------------
|           Let Linux kill NT!!             |
|        Drive it like you stole it!!       |
---------------------------------------------
