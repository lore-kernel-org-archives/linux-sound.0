From: Thomas Sailer <sailer@scs.ch>
Date: Tue, 17 Jun 2003 18:28:52 +0000
Subject: Re: S3 Sonic Vibes Linux driver
Message-Id: <marc-linux-sound-105587519706906@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-105580909208205@msgid-missing>
In-Reply-To: <marc-linux-sound-105580909208205@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Tue, 2003-06-17 at 02:17, Jonathon Horsman wrote:

> kernel: sv: version v0.31 time 12:14:29 Jun 17 2003
> kernel: PCI: Found IRQ 12 for device 02:00.0
> kernel: PCI: Failed to allocate resource 7(0-1f) for 02:00.0
> kernel: sv: cannot allocate DDMA controller io ports

The kernel proper wasn't able to allocate IO addresses for the DDMA
controllers.

> Your site gives a command line option: dmaio=x
> However I'm uncertain what parameter should be passed here.

This parameter no longer exists for eons, DDMA address allocation should
be automatic.

Tom

