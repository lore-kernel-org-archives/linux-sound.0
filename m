From: Andy Lo A Foe <andy@alsa-project.org>
Date: Wed, 29 Sep 1999 09:52:33 +0000
Subject: Re: cdplayers
Message-Id: <marc-linux-sound-93859863315748@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93856264521862@msgid-missing>
In-Reply-To: <marc-linux-sound-93856264521862@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Pietro Massini <pmassini@cadnet.marche.it> wrote:

> Anyone knows of a software for playing audio cd's (not just one track at
> a time) for X that makes the soundcard do the D/A conversion?

You can try alsaplayer, it includes a CDDA plugin that rips audio tracks
and sends them directly to the soundcard DAC. It also allows for variable
speed (pitch) control, even backwards :)

http://www.alsa-project.org/~andy/
