From: Alan Stern <stern@rowland.harvard.edu>
Date: Sat, 26 Nov 2005 23:10:07 +0000
Subject: Problem with Ensoniq ES1371 sound driver
Message-Id: <Pine.LNX.4.44L0.0511261801280.19297-100000@netrider.rowland.org>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I've got an old Ensoniq ES1371 sound card, and the 2.6.14 snd_ens1371 
driver doesn't work right with it.  Here's the PCI info:

# lspci -v -s 11.0
00:11.0 Multimedia audio controller: Ensoniq ES1371 [AudioPCI-97] (rev 08)
        Subsystem: Ensoniq Creative Sound Blaster AudioPCI64V, AudioPCI128
        Flags: bus master, slow devsel, latency 64, IRQ 11
        I/O ports at cc00 [sized]
        Capabilities: [dc] Power Management version 1

The driver thinks the card has a SP/DIF capability, but in fact it does
not.  When the mixer driver tries to turn on the non-existent spdif
output, it completely messes up the sound.  There's a loud, permanent
static hissing.

I could get my card working okay by using the patch below.  You'll 
probably want to adjust it somehow; let me know if I can be of any help.

Alan Stern



--- a/sound/pci/ens1370.c	2005-11-14 09:46:42.000000000 -0500
+++ b/sound/pci/ens1370.c	2005-11-26 16:53:45.000000000 -0500
@@ -1573,7 +1573,7 @@
 	{ .vid = PCI_VENDOR_ID_ENSONIQ, .did = PCI_DEVICE_ID_ENSONIQ_CT5880, .rev = CT5880REV_CT5880_D },
 	{ .vid = PCI_VENDOR_ID_ENSONIQ, .did = PCI_DEVICE_ID_ENSONIQ_CT5880, .rev = CT5880REV_CT5880_E },
 	{ .vid = PCI_VENDOR_ID_ENSONIQ, .did = PCI_DEVICE_ID_ENSONIQ_ES1371, .rev = ES1371REV_CT5880_A },
-	{ .vid = PCI_VENDOR_ID_ENSONIQ, .did = PCI_DEVICE_ID_ENSONIQ_ES1371, .rev = ES1371REV_ES1373_8 },
+//	{ .vid = PCI_VENDOR_ID_ENSONIQ, .did = PCI_DEVICE_ID_ENSONIQ_ES1371, .rev = ES1371REV_ES1373_8 },
 	{ .vid = PCI_ANY_ID, .did = PCI_ANY_ID }
 };
 

