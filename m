From: Dave Wreski <dave@nic.com>
Date: Sun, 13 Sep 1998 00:51:20 +0000
Subject: Re: AWE64 initial questions
Message-Id: <marc-linux-sound-90564810221946@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90515879913606@msgid-missing>
In-Reply-To: <marc-linux-sound-90515879913606@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


On 12-Sep-98 rtlynch@aracnet.com wrote:
> I would like to work on this.  I've been running linux for a while now but
> never have bothered with sound. The last time I compiled my kernel I
> included sound as a module but haven't made time to play around with
> getting the plug-n-prey to work.  This would be good experience for me as
> well as force me to finish my system setup :->
> 
> I was thinking of just implementing the script with perl. (Seems easy
> anough.)  Are there any common pit falls that anyone can think of?  

Guys, while I think this is a good idea, and something that surely can help a
lot of people, perhaps your efforts would be better applied if you focused on
the sndconfig utility that already has a moderately-working implementation.

Wouldn't it be better to start with the internals of sndconfig, port it to your
version of Linux, and resubmit the changes back to the maintainer of sndconfig?

Perhaps someone wants to make it gtk-capable, so we can have a graphical means
of controlling our PnP devices...

Dave
