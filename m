From: Ivan <ivan@gem.it>
Date: Sat, 26 Jun 1999 12:44:44 +0000
Subject: Re: SB Live Driver 0.2b under 2.2.10 and 2.0.36
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-=_nWlrBbmQBhCDarzOwKkYHIDdqSCD"
Message-Id: <marc-linux-sound-93040130007167@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93038871301423@msgid-missing>
In-Reply-To: <marc-linux-sound-93038871301423@msgid-missing>
To: linux-sound@vger.kernel.org


--Boundary-=_nWlrBbmQBhCDarzOwKkYHIDdqSCD
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

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

--Boundary-=_nWlrBbmQBhCDarzOwKkYHIDdqSCD
Content-Type: text/plain;
  name="conf.modules"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="conf.modules"

YWxpYXMgc2NzaV9ob3N0YWRhcHRlciBhaWM3eHh4CmFsaWFzIHBhcnBvcnRfbG93bGV2ZWwgcGFy
cG9ydF9wYwpwcmUtaW5zdGFsbCBwY21jaWFfY29yZSAvZXRjL3JjLmQvaW5pdC5kL3BjbWNpYSBz
dGFydAphbGlhcyBzb3VuZCAgIHNibGl2ZSAKcHJlLWluc3RhbGwgc2JsaXZlIGluc21vZCBzb3Vu
ZGNvcmUKcG9zdC1yZW1vdmUgc2JsaXZlIHJtbW9kIHNvdW5kY29yZQo=

--Boundary-=_nWlrBbmQBhCDarzOwKkYHIDdqSCD--
