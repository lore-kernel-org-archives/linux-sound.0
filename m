From: Zach Brown <zab@redhat.com>
Date: Fri, 29 Oct 1999 15:02:38 +0000
Subject: next to last maestro update? (fwd)
Message-Id: <marc-linux-sound-94122443129261@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


oh my goodness guys, I'm such a dork for not sending this your way...

---------- Forwarded message ----------
Date: Fri, 29 Oct 1999 09:40:59 -0400 (EDT)
From: Zach Brown <zab@redhat.com>
To: linux-kernel@vger.rutgers.edu
Subject: next to last maestro update?

Good morning audible primates.

v0.10 of the OSS maestro driver is on http://people.redhat.com/zab/maestro

it finally fixes the memory scribbling, I hope.  It also has some minor
fixes that made it work on some laptops.  Please do give this one a spin,
it should be stable.

the next hurdle is to fix up the proper LRLR support so that mmap() (read:
quake) works :)

Zach Brown <zab@redhat.com> -- Software Princess
