From: Stefan Gartner <Stefan.Gartner@fhs-hagenberg.ac.at>
Date: Fri, 02 Apr 1999 10:05:08 +0000
Subject: re:real player
Message-Id: <marc-linux-sound-92304829417577@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I use realplayer 5.0.0.35 with RedHat 5.2 and kernel 2.2 and I have no problems
with it.
The patch at  http://www.i2k.com/~jeffd/rpopen includes a script (see below)
which I saved as /usr/bin/rplayer. Instead of directly invoking rvplayer I
execute this script and everything works fine.
Stefan

----snip----
#!/bin/ash
dir=/usr/lib/Real
export LD_LIBRARY_PATH=$dir LD_PRELOAD=$dir/open.so
exec $dir/rvplayer "$@"
--
chaos is the future and beyond it is freedom
