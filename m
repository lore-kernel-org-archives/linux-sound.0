From: Jonathan Masters <mastersj@periscope-systems.freeserve.co.uk>
Date: Thu, 19 Aug 1999 04:47:57 +0000
Subject: FIXED
Message-Id: <marc-linux-sound-93506414424969@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,
    You know that little sound problem from ealier on? well, it turns
out that all I needed to do was symlink the sound modules to any
different name and then load them twice with the appropriate parameters.
It's *very* cool now that I've got two sbs working together. Will get
midi working on the second card when I've got some time.....

I find "cat /dev/audio > /dev/audio1" to give some kind of strange
satisfaction - now that just says thatI'm far too tired and just plain
odd, etc.... :)

--
Jonathan C. Masters (jonathan@oxlug.org) PGP: www.brookes.ac.uk/~95227860/KEY

"Upon this rock I will build my church
and the gates of hell shall not prevail against it". -- Matthew 16, 17-18
