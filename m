From: Dirk Nehring <dnehring@telemedia.de>
Date: Wed, 30 Dec 1998 22:51:22 +0000
Subject: AWE32 PNP not working with 2.1.13x/2.2.0-prex
Message-Id: <marc-linux-sound-91510467032044@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

Hi,

it is impossible to run my AWE32 PNP with a prestine 2.1.13x or higher
kernel. It works flawlessly under 2.0 and 2.0 with the commercial OSS
drivers. I use the same settings under 2.1, but it failed:

root@titan:~$ modprobe sb
SB 4.13 detected OK (220)
sb: Interrupt test on IRQ5 failed - Probable IRQ conflict

isapnp.conf is correct:

[...]
#     ANSI string -->Creative SB AWE32 PnP<--
(CONFIGURE CTL0043/80381 (LD 1
#     ANSI string -->Audio<--
 (INT 0 (IRQ 5 (MODE +E)))
 (DMA 0 (CHANNEL 1))
 (DMA 1 (CHANNEL 5))
 (IO 0 (BASE 0x0220))
 (IO 1 (BASE 0x0330))
 (IO 2 (BASE 0x0388))
 (ACT Y)
))
[...]

It also doesn't work with other tested interrupts.

Do anyone have an idea?

Dirk

--
Dirk Nehring                 | Phone: +49 5241 80-<censored>
Telemedia Bertelsmann AG     | Fax:   +49 5241 80-9518
Carl-Bertelsmann-Str. 161 I  | E-Mail: dnehring @ telemedia.de
33311 G=FCtersloh              |
