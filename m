From: Paco <paco@OhKeePa.Net>
Date: Thu, 06 Apr 2000 01:03:22 +0000
Subject: New problem...
Message-Id: <marc-linux-sound-95498321922404@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Me again...

After I finally got my SB-PCI512 working, I've now
discovered that when I start up "gmix" to adjust the
mixer levels, something happens to the emu10k1 module
that prevents me from playing or recording from that
point on.  Basically "gmix" kills my card.

The only way to get it working again is to "rmmod"
followed by "modprobe" for the emu10k1.

Anybody else experienced anything like this?

-Paco
