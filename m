From: Brian Craft <bcboy@dorothy.wanglab.brandeis.edu>
Date: Wed, 27 Jan 1999 07:07:38 +0000
Subject: sb16 woes
Message-Id: <marc-linux-sound-91742302922933@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hey -- I just picked up a isa pnp card that was sold  as a sb16. It
reports itself as a vibra 16.

It also reports that it has 2 8 bit DMA, instead of one 8 and one 16.

The sb module will load, but it always reports a IRQ/DRQ problem during
playback.


What's up with these boards? Do they do 16 bit audio? Do they work
on linux?

I'm using rh5.2.

b.c.
