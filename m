From: Erico Freitas <ericof@usa.net>
Date: Mon, 12 Apr 1999 02:39:11 +0000
Subject: no sound
Message-Id: <marc-linux-sound-92388527303902@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello all,

   I'm new to this list and I'm having a problem with my sound. I've looked at
the howto but I didn't get any clue as to what could have gone wrong.

   First, I've had sound for a while. A few days ago, when I was testing an
MPEG program, I couldn't hear any sound and even after I killed the program
there was no more sound. I rebooted the machine and now I have been getting
strange errors in the log

Here's an exerpt

Apr 11 19:46:15 peabrain modprobe: can't locate module sound-slot-0
Apr 11 19:46:15 peabrain modprobe: can't locate module sound-service-0-0
Apr 11 19:46:17 peabrain kernel: Soundblaster audio driver Copyright (C) by
Hannu Savolainen 1993-1996
Apr 11 19:46:17 peabrain kernel: sb: dsp reset failed.
Apr 11 19:46:17 peabrain insmod: /lib/modules/2.2.5-ac1/misc/sb.o: init_module:
Device or resource busy
Apr 11 19:46:17 peabrain modprobe: can't locate module sound-slot-0
Apr 11 19:46:17 peabrain modprobe: can't locate module sound-service-0-3
Apr 11 19:46:17 peabrain modprobe: can't locate module sound-slot-0
Apr 11 19:46:17 peabrain modprobe: can't locate module sound-service-0-3
Apr 11 19:46:39 peabrain modprobe: can't locate module sound-slot-0
Apr 11 19:46:39 peabrain modprobe: can't locate module sound-service-0-3

I don't know what could have gone wrong since it has been working up to a few
days ago. I've exausted my knowledge on the subject and I reach out to this
list.

I should also mention that from time to time I get a possible IRQ conflict
error. I haven't changed the IRQ or added any new hardware. Here's some
relevant info on the system

Linux 2.2.5ac1, glibc system AMD-K6 300 with built in sound on the board
(soundblaster compatible). Any ideas are greatly appreciated

Thanks,

--Erico.

  What we cannot speak about we must pass over in silence.
                -- Wittgenstein
