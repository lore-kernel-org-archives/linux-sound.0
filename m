From: David Ronis <ronis@ronispc.chem.mcgill.ca>
Date: Mon, 04 Dec 2006 19:01:34 +0000
Subject: hda-intel broken under 2.6.19
Message-Id: <1165258894.5776.9.camel@ronispc.chem.mcgill.ca>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: linux-sound@vger.kernel.org

I've just upgraded a i686 dual box from 2.6.18.3 to 2.6.19 on a .  (I
had been running ALSA 1.0.13.rc3 and also upgraded to the release for
for library and utility programs).  The hda-intel driver had problems
with initializing the mic (e.g., using skype for linux), but played
sound properly.  Since upgrading, that no longer works (e.g, using aplay
or mpg123).

I've reconfigured alsa, and upgraded the libs and utils to the 1.0.13
release.

Anybody else have this problem?  Any suggestions?

David



