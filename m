From: Bill Nottingham <notting@redhat.com>
Date: Tue, 08 Sep 1998 20:05:30 +0000
Subject: Re: Yamaha opl3
Message-Id: <marc-linux-sound-90529877531274@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90522162401464@msgid-missing>
In-Reply-To: <marc-linux-sound-90522162401464@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Catalin Marinescu (escu@ines.ro) said: 
>     Hi all !
>     I have a sound card Yamaha opl3 and I can't make it work on my linux
> system.
>     If anyone knows how can I fix this please help me.
> Thanks.

If you've got just a plain OPL3 (doubtful, but possible), just use the
OPL3 driver in the kernel.

If you've got an OPL3-SA1, use the OPL3-SA1 driver, available in the
2.1.x kernels, or in Alan Cox's modular sound backport to 2.0.3x.

If you've got an OPL3-SA2/3, you can use the ALSA drivers,
available at http://alsa.jcu.cz/

Alternatively, you could try the OSS/Linux drivers, available for
a free trial at http://www.opensound.com/linux.html - it supports
all the OPL3-SAx versions, according to the web site.

Bill
