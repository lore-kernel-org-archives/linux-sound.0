From: Keith Duthie <keith.duthie@stonebow.otago.ac.nz>
Date: Sun, 13 Dec 1998 05:32:42 +0000
Subject: Re: help needed for cs423x chips
Message-Id: <marc-linux-sound-91355620615722@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91325015828495@msgid-missing>
In-Reply-To: <marc-linux-sound-91325015828495@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Sat, 12 Dec 1998, Tony Nugent wrote:

> options -k cs4232 io=0x530 dma=1 dma2=0 irq=5
> # no midi yet :(
> 
> 
> This works for the audio driver, but I have yet to get the midi to work.
options cs4232 io=0x530 irq=7 dma=1 dma2=0 mpuirq=9 mpuio=0x330

<Crystal audio controller (CS4236)> at 0x530 irq 7 dma 1,0
<MPU-401 (UART) MIDI> at 0x330 irq 9

ps anyone know how to get the sequencer working on these things?
-- 
     |                   Keith Duthie      O-               | 
     +         Don't call me, I'll call you.  Maybe.        +
     |           keith.duthie@stonebow.otago.ac.nz          |
   __   _
  / /  (_)__  __ ____  __
 / /__/ / _ \/ // /\ \/ /  . . .  t h e   c h o i c e   o f   a
/____/_/_//_/\_,_/ /_/\_\              G N U   g e n e r a t i o n . . .
