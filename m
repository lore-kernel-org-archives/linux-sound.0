From: Ari Pollak <compwiz@bigfoot.com>
Date: Wed, 16 Feb 2000 20:20:08 +0000
Subject: 2.3.46-2 & mixers
Message-Id: <marc-linux-sound-95073748931967@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I found something very odd with es1371/ac97_codec. When I use any of my
graphical mixers to adjust the volume (aumix, gmix, xmixer), the prog
segfaults and i get a kernel oops. However, if i use aumix-minimal to
adjust an individual volume, it seems to work. If i try to save the mixer
settings with aumix-minimal, that segfaults as well.
