From: Karim Yaghmour <karym@info.polymtl.ca>
Date: Tue, 18 May 1999 16:11:24 +0000
Subject: Re: SB PRo compatible with no valid driver
Message-Id: <marc-linux-sound-92714134930063@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92672963004016@msgid-missing>
In-Reply-To: <marc-linux-sound-92672963004016@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

LuftHans wrote:
> Karim,
> 
> this is the error I kept getting due to bios not making the irq available. Try
> loading the module with an irq above those being used. I moved mine to 9 and
> haven't had that problem since then.
> 

I did try this, among many other things, but it seems that the BIOS simply
doesn't give anything for the sound card. Supposedly it's a Plug-and-Play
so I tried "pnpdump" but that doesn't find anything at all. What bewilders
me is the fact that windows has no problem with the card!

=======================
              Karim Yaghmour
          karym@info.polymtl.ca
            Computer Engineer
      Ecole Polytechnique de Montreal
=======================
