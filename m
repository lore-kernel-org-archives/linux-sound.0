From: Bill Nottingham <notting@redhat.com>
Date: Fri, 08 Jan 1999 16:07:58 +0000
Subject: Re: Terratec EWS64XL
Message-Id: <marc-linux-sound-91591659320160@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91579484603022@msgid-missing>
In-Reply-To: <marc-linux-sound-91579484603022@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Norbert Reiter (reiter@pc211.ict.tuwien.ac.at) said: 
> Has enyone some expiriences with the Terratec EWS64XL soundcard and Linux?
> I tried to compile the kernel (2.0.35) with the native Crystal-Support but
> my soundcard is not recognized.
> How can I get the card to work?

You're probably best off with the sam9407 driver, available at:
http://www.anime.net/~goemon/linux-sam9407/

(This is currently in development, so I don't know how well it
works...)

Bill
