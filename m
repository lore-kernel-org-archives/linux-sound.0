From: Peter Leif Rasmussen <plr@cedara.com>
Date: Tue, 18 Apr 2000 15:00:35 +0000
Subject: Re: Missing 16bit DMA channel
Message-Id: <marc-linux-sound-95607403219156@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95606803212331@msgid-missing>
In-Reply-To: <marc-linux-sound-95606803212331@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Dave Mielke wrote:
> 
> [quoted lines by Peter Leif Rasmussen on April 18, 2000, at 09:52]
> 
> >I found in my pile of stuff an ESS1868 soundcard, which should be very SB
> >compatible
> 
> Check the comments at the top of "/usr/src/linux/drivers/sound/sb_ess.c". They
> seem to be saying that the second DMA option is called "dma16", but that it
> only specifies a 16-bit DMA if set to 5, and that all other values really refer
> to 8-bit DMAs.
> 
Yes, I looked and I found in that file:

 * Full duplex is enabled by specifying dma16. While the normal dma must
 * be one of 0, 1 or 3, dma16 can be one of 0, 1, 3 or 5. DMA 5 is a 16 bit
 * DMA channel, while the others are 8 bit..

As duplex is what I am looking for. 

This comment (if still valid) seems to indicate that even a second 8bit DMA 
channel will make the driver work in full duplex, and only if you really need
a 16bit DMA channel you can specify that. The documentation doesn't give any
indication of this, so thank you for pointing it out. I couldn't yesterday
make it work, though, but will try a little harder now knowing that this
card probably should work.

As ESS is closely wedded to SB why then can't a true SB card, eg. the 
SB Vibra 16, be made to use the second 8bit DMA channel in duplex mode?

Thanks,

Peter
