From: r.c.m.derooij@twi.tudelft.nl (Ruud de Rooij)
Date: Thu, 14 Jan 1999 10:41:07 +0000
Subject: Re: Noisy sampling with OPL 3-sa2 card
Message-Id: <marc-linux-sound-91631083005044@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91580463007651@msgid-missing>
In-Reply-To: <marc-linux-sound-91580463007651@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

> I have a K6/166 with Red Hat 5.2 installation and its 2.0.36 kernel 
> sound driver. Under windows 95 I can sample from external sources
> with an acceptable quality. When I try to record (for instance with
> wawrec) something under linus I notice a slight noise. 
> Seems to me that the anti alias filter remains wrongly selected.
> How can I modify by hand the anti-alias cutoff filter frequency?
> I think I can send an ioctl to /dev/dsp.

I have a similar problem, and was wondering whether you found a solution 
already.

I have an intel AL440LX mainboard with integrated OPL3-SA3.  I am using the
opl3sa2 driver from 2.2.0-pre6, which detects my card correctly.  I get a loud
background noise whenever I try to record something.  In win98 it works OK.

Greetings,

Ruud de Rooij.

PS: linux-sound readers: i am not subscribed, please Cc: responses to me.
-- 
Ruud de Rooij
r.c.m.derooij@twi.tudelft.nl
http://sepc.twi.tudelft.nl/~derooij/
