From: <rtlynch@aracnet.com>
Date: Sat, 12 Sep 1998 19:54:21 +0000
Subject: Re: AWE64 initial questions
Message-Id: <marc-linux-sound-90563086317468@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90515879913606@msgid-missing>
In-Reply-To: <marc-linux-sound-90515879913606@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I would like to work on this.  I've been running linux for a while now but
never have bothered with sound. The last time I compiled my kernel I
included sound as a module but haven't made time to play around with
getting the plug-n-prey to work.  This would be good experience for me as
well as force me to finish my system setup :->

I was thinking of just implementing the script with perl. (Seems easy
anough.)  Are there any common pit falls that anyone can think of?  

	- Rusty Lynch (rtlynch@aracnet.com)

On Sat, 12 Sep 1998, Hamish Moffatt wrote:

> On Fri, Sep 11, 1998 at 11:59:04AM -0700, Adam Wiggins wrote:
> > At the moment I think a little shell script which worked like xf86config
> > or even the kernel "make config" would be a big improvement.  Ie, it just
> > seds the pnpdump file and gives you options:
> > 
> > % pnpsetup
> > Detected: "Creative Labs PnP Sound Chip"
> > Use this device? (y/n) y
> > What IO base? (220, 240, 260, 280, 2A0, 300) 280
> > What IRQ? (5, 7, 9, 10, 11) 10
> 
> Actually, that does sound pretty cool. I might write it, unless
> someone else has more time than I do (not hard) or more interest than I do
> and wants to volunteer. I'll test it; I have PnP sound cards
> and modems here, although not in the same box.
> 
> 
> Hamish
> 
