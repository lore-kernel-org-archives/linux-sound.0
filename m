From: Tony Nugent <Tony.Nugent@usq.edu.au>
Date: Tue, 29 Dec 1998 07:03:30 +0000
Subject: problems with cdda2wav and other audio CDROM ripping software
Message-Id: <marc-linux-sound-91491718927482@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

For the life of me I just can't get cdda2wav to work on my RH5.1/5.2
box!

% cdda2wav -q -e -t2 -d0 -N -D /dev/cdrom

(and lots of variants) just produces ugly noise.  Same for cdparanoia
- the wav files it creates sound like a ham radio between signals :)

And I can't get 8hz-mp3 to compile (there's a bunch of missing
ieee*.h header files).  So "ripperX" is useless.

I'd really like to do some audio cdrom ripping (to do audio cdrom
copies and to make some mp3 disks), but I'm at a loss to know what to
use.

Can anyone point me in the direction of something (anything!!) that
*works* ??

(rpm format would be ideal, but I'll use anything - just as long as it
works :)

Many thanks.

Cheers
Tony
