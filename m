From: "W. L. Estes" <wlestes@uncg.edu>
Date: Tue, 01 Apr 2003 13:33:07 +0000
Subject: Re: azt1008 on HP Vectra
Message-Id: <marc-linux-sound-104920351624230@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-104912330303494@msgid-missing>
In-Reply-To: <marc-linux-sound-104912330303494@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I was looking through the linux-sound mail archives and saw a patch
posted for the azt1008 against linux kernel 2.4.20-rc1-ac4. That patch
didn't apply against kernel sources that I had (which isn't
surprising). It would seem like this problem has already been solved
so I was hoping that I could get the patch posted against 2.4.20 or
similar. The post I'm referring to is:

http://marc.theaimsgroup.com/?l=linux-sound&m3835842003582&w=2

On Tuesday, 01 April 2003,14:34 +0200, Robert.Siemer@gmx.de wrote:

> On Mon, Mar 31, 2003 at 01:53:38PM -0500, W. L. Estes wrote:
> > On Monday, 31 March 2003,17:05 +0200, Robert.Siemer@gmx.de wrote:
> > 
> > > Yeah, include the error messages.
> > 
> > /lib/modules/2.4.18-14/kernel/drivers/sound/ad1848.o: init_modlue: no such device
> 
> - I don't believe that this is the correct error message.
> - Further, look into the kernel ring buffer (dmesg) for more messages.
> - Use insmod and follow the dependancies manually.
> 
> 
> Robert

-- 
Will Estes
Unix Systems Programmer
UNCG MIS, Systems Group
