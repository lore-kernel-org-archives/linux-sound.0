From: Bill Nottingham <notting@redhat.com>
Date: Wed, 09 Sep 1998 21:03:42 +0000
Subject: Re: AWE64 initial questions
Message-Id: <marc-linux-sound-90538694432647@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90515879913606@msgid-missing>
In-Reply-To: <marc-linux-sound-90515879913606@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Dave Wreski (dave@nic.com) said: 
> Ok, as it turns out, I did get it going.  I used the sndconfig program found at
> ftp.redhat.com:/pub/sound/ and it generated an /etc/isapnp.conf file identical
> to yours.  Has anyone else used this program, or must I go to
> redhat-sound@redhat.com for questions on this?

Actually, that's sound-list@redhat.com. But no, you don't need to
go there.

> After using 'isapnp /etc/isapnp.conf', how can I tell it worked?  It didn't
> complain, but there was also no information available in the normal /proc files,
> such as /proc/{interrupts,dma,ioports} etc..  Should there be, or only after the
> sound module is installed?

No; the information will only show up in /proc after the resources
have been allocated by the kernel (i.e., the drivers have been loaded).

> > Remember that you have to download a sound font bank to the Wave table
> > with a command like this:
> > 
> > /usr/local/bin/sfxload
> > /win95/Programme/Creative/ctsnd/sfbank/synthgs.sbk
> 
> Where can I find these necessary files?

sfxload is part of the awesfx package, available from
	http://bahamut.mm.t.u-tokyo.ac.jp/~iwai/awedrv/index.html
There's an RPM in contrib (I haven't tested it, but it should work
fine).

synthgm.sbk/synthgs.sbk should be on your AWE64 driver disk/CD.

Bill
