From: Ivan <ivan@gem.it>
Date: Sat, 26 Jun 1999 12:41:21 +0000
Subject: Re: SB Live Driver 0.2b under 2.2.10 and 2.0.36
Message-Id: <marc-linux-sound-93040122107118@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93038871301423@msgid-missing>
In-Reply-To: <marc-linux-sound-93038871301423@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On dom, 20 giu 1999, Martin Adler wrote:
> Got the following problem with the SBLive 0.2b driver under SuSE 6.0 with Kernel 2.2.10 and 2.0.36:
> 
> adler-martin-lnx:~ # insmod -f sblive
> Warning: kernel-module version mismatch
>         /lib/modules/2.2.10/misc/sblive.o was compiled for kernel version 2.2.5
>         while this kernel is version 2.2.10
> 
> /lib/modules/2.2.10/misc/sblive.o: unresolved symbol unregister_sound_dsp
> /lib/modules/2.2.10/misc/sblive.o: unresolved symbol unregister_sound_midi
> /lib/modules/2.2.10/misc/sblive.o: unresolved symbol register_sound_dsp
> /lib/modules/2.2.10/misc/sblive.o: unresolved symbol register_sound_mixer
> /lib/modules/2.2.10/misc/sblive.o: unresolved symbol unregister_sound_mixer
> /lib/modules/2.2.10/misc/sblive.o: unresolved symbol unregister_sound_special
> /lib/modules/2.2.10/misc/sblive.o: unresolved symbol register_sound_special
> /lib/modules/2.2.10/misc/sblive.o: unresolved symbol register_sound_midi
> adler-martin-lnx:~ #
> 
> I followed all the procedures in the readme file. Anyone have a solutions.
> 
> 
> Thanx alot,
> 
> Martin
> 
> ---------------------------------------------
> | Martin Adler ~~ rockshox@web-regional.net |
> |                                           |
> | LAN-Administration ~~~~~~~~~ CSC Ploenzke |
> ---------------------------------------------
> |           Let Linux kill NT!!             |
> |        Drive it like you stole it!!       |
> ---------------------------------------------
Hello,
I look my conf.modules ....
You copy it in your computer and then use insmod -f sblive
Thr message of warning is egual, but is O.k.

Bye
