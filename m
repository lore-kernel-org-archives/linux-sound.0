From: Can Bican <bican@metu.edu.tr>
Date: Fri, 21 Jan 2000 11:11:58 +0000
Subject: Re: Some kind of ESS chip
Message-Id: <marc-linux-sound-94848569109455@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94709023919904@msgid-missing>
In-Reply-To: <marc-linux-sound-94709023919904@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


	Hello,

	Something new: sndconfig of Mandrake 7.0 says that it is not
supported. By the way, I also tried those (ES1938) drivers, but
frustration. As long as I know, this computer is a low cost promotion-type
computer of IBM, and if I am not wrong (that this card is not supported),
you should plug another PCI sound card to this to make sound in Linux. It
even hasn't got an ISA slot!
	Anyway, I'll try once more ES1938, but it hadn't worked...

	Regards.

On Fri, 21 Jan 2000 bizjak@rd.iskraemeco.si wrote:

> Date: Fri, 21 Jan 2000 11:02:05 +0100
> From: bizjak@rd.iskraemeco.si
> To: bican@metu.edu.tr
> Subject: Some kind of ESS chip
> 
> Hello!
> 
>         I have an IBM PC 300 GL, with Mandrake 6.1 installed. It has an
>         on-board kind of sound chip, and the pre-installed Windows 98
> was using a
>         kind of ESS driver for this. On the chip, exactly the following
> is
>         printed:
>                 ESS
>                 ES1930S F439
>                 TTUB3265V
>                 (P)4, 214, 125 (C)
>                 
>                 Ok, granted, it's an ESS, but what about 1930S? I
> haven't happened
>         to such a chipset anywhere. Expectedly, I've not been able to
> get it to
>         work, tried all ess modules along with sb and mss modules. I
> wonder if it
>         is really a new (or odd) chipset that no drivers for Linux
> exist, or am I
>         missing something?
> 
>   I'm not aware of ES1930, but there is ES1938, which is ESS Solo-1 PCI
> chip. This chip is supported by ALSA (please check
> http://www.alsa-project.org on how to download and install drivers).
> -- 
> 	Uros.
> 

-----
Can Bican
Bilgi Islem Daire Baskanligi, ODTU
METU Computer Center
