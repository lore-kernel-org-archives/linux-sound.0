From: Bill Nottingham <notting@redhat.com>
Date: Sat, 03 Apr 1999 20:35:56 +0000
Subject: Re: SB64D PCI built into mother board
Message-Id: <marc-linux-sound-92317248714669@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92316981013401@msgid-missing>
In-Reply-To: <marc-linux-sound-92316981013401@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Tim Hughes (tphughes@insnet.com) said: 
> I am just wondering if it is possible to compile support for the
> SoundBlaster 64D PCI into the kernel.  I have tried, but it does not get
> detected.  The soundcard is built into the motherboard.  I am using
> linux kernel 2.2.1 

What does 'cat /proc/pci' or 'cat /proc/bus/pci/devices' say?

Bill
