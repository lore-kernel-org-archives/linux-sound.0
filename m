From: Juan Lupion <lupi@face.el.uma.es>
Date: Wed, 09 Sep 1998 15:03:35 +0000
Subject: Re: AWE64 initial questions
Message-Id: <marc-linux-sound-90535794918853@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90515879913606@msgid-missing>
In-Reply-To: <marc-linux-sound-90515879913606@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

> After using 'isapnp /etc/isapnp.conf', how can I tell it worked?  It didn't
> complain, but there was also no information available in the normal /proc files,
> such as /proc/{interrupts,dma,ioports} etc..  Should there be, or only after the
> sound module is installed?

I f*cked my isapnp.conf config using RedHat's sndconfig. If it
works for you, MY mileage varied. I used pnpdump and then
edited the file by hand, remembering my Win95 setup. No problem
then.  I forgot to uncomment the wave synth section (I had
some headaches till I found the commented entries!)     

There was also a problem with /etc/conf.modules and the dma
entries.  (if you get a error like 'sound: too many values for dma') 
you have the problem. If you see 'AWE32 detected (512k RAM)' 
after loading the module, everything is ok.

> > Remember that you have to download a sound font bank to the Wave table
> > with a command like this:
> > 
> > /usr/local/bin/sfxload
> > /win95/Programme/Creative/ctsnd/sfbank/synthgs.sbk
> Where can I find these necessary files?

In your AWE64 CD (installed automatically when using Windows).  
Remember to tweak the command line parameters to sfxload,you
may experience better sound using the -atenuate option. 

> Any idea why an RPM hasn't been created for the SBAWE64 yet?  I would think this
> methodical process would be easy to create an RPM for...

I havent seen RPMs of patched kernels... 

---------------------------------------------------------------------
J.Lupion Lopez              |   
http://face.el.uma.es/~lupi |   [[[ In Stereo where available ]]]
                            |
---------------------------------------------------------------------
