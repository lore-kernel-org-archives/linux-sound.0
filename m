From: sbenno@gardena.net
Date: Thu, 05 Aug 1999 17:03:36 +0000
Subject: Re: MPEG Support
Message-Id: <marc-linux-sound-93387261613673@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93371079221997@msgid-missing>
In-Reply-To: <marc-linux-sound-93371079221997@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org



On Thu, 05 Aug 1999, Thomas Sailer wrote:
> "Jonathan C. Masters" wrote:
> > 
> > I have to disagree with you here. I believe that MPEG audio decoding/encoding
> > and MPEG video decoding/encoding optional devices such as /dev/mpad /dev/mpae
> > /dev/mpvd /dev/mpve would be emensely useful. It would save so much rewritten
> > code (libraries are never quite as good as they sound) and my programs would
> 
> Why should a library be worse than kernel code?
> 
> Furthermore, in the kernel, you can't use:
> - MMX
> - Floating point
> - KNI or ISSE or 3dNOW.

Tom, could you please explain why we can't use these instructions in kernel
mode ?
I thougth that Linux don't use FP due to performance reasons, but not
because it's not allowed.
RT Linux seems to have some FP restrictions as well, but I think this is
due to the fact that FP instructions could cause exceptions, which might
ruin RT responsiveness by a few usecs.
:-)

> 
> So kernel code will be slower than usermode code.
> 
> > instantaneously become much more enhanced. Besides, since MPEG decoding/encoding
> > cards are popular these days, you begin to see the speed required (so much so
> 
> Please name one that does MPEG _AUDIO_, I don't know one. (I know
> about MPEG video cards...)

Agreed, just provide a standard mpeg library with a well defined API , that
every audio app can use easily.


> 
> Tom

Benno.
