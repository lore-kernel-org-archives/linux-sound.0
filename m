From: Thomas Sailer <sailer@ife.ee.ethz.ch>
Date: Mon, 11 Jan 1999 13:00:23 +0000
Subject: Re: Sound Blaster Live
Message-Id: <marc-linux-sound-91609078528867@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91601800923989@msgid-missing>
In-Reply-To: <marc-linux-sound-91601800923989@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Steven Clark wrote:

> I am just curious to know if anyone has been successful in getting the
> SB Live to work under linux, I have tried the newest possible kernel
> 2.2.pre6
> with no luck, I compiled support for both the ES1371 and 70 yet nothing.

The SB live is a totally different beast than the SB 64/128 PCI.
The ES137x drivers are for the latter. Creative didn't release
any spec for the SB live so far, therefore there's no GPL'd driver
for it available.

Tom
