From: Bill Nottingham <notting@redhat.com>
Date: Mon, 05 Oct 1998 20:56:50 +0000
Subject: Re: ESS 488 and 688
Message-Id: <marc-linux-sound-90762810108936@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90738040829096@msgid-missing>
In-Reply-To: <marc-linux-sound-90738040829096@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Matthew Kirkwood (weejock@ferret.lmh.ox.ac.uk) said: 
> On Mon, 5 Oct 1998, Thomas Sailer wrote:
> 
> > Newer ESS chips like the 1688 have their own 16bit mode,
> > which should be supported by Linux (haven't tried for quite some
> > time tough).
> 
> Out of curiousity, should an ESS1868 work?  I've never had any success,
> with mine but then I didn't bother configuring it with isapnptools.

Ah - there's your problem. Assuming you use isapnptools to
configure it to something sane, it should work pretty much
out of the box with the SB driver.

Bill
