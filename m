From: Dave Wreski <dave@nic.com>
Date: Thu, 10 Sep 1998 03:10:09 +0000
Subject: Re: AWE64 initial questions
Message-Id: <marc-linux-sound-90540301104759@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90515879913606@msgid-missing>
In-Reply-To: <marc-linux-sound-90515879913606@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

>> After using 'isapnp /etc/isapnp.conf', how can I tell it worked?  It didn't
>> complain, but there was also no information available in the normal /proc
>> files, such as /proc/{interrupts,dma,ioports} etc..  Should there be, or
>> only after the sound module is installed?
> 
> No; the information will only show up in /proc after the resources
> have been allocated by the kernel (i.e., the drivers have been loaded).

Hmm.. There must be _something_ I can use to discern whether or not it's
worked...

Dave
