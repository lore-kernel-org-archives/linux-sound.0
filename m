From: Jonathan Masters <mastersj@periscope-systems.freeserve.co.uk>
Date: Thu, 19 Aug 1999 01:08:37 +0000
Subject: Multiple sbs with module
Message-Id: <marc-linux-sound-93502551628718@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,
    I currently have an SB 64 AWE GOLD PNP set up using the "sb" module
(and it's friends....) with settings IRQ 5. DMA 1 and 5, standard stuff.

    I have a lower spec'd SB 16 (vibra) PNP value card (which *does*
work with Linux as it used to be my main card). I have the two using
resources correctly and have resolved all conflicts. The trouble is, I
must use modules due to the pnp situation with the cards (bios is less
than 6months old (AMI), but it still doesn't get it right if left to
itself) so I have been running isapnp during boot and then adding the sb
driver. However, I now wish to have *2* sb's with the same module. This
would be trivially easy with the code in the kernel (simply setting
SB2_BASE et al), but I must have it in the module. Can this be achieved?
If not, can anyone suggest/provide a patch which will do this/tell me to
upgrade kernel to 2.3.xx etc... I have 2.2.11. Thanx guys. I can't see
this as being impossible it's just that the docs don't mention two cards
with a module.

Jon.

--
Jonathan C. Masters (jonathan@oxlug.org) PGP: www.brookes.ac.uk/~95227860/KEY

"Upon this rock I will build my church
and the gates of hell shall not prevail against it". -- Matthew 16, 17-18
