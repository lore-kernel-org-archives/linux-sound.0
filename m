From: Raymond J Huber <rhuber@net-gate.com>
Date: Sat, 06 Feb 1999 00:05:41 +0000
Subject: Two Mixers
Message-Id: <marc-linux-sound-91825947820937@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello,

I installed two SoundBlaster compatible sound cards in my RedHat 2.0.34
machine.  Sound plays correctly to either card using cat soundfile >>
/dev/audio or cat soundfile >> /dev/audio1.  The problem is is that when
trying to access the mixer device file for the second card, /dev/mixer1,
I get a device not configured error.  I have tried reversing the order
of the cards, and I get the same problem, so I don't think there is any
hardware problem.  What needs to be done to get the second mixer
configured.  Are two mixers even supported?

Thank you,
Raymond Huber
