From: Greg KH <greg@kroah.com>
Date: Mon, 08 Nov 2004 19:00:40 +0000
Subject: Re: Oops in 2.6.10-rc1
Message-Id: <20041108190040.GC27386@kroah.com>
List-Id: <linux-sound.vger.kernel.org>
References: <418D7959.4020206@g-house.de> <Pine.LNX.4.58.0411062244150.2223@ppc970.osdl.org> <20041107130553.M49691@g-house.de> <418E4705.5020001@g-house.de> <Pine.LNX.4.58.0411070831200.2223@ppc970.osdl.org> <20041107182155.M43317@g-house.de> <418EB3AA.8050203@g-house.de> <Pine.LNX.4.58.0411071653480.24286@ppc970.osdl.org> <418F6E33.8080808@g-house.de> <84144f0204110810444400761f@mail.gmail.com>
In-Reply-To: <84144f0204110810444400761f@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pekka Enberg <penberg@gmail.com>
Cc: Christian Kujau <evil@g-house.de>, Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@osdl.org>, alsa-devel@lists.sourceforge.net, linux-sound@vger.kernel.org, penberg@cs.helsinki.fi

On Mon, Nov 08, 2004 at 08:44:37PM +0200, Pekka Enberg wrote:
> Hi Christian,
> 
> On Mon, 08 Nov 2004 14:01:39 +0100, Christian Kujau <evil@g-house.de> wrote:
> > i've put everthing on http://www.nerdbynature.de/bits/prinz/2.6.10-rc1/
> > the .configs, the oopses are there. i've double checked a kernel built
> > from "bk -a a1.2000.7.2" yesterday but the result was the same (no oops)
> 
> Just to update, I cannot reproduce the oops with your config (nor
> mine) on my machine running 2.6.10-rc1-bk14.

But 2.6.10-rc1-bk15 does have the problem?

Trying to figure out where the issue is...

greg k-h
