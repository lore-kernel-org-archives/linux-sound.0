From: Dave Wreski <dave@nic.com>
Date: Wed, 09 Sep 1998 05:02:13 +0000
Subject: Re: AWE64 initial questions
Message-Id: <marc-linux-sound-90533433008747@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90515879913606@msgid-missing>
In-Reply-To: <marc-linux-sound-90515879913606@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

>> Can someone tell me how to get the PnP stuff going?  Where do I get
>> started?  Whereis the FAQ?  Is the isapnptools necessary under 2.1 still?
>
> Hello Dave and all,
> here is what i did with isapnp to my AWE64Gold:

Ok, as it turns out, I did get it going.  I used the sndconfig program found at
ftp.redhat.com:/pub/sound/ and it generated an /etc/isapnp.conf file identical
to yours.  Has anyone else used this program, or must I go to
redhat-sound@redhat.com for questions on this?

After using 'isapnp /etc/isapnp.conf', how can I tell it worked?  It didn't
complain, but there was also no information available in the normal /proc files,
such as /proc/{interrupts,dma,ioports} etc..  Should there be, or only after the
sound module is installed?

> You can find Your Win95 config in a file named CTPNP.CFG in the Windows
> directory and set the values accordingly to avoid resource conflicts.

Umm... yeah.. No windows here..

> Remember that you have to download a sound font bank to the Wave table
> with a command like this:
> 
> /usr/local/bin/sfxload
> /win95/Programme/Creative/ctsnd/sfbank/synthgs.sbk

Where can I find these necessary files?

Any idea why an RPM hasn't been created for the SBAWE64 yet?  I would think this
methodical process would be easy to create an RPM for...

Thanks,
Dave
