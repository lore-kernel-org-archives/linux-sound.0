From: qozmo x xx <qozm0@juno.com>
Date: Wed, 21 Apr 1999 05:51:13 +0000
Subject: why no midi?
Message-Id: <marc-linux-sound-92467332609462@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

hey, i'm running redhat5.2 on my machine and i used sndconfig to
configure my soundblaster16 card.  everything that i've tested so far
works fine (it plays sound samples and records sound samples), with the
exception of playing midi.  i've tried calling playmidi with this
command:

playmidi filename.mid

maybe there are other options that i need in this command, but as far as
i could discern from reading the playmidi man page, this should play my
file (but i've been wrong before).
if i'm not wrong, and this command should play my midi file, what
possible problems could be causing this?  the card actually uses 2 DMA
settings under win95 and i just used the first of those when i set up
sound in linux, could this have anything to do with it?
hopin somebody can help me out,
qozmo

ps- yeah, i already read the entire sound-howto
___________________________________________________________________
You don't need to buy Internet access to use free Internet e-mail.
Get completely free e-mail from Juno at http://www.juno.com/getjuno.html
or call Juno at (800) 654-JUNO [654-5866]
