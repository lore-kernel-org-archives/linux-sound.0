From: Michael Rautenkranz <rautenkranzmt@ionempire.dyndns.org>
Date: Thu, 12 Jun 2003 21:44:02 +0000
Subject: Re: Help configuring a CS4236 to work with Linux
Message-Id: <marc-linux-sound-105545424403323@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-105519659910416@msgid-missing>
In-Reply-To: <marc-linux-sound-105519659910416@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Simon J Mudd wrote:

> I/O Port IRQ DMA 1 DMA 2 MPU I/O MPU IRQ
>
>0x530    5   0     0     0x330   5
>0x534    7   1     1     0x300   7
>
>Selecting 0x534,5,1,1,0x330,7
>
>  
>
DMA1 and DMA2 must be different values

i would suggest 0x534,5,0,1,0x330,7


