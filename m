From: "Ravi K. Swamy" <rks@rtp.mea.com>
Date: Sat, 30 Oct 1999 20:04:53 +0000
Subject: Problem with ESS Solo1
Message-Id: <marc-linux-sound-94131439128758@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello,
   I've noticed a possible bug when playing realaudio files or the new
game Unreal Tournament.  I have an ESS Solo1 card, lspci shows it as:

00:0d.0 Multimedia audio controller: ESS Technology ESS 1969 (rev 01)

I've tried out both 2.2.12 and 2.3.24, and SMP and non-SMP on two different
machines and noticed the same thing.  

When playing realaudio files with the new g2 player it sounds like the
sound is played back 1000 times faster than it should be, none of the
options in the player seem to help.  The same thing happens to sounds
in Unreal Tournament.  Most sound programs work fine, x11amp/xmms, mpg123,
sox/play for wav files, q3test, all work fine.

Is this a known bug?  I know that the realaudio player for linux has been
quite buggy and unreal tournament is still just a demo but I thought I would
ask if anyone has seen this behavior before.

Ravi Swamy
