From: Bill Davidsen <davidsen@tmr.com>
Date: Sun, 26 Dec 2004 00:31:02 +0000
Subject: Using more than 2 channels with i810
Message-Id: <cqkvii$bkj$1@gatekeeper.tmr.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I would have sworn there was a module load parameter to use more than 
two channels on this chip, but the only way I see in the source is to 
use an ioctl which doesn't seem to be available in any common software. 
Much as I would like to get another user to move from Windows to Linux, 
I'm not going to hack one of the mixer programs for him to use all the 
channels.

Any thoughts?

ASUS P4P800, i82801EB/ER chipset AC97, i810_audio driver in FC1 (2.4.22 
base).

-- 
bill davidsen <davidsen@tmr.com>
   CTO TMR Associates, Inc
   Doing interesting things with small computers since 1979
