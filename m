From: Britton <fsblk@aurora.uaf.edu>
Date: Thu, 08 Jun 2000 18:26:45 +0000
Subject: how to find the maximum fragment size for SNDCTL_DSP_SETFRAGMENT?
Message-Id: <marc-linux-sound-96049072503276@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


The guide of 4front's web page says total_buffer_size/2.  I know the
kernel buffer size used to be defined at kernel compile time.  How does
one go about determining it now?  DSP_GETBLKSZ?  Does DSP_GETBLKSZ still
fix the block size so that the device must be closed and opened again in
order to set the fragment size?

Britton Kerin
