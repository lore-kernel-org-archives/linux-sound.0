From: Jim Jackson <jj@scs.leeds.ac.uk>
Date: Wed, 16 Feb 2000 09:13:42 +0000
Subject: Re: documentation on SNDCTL_DSP_SETFRAGMENT exist?
Message-Id: <marc-linux-sound-95069272427405@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95065201132560@msgid-missing>
In-Reply-To: <marc-linux-sound-95065201132560@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


There's not much to cover. It is used to set the size of the buffer
fragments and how many of them you want. The only complication is 
is that the fragment size is specified as the power of 2 of the size of
the fragment - e.g. for 1024byte frags the value 10 is used, 1024=2^10.
The number of buffers is held in the top 16bits of an int and the 
power of 2 of the buffer fragment in the bottom 16 bits.

If /dev/dsp is open on fd, N is the number of fragments, and E is the
power of 2 of the fragment size....

   int fr=(N<<16)+E;
   if (ioctl(fd, SNDCTL_DSP_SETFRAGMENT , &fr) < 0) {
      Error_Stuff;
   }


Choosing a fragment size depends on the application. If you have somesort
of "interactive" app generating audio samples then you probably want
smallish fragments holding somewhere between 10 or 100 millisecs of
samples (depending on what you concept of interactive is :-) and as few as
possible so you don't have too much buffered ahead, yet have enough
samples buffered so you don't get breakup due to running out of samples.
If there is no "interactive" element, often a few large fragments will
suffice.



On Tue, 15 Feb 2000, Eric Mitchell wrote:

> 
> http://www.4front-tech.com/pguide/audio2.html
> 
> see the section, "Selecting buffering parameters"
> 
> Britton Leo Kerin wrote:
> > 
> > Does anyone know of any documentation of any kind (book, howto,
> > anything) out there which covers this feature?
> > 
> > Thanks,
> > Britton Kerin
> 
> 
