From: Kevin Turner <Kevin.Turner@oberlin.edu>
Date: Fri, 11 Jun 1999 17:55:28 +0000
Subject: Re: Sound Recoder Error: could not allocate DMA buffer
Message-Id: <marc-linux-sound-92912334014346@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92912084111654@msgid-missing>
In-Reply-To: <marc-linux-sound-92912084111654@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

See /usr/src/linux/Documentation/sound/README.modules.
In brief, there are problems with ISA cards, DMA buffers, and machines
with over 16M of memory.  Adding the option "dmabuf=1" to the sound
module may help.

On Tue, Jul 13, 1999 at 08:23:21AM -0400, Laurent POIROT wrote:
> Error: could not allocate DMA buffer [...]
> It works perfectly for a while until this error [...]
> I use [...] a SoundBlaster Pro ISA.

-- 
Kevin.Turner@oberlin.edu | OpenPGP encryption welcome here, see X-DSA-Key
