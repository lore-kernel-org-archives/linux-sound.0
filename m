From: LuftHans <LuftHans@asu.edu>
Date: Mon, 17 May 1999 01:05:54 +0000
Subject: Re: SB PRo compatible with no valid driver
Message-Id: <marc-linux-sound-92693638704851@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92672963004016@msgid-missing>
In-Reply-To: <marc-linux-sound-92672963004016@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Fri, 14 May 1999, Karim Yaghmour wrote:

> Hello,
> 
> I just got a notebook that has SB Pro compatible card
> (Don't they all :) ). To make long stories short, it
> doesn't work with any driver configuration I've seen
> on the linux laptop pages or in
> linux/Documentation/sound/
> In windows it says that it's Sound Blaster Pro
> compatible at 0x220 with irq 5. I also know that
> there's a yamaha synthesizer chip (read OPL3 compatible).
> 
> Now, even if I load only the uart401 and sb with
> the right paraemeters, I always get :
> ... 'dev/dsp': Device or resource busy

Karim,

this is the error I kept getting due to bios not making the irq available. Try
loading the module with an irq above those being used. I moved mine to 9 and
haven't had that problem since then.

ciao,

der.hans

<schnipp, schnapp>

> Thanx in advance!
> 
> =======================
>               Karim Yaghmour
>           karym@info.polymtl.ca
>             Computer Engineer
>       Ecole Polytechnique de Montreal
> =======================
> 

# +++++++++++=================+++++++++++ #
#                   LuftHans@asu.edu                      #
#            http://home.pages.de/~lufthans/              #
#             I've got a photographic memory,             #
#         but I'm lousy photographer. - der.hans          #
# ======+++++++++++++++++++++++++++++++++====== #
