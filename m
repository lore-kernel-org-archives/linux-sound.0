From: Sangohn Christian <Christian.Sangohn@b19.rwth-aachen.de>
Date: Mon, 15 Feb 1999 13:30:01 +0000
Subject: Re: 2.2; sound stops after uptime
Message-Id: <marc-linux-sound-91908496403721@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91906861626467@msgid-missing>
In-Reply-To: <marc-linux-sound-91906861626467@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Mon, 15 Feb 1999, Nicolai Langfeldt wrote:
>Hi,
>
>I've got a SMP machine with a Creative 'ViBRA16X PnP' soundcard.
>I have the sound drivers loaded as modules, I load by 'modprobe sb'
>so they are not autoloaded or unloaded.
>
>lsmod:
>Module                  Size  Used by
>sb                     31148   2 
>uart401                 5644   2  [sb]
>sound                  55608   0  [sb uart401]
>soundcore               2244   5  [sb sound]
>
>conf.modules:
>  options sb io=0x220 irq=7 dma=1 mpu_io=0x330
>
>Using 2.2.0 and 2.2.1, leaving the machine over the weekend, when I get
>back there is no sound when playing sound.  It almost appears as if the
>volume level is 0. But the mixer setting is not 0.  Unloading and reloading
>the modules fixes the problem.

Do you have support for the kmod utility?
>
>Nicolai
--
   ,---._____________________________
  /                                  \   |~~\_____/~~\__  |
 | sango-ch@reze-1.rz.rwth-aachen.de  >---\______=== )-+
 |  ,---.___________________________/            ~~~|/~~  |
 |/                                                 ()
