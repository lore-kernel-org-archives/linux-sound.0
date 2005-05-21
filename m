From: Hal MacArgle <haltec@kvinet.com>
Date: Sat, 21 May 2005 18:37:15 +0000
Subject: ALSA and Rexima/Aumix??
Message-Id: <20050521183715.GA750@lnx2.w8mch.ampr.org>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


Greetings: In the process of changing over my Slack9.1 machines from
default OSS to ALSA I find I lose two of my favourite Mixers; Rexima
and Aumix.. 

I've been using alsamixer but it's too powerful for simple quick
volume adjustments, etc.. I would like to use a simple/lean mixer...

I've installed all four ALSA packages: alsa-driver/lib/oss/utils but
I still get a "rexima: couldn't open /dev/mixer" when invoked.. Same
thing with Aumix..

I know both those mixers were written during OSS days but was
wondering if anyone figured out how to run them on an ALSA machine..
I've written a script to rmmod all the 13 Alsa modules but it would
be nice to not have to do that since ALSA is now my "standard." It's
obvious that only one scheme can be used at a time; at least with me.
<grin>

TIA and Cheers,
-- 

    Hal - in Terra Alta, WV - Slackware GNU/Linux 9.1  (2.4.22)
.
