From: " Raymond A. Ingles" <inglesra@frc.com>
Date: Fri, 11 Jun 1999 14:10:56 +0000
Subject: Re: SB32 Suse6.1
Message-Id: <marc-linux-sound-92911010932315@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92906274826363@msgid-missing>
In-Reply-To: <marc-linux-sound-92906274826363@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Fri, 11 Jun 1999, Carsten Friebel wrote:

> Hello,
> 
> I got aproblem with an original SB32. I have done the pnpdump and isapnp
> thing and it works like shown in the book.
> 
> isapnp isapnp.conf shows 4 devices (Audio, Game, wavetable, IDE).

 I've got an SB32 as well, and isapnp works fine. (Except that the game
port doesn't work - but it doesn't work in Windows, either, and I'm pretty
sure it's a hardware problem.)

> I tried to load the sb modul with
> 
> modprobe sb io=0x0220 irq=5 dma=1 dma16=5 mpu_io=0x0330

 I ran 'xconfig' on the kernel and put the correct values in the setup.
Then I recompiled the module. Finally, I just did 'insmod' without
arguments, and it seems to work fine.

 Sincerely,

 Ray Ingles          (248) 377-7735         ray.ingles@fanucrobotics.com

   We are Linux. Resistance is an indication that you missed the point.
                        - Brandon S. Allbery
