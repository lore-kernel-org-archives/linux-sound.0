From: Cornelius Creedon <neil@box1.staller.sunysb.edu>
Date: Fri, 12 Mar 1999 00:05:02 +0000
Subject: Re: solo-1 chip
Message-Id: <marc-linux-sound-92119789313190@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92066824429576@msgid-missing>
In-Reply-To: <marc-linux-sound-92066824429576@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Thu, 11 Mar 1999, Dan Boger wrote:

> On Thu, 11 Mar 1999 01:10:13 -0500 Bill Nottingham <notting@redhat.com> wrote
>  concerning 'Re: solo-1 chip':
> > 
> > To get native ESS Solo support ATM, you'd either have to use the
> > 2.2.*-ac patches (ftp.linux.org.uk:/pub/linux/alan/2.2), or ALSA
> > (http://alsa.jcu.cz/)
> 
> Great!  So I download the alsa driver install it.  But when I try to
> modprobe it says that the device is already in use.  I look at

i have seen this error when trying to load the sb module and it seemed to
happen simply because i did not specify enough or the right options.

> proc/modules, it did load a bunch of stuff, but still no sound.  Do I
> need to edit my /etc/conf.modules for options?  The solo1 isn't
> mentioned in any of the documents - how do I know the name of the
> options?

i believe the names of the options are uniform, at least the generic ones.
try io=0x... irq=... dma1=... and such.

you can supply these on the command line, until you get it working, then
put the right values into your conf.modules
ie 'modprobe ess-solo irq=x io=0xwhatever ...'

-cc
