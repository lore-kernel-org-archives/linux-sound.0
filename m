From: Dave Wreski <dave@nic.com>
Date: Wed, 09 Sep 1998 20:03:30 +0000
Subject: Re: AWE64 initial questions
Message-Id: <marc-linux-sound-90537837629237@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90515879913606@msgid-missing>
In-Reply-To: <marc-linux-sound-90515879913606@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


> > After using 'isapnp /etc/isapnp.conf', how can I tell it worked?  It
> > didn't complain, but there was also no information available in the
> > normal /proc files, such as /proc/{interrupts,dma,ioports} etc.. 
> > Should there be, or only after the sound module is installed? 
> 
> I f*cked my isapnp.conf config using RedHat's sndconfig. If it
> works for you, MY mileage varied. I used pnpdump and then
> edited the file by hand, remembering my Win95 setup. No problem
> then.  I forgot to uncomment the wave synth section (I had
> some headaches till I found the commented entries!)     

I think the version I used was just released a day or so before I used it.
Perhaps the problems you had have been fixed now.  It's still got some
problems, however, but I managed to trick it into working.

I think it's very important that sound works effortlessly on Linux.  The
average Window's convert won't have the patience to go thru all these
steps...

Dave
