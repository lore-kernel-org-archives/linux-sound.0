From: Thomas Sailer <sailer@ife.ee.ethz.ch>
Date: Thu, 25 Feb 1999 12:41:12 +0000
Subject: Re: Sound with SB128
Message-Id: <marc-linux-sound-91994666909083@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91994631408849@msgid-missing>
In-Reply-To: <marc-linux-sound-91994631408849@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Anthony JAGUENAUD wrote:
> 
> How can I do to configure my sound card under RH5.1
> 
> The pro-SB dos emulation is not recongnise, ans the setup does not known
> any thing about SB128

The SB emulation of the SB128 is a software thing, and thus only runs
under
DOS.

Linux-2.2.x contains two drivers, es1370 and es1371, one of which should
work with your card.

Tom
