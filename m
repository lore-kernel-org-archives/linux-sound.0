From: Balaguru Nallathambi <bala@ats.com>
Date: Wed, 13 Jan 1999 23:45:50 +0000
Subject: Re: SoundBlasterPCI128
Message-Id: <marc-linux-sound-91626166717503@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91584820831233@msgid-missing>
In-Reply-To: <marc-linux-sound-91584820831233@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

At 09:00 PM 1/13/99 +0100, you wrote:

To apply the patch all you have to do is

	zcat 2.0*patch*gz | patch -p0

	on the linux source tree.
	The source tree will have the patch applied now.
	Then you need to do a make clean, make config, make dep, make zImage
and use the boot image to load a new kernel.

	The problem I have is that I cannot see the ES1371 driver in the 
kernel configuration options. So I did not even make the kernel.

I guess we need help from some one who has successfully done this before.
If you get everything done right, let me know.

-)Bala.

>Hi,
> 
>> I downloaded the modular sound patch from Alan Cox's web site.
>> and applied it to kernel 2.0.36
>
>I'm trying the same at the moment.
>How did you apply the patch (and which, I read the
>2.0.34-modular-3.patch.gz should me the safest...)?
>
>Whenever I get the patch installed, I'm a step further!
>Thanks + bye
>	Georg
>
>
