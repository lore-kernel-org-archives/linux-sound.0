From: Magic Phibo <phibo@gmx.li>
Date: Thu, 04 Oct 2001 16:26:45 +0000
Subject: Re: Problems recording sound with ISAPnp Soundcard since Kernel-2.4.x
Message-Id: <marc-linux-sound-100221335202895@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-100220329623616@msgid-missing>
In-Reply-To: <marc-linux-sound-100220329623616@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Thu, 04 Oct 2001, Bill Nottingham wrote:
>Magic Phibo (phibo@gmx.li) said: 
>> I also tried the new isapnp support (included since Kernel-2.4.x) as module or
>> directly in the kernel. Here is the output of 'dmesg':
>
>If you use the new isapnp support, make sure you do *not* use
>userland ISAPnP at the same time. They don't mix.
>

Yes I know and didn't mix them. I included a check for existence of
/proc/isapnp before execution of the userland ISAPnp in the rc-script
/etc/rc.d/rc.sysinit. So, if isapnp support is included in the kernel, the file
/proc/isapnp is created upon detection of the ISAPnp card and therefore,
the userland ISAPnp won't be executed.

Thanks anyway !


Cheers,
Phibo
