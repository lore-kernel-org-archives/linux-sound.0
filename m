From: Dave Mielke <dave@mielke.cc>
Date: Tue, 18 Apr 2000 14:41:33 +0000
Subject: Re: Missing 16bit DMA channel
Message-Id: <marc-linux-sound-95607282017976@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95606803212331@msgid-missing>
In-Reply-To: <marc-linux-sound-95606803212331@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

[quoted lines by Peter Leif Rasmussen on April 18, 2000, at 09:52]

>I found in my pile of stuff an ESS1868 soundcard, which should be very SB
>compatible 

Check the comments at the top of "/usr/src/linux/drivers/sound/sb_ess.c". They
seem to be saying that the second DMA option is called "dma16", but that it
only specifies a 16-bit DMA if set to 5, and that all other values really refer
to 8-bit DMAs.

-- 
Dave Mielke           | 856 Grenon Avenue | I believe that the Bible is the
Phone: 1-613-726-0014 | Ottawa, Ontario   | Word of God. Please contact me
EMail: dave@mielke.cc | Canada  K2B 6G3   | if you're concerned about Hell.
