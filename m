From: Matthew Xavier <matthew.xavier@mnsu.edu>
Date: Sun, 24 Aug 2003 16:26:07 +0000
Subject: ICH5 with AD1985 codec
Message-Id: <marc-linux-sound-106174238826940@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I have a motherboard with onboard sound from Intel's ICH5 southbridge 
through an Analog Devices AD1985 AC97 codec.  I have added the device 
IDs for the ICH5 to the i810_audio driver, and it appears to work.  My 
problem is that the wrong jack is being activated as line out--I have to 
plug my speakers to the line in jack in order to get sound.  I've looked 
up the AD1985, and it's supposed to have configurable jacks, so maybe 
this is the problem.  I noticed in the ac97_codec driver that some 
codecs have custom initialization, including the AD1886.  I'm using a 
2.4.21 kernel patched for XFS and supermount.  I'm willing to hack the 
drivers myself, if someone can give me insight on what's necessary ...

Matthew Xavier


