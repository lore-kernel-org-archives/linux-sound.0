From: Maddog Abel <mad.dog@alumni.ust.hk>
Date: Wed, 09 Sep 1998 14:39:06 +0000
Subject: Re: AWE64 initial questions
Message-Id: <marc-linux-sound-90535745318629@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90515879913606@msgid-missing>
In-Reply-To: <marc-linux-sound-90515879913606@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

insmod sound
cat /dev/sndstat

Maddog


Dave Wreski wrote:
> 
> After using 'isapnp /etc/isapnp.conf', how can I tell it worked?  It didn't
> complain, but there was also no information available in the normal /proc files,
> such as /proc/{interrupts,dma,ioports} etc..  Should there be, or only after the
> sound module is installed?
