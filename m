From: Michele Debandi <s69901@cclix3.polito.it>
Date: Thu, 07 Jan 1999 15:31:44 +0000
Subject: Noisy sampling with OPL 3-sa2 card
Message-Id: <marc-linux-sound-91580463007651@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi all,
I have a K6/166 with Red Hat 5.2 installation and its 2.0.36 kernel 
sound driver. Under windows 95 I can sample from external sources
with an acceptable quality. When I try to record (for instance with
wawrec) something under linus I notice a slight noise. 
Seems to me that the anti alias filter remains wrongly selected.
How can I modify by hand the anti-alias cutoff filter frequency?
I think I can send an ioctl to /dev/dsp.

Mike
