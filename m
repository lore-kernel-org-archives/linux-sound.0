From: Christian Brandt <brandtc@psi5.com>
Date: Sat, 03 Oct 1998 04:35:17 +0000
Subject: Re: ESS 488 and 688
Message-Id: <marc-linux-sound-90738843931171@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90738040829096@msgid-missing>
In-Reply-To: <marc-linux-sound-90738040829096@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Tony Nugent wrote:

> > What are the settings in 'make menuconfig' for
> > ESS Technologies 488 and 688 sound cards when
> > I'm configuring the kernel?  Are they SB16 clones?
> 
> I have (in the past) used both these cards configured as SB16 clones.
> (Also had /dev/sbcd working to use cdroms hanging off them).

 You configured them as generic SB-Clones, to be precise, as SB8pro.

 There are no SB16-compatible cards out there. None at all.

 This means, ESS-Boards tend to run only at 8Bit.

-- 
Christian Brandt

 Life is short and in most cases it ends with death - Sir Sinclair
