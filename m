From: Dan Hollis <goemon@sasami.anime.net>
Date: Mon, 22 Nov 1999 00:30:10 +0000
Subject: Re: AC97 codec on asus k7m?
Message-Id: <marc-linux-sound-94323096117099@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94322145708503@msgid-missing>
In-Reply-To: <marc-linux-sound-94322145708503@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Sun, 21 Nov 1999 buddy@dookie.net wrote:
> 00:00.0 Host bridge: Advanced Micro Devices: Unknown device 7006 (rev 23)
> 00:01.0 PCI bridge: Advanced Micro Devices: Unknown device 7007 (rev 01)

AMD 751 Northbridge as expected

> 00:04.0 ISA bridge: VIA Technologies, Inc.: Unknown device 0686 (rev 1b)

MVP4 ISA bridge

> 00:04.4 Class 0c05: VIA Technologies, Inc.: Unknown device 3057 (rev 20)

MVP4 ACPI

> 00:04.5 Multimedia audio controller: VIA Technologies, Inc.: Unknown device 3058 (rev 21)

MVP4 Audio Codec

So it looks like the asus k7m is AMD 751 northbridge + VIA MVP4
southbridge. Yes it can be supported. I dont know if anyone has written
MVP4 audio support yet.

-Dan
