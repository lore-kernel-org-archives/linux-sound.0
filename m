From: douglas irving repetto <douglas@roar.music.columbia.edu>
Date: Thu, 20 Jul 2000 05:15:07 +0000
Subject: sound/gui interaction
Message-Id: <marc-linux-sound-96407043600178@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


hi there linux-sound,


i'm working on a linux sound app. my signal processing loop runs in its
own thread. whenever i do a full drawing update of my GUI, i get a
glitch in the sound output. my CPU usage goes up during the redraw, but
not very much. does anyone know what's happening and how i can avoid it?
i would think that doing the graphics and the sound in seperate threads
would shield the one from the other, but apparently that's not the case.
is this an XWindows issue perhaps?

thanks,
douglas


-- 
                        douglas irving repetto 
                  http://music.columbia.edu/~douglas 
                the music-dsp mailing list and website:
                  http://shoko.calarts.edu/musicdsp
