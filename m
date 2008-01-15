From: Randy Dunlap <randy.dunlap@oracle.com>
Date: Tue, 15 Jan 2008 21:24:43 +0000
Subject: [PATCH 1/5] sound: fix mts64 section mismatches
Message-Id: <20080115132443.38648a8c.randy.dunlap@oracle.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lkml <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org
Cc: perex@perex.cz, akpm <akpm@linux-foundation.org>, samr <sam@ravnborg.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix section mismatches in mts64 by making a static variable __devinitdata.

WARNING: vmlinux.o(.data+0x2e33f0): Section mismatch: reference to .init.data:mts64_ctl_smpte_switch (between 'control.19929' and 'snd_mts64_rawmidi_output_ops')
WARNING: vmlinux.o(.data+0x2e33f8): Section mismatch: reference to .init.data:mts64_ctl_smpte_time_hours (between 'control.19929' and 'snd_mts64_rawmidi_output_ops')
WARNING: vmlinux.o(.data+0x2e3400): Section mismatch: reference to .init.data:mts64_ctl_smpte_time_minutes (between 'control.19929' and 'snd_mts64_rawmidi_output_ops')
WARNING: vmlinux.o(.data+0x2e3408): Section mismatch: reference to .init.data:mts64_ctl_smpte_time_seconds (between 'control.19929' and 'snd_mts64_rawmidi_output_ops')
WARNING: vmlinux.o(.data+0x2e3410): Section mismatch: reference to .init.data:mts64_ctl_smpte_time_frames (between 'control.19929' and 'snd_mts64_rawmidi_output_ops')
WARNING: vmlinux.o(.data+0x2e3418): Section mismatch: reference to .init.data:mts64_ctl_smpte_fps (between 'control.19929' and 'snd_mts64_rawmidi_output_ops')

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 sound/drivers/mts64.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-2.6.24-rc7-git7.orig/sound/drivers/mts64.c
+++ linux-2.6.24-rc7-git7/sound/drivers/mts64.c
@@ -662,7 +662,7 @@ static int __devinit snd_mts64_ctl_creat
 					  struct mts64 *mts) 
 {
 	int err, i;
-	static struct snd_kcontrol_new *control[] = {
+	static struct snd_kcontrol_new *control[] __devinitdata = {
 		&mts64_ctl_smpte_switch,
 		&mts64_ctl_smpte_time_hours,
 		&mts64_ctl_smpte_time_minutes,
