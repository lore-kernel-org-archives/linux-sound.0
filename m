From: Alan Cox <alan@redhat.com>
Date: Sun, 26 Mar 2000 01:51:14 +0000
Subject: Re: sb_dsp_detect
Message-Id: <marc-linux-sound-95405647817569@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95405563817088@msgid-missing>
In-Reply-To: <marc-linux-sound-95405563817088@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

>  That's the prototype of the func in subj:
> 
> int sb_dsp_detect(struct address_info *hw_config, int pci, int pciio)
> 
> the two pci parameter, AFAIK, are not used
> by anyone. Since i'm going to change that prototype
> to fix a bug, i can get them off while i'm there.
> 
> The related pci code seems unused to me..
>  should i leave it there?

Its related to some hacking on SB compatibles. Can you leave it for now. Someone
is having another crack at the yamaha shit and will need it
