From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Date: Mon, 25 Jan 1999 01:13:32 +0000
Subject: Re: Problem with cs4232.o
Message-Id: <marc-linux-sound-91722352417456@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91722163016425@msgid-missing>
In-Reply-To: <marc-linux-sound-91722163016425@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

> The problem is that when I start up X, if I try to use the sound card
> a get a popping sound from the speakers and STDERR shows a messages
> stating that the program couldn't access /dev/dsp.  If I then run

That means its being used by something

> effect of loading Gnome, but I don't think so.

If you have esd running then yes
