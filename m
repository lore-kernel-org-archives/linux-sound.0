From: Bill Nottingham <notting@redhat.com>
Date: Tue, 18 Apr 2000 19:13:01 +0000
Subject: Re: some advice About Wave Table cards
Message-Id: <marc-linux-sound-95608873303007@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95608207528099@msgid-missing>
In-Reply-To: <marc-linux-sound-95608207528099@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

paco@hydrofunk.org (paco@hydrofunk.org) said: 
> On Tue, 18 Apr 2000, SRV wrote:
> > And I have 3 choices from my local computer retailer:
> > 1.- SB AWE 128 pci card
> > 2.- SB PCI 128 Ensoniq chipset ct4810
> > 3.- SB 512 PCI
> 
> >  Which one has better support in Linux?

Well, if you're actually looking for wavetable support, the SB 512
(using the same chipset as the SB Live!) is the only one of those
three that actually *has* a hardware wavetable synthsizer on it.

The emu10ki synth on the SB 512 is supported by ALSA, IIRC.

Bill
