From: ljp <lpotter@peakpeak.com>
Date: Mon, 10 May 1999 13:11:33 +0000
Subject: Re: SB16 pnp
Message-Id: <marc-linux-sound-92634215403548@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92629686810981@msgid-missing>
In-Reply-To: <marc-linux-sound-92629686810981@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

You have to edit /etc/isapnp.conf to include these lines-
 (IO 1 (BASE 0x0A20))
 (IO 2 (BASE 0x0E20))  
read the soundblaster  mini- HOW TO  at
ftp:metalab.unc.edu/pub/Linux/docs/HOWTO/unmaintained/mini/Soundblaster-16
it explains it fully-
have fun !!!
LP
