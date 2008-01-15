From: Randy Dunlap <randy.dunlap@oracle.com>
Date: Tue, 15 Jan 2008 21:25:46 +0000
Subject: [PATCH 5/5] sound: fix caiaq section mismatches
Message-Id: <20080115132546.b96de6a2.randy.dunlap@oracle.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lkml <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org
Cc: perex@perex.cz, akpm <akpm@linux-foundation.org>, samr <sam@ravnborg.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix section mismatch in caiaq: these __devinit functions can be
called at any time so they should not be __devinit.

WARNING: vmlinux.o(.text+0x10a8dae): Section mismatch: reference to .init.text:snd_usb_caiaq_audio_init (between 'setup_card' and 'create_card')
WARNING: vmlinux.o(.text+0x10a8dd6): Section mismatch: reference to .init.text:snd_usb_caiaq_midi_init (between 'setup_card' and 'create_card')

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 sound/usb/caiaq/caiaq-audio.c |    2 +-
 sound/usb/caiaq/caiaq-midi.c  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--- linux-2.6.24-rc7-git7.orig/sound/usb/caiaq/caiaq-audio.c
+++ linux-2.6.24-rc7-git7/sound/usb/caiaq/caiaq-audio.c
@@ -606,7 +606,7 @@ static void free_urbs(struct urb **urbs)
 	kfree(urbs);
 }
 
-int __devinit snd_usb_caiaq_audio_init(struct snd_usb_caiaqdev *dev)
+int snd_usb_caiaq_audio_init(struct snd_usb_caiaqdev *dev)
 {
 	int i, ret;
 
--- linux-2.6.24-rc7-git7.orig/sound/usb/caiaq/caiaq-midi.c
+++ linux-2.6.24-rc7-git7/sound/usb/caiaq/caiaq-midi.c
@@ -124,7 +124,7 @@ void snd_usb_caiaq_midi_handle_input(str
 	snd_rawmidi_receive(dev->midi_receive_substream, buf, len);
 }
 
-int __devinit snd_usb_caiaq_midi_init(struct snd_usb_caiaqdev *device)
+int snd_usb_caiaq_midi_init(struct snd_usb_caiaqdev *device)
 {
 	int ret;
 	struct snd_rawmidi *rmidi;
