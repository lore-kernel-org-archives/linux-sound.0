From: jhall@UU.NET (Jeremy Hall)
Date: Fri, 11 Jun 1999 16:35:26 +0000
Subject: Re: Sound Recoder Error: could not allocate DMA buffer
Message-Id: <marc-linux-sound-92912084111654@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I wonder if it is a dma/irq conflict with another device in your computer.
Is the news in tact when it records, or does it skip or otherwise seem not
to sound correct?

_J

Laurent POIROT said:
> After several recordings of wav files with wavrec, i have this Sound Recoder
> Error: could not allocate DMA buffer that comes out. I have no idea when
> this come from. I use a crontab to make a recording from that soundcard for
> 5 minutes on a wav file and i do that every 30 minutes. It works perfectly
> for a while until this error, if you have any idea, please let me know. I
> use Linux Redhat 5.2 with a SoundBlaster Pro ISA. Do you think that changing
> the sound card would change this problem ?
> 
> thanks
> 
