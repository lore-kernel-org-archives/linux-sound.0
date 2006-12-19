From: Kyle Moffett <mrmacman_g4@mac.com>
Date: Tue, 19 Dec 2006 15:44:32 +0000
Subject: Re: OSS driver removal, 3nd round
Message-Id: <C51D50F0-D9DB-464F-9B0B-22516B3DC4B5@mac.com>
List-Id: <linux-sound.vger.kernel.org>
References: <20061219041159.GA6993@stusta.de>
In-Reply-To: <20061219041159.GA6993@stusta.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Bunk <bunk@stusta.de>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, Alan Cox <alan@lxorguk.ukuu.org.uk>, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org

On Dec 18, 2006, at 23:11:59, Adrian Bunk wrote:
> 1. ALSA drivers for the same hardware
>
> DMASOUND_PMAC

Acked-By: Kyle Moffett <mrmacman_g4@mac.com>

I don't think I've ever used this sound driver on any of my  
PowerMacs, ranging back to my aged 400MHz box, which is (I believe)  
the only piece of hardware I own which it supports, and the ALSA  
driver plays sound on that system perfectly.  Admittedly the ALSA  
driver's a bit more flaky on my newer G5 and powerbook but I don't  
think the DMASOUND_PMAC driver _ever_ supported those (and I doubt it  
ever will).

Cheers,
Kyle Moffett

