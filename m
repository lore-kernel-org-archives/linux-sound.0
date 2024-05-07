Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8615515ECE4
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 13:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715090116; cv=none; b=jVA2lQ6KMFYr6eWxZhUOYC35VvA+wckt0xX4Qu2KUzQd9cVhWh+Xsdx5mBZNRTw0wxycj/5JCeJlpA1079l6OlGPbYbUF4eJK8k5vOmI+g7P9KWlwqJhUTW9t5KTaW58aUY90oEJJbvOFYb6fT2lTc/wjXHAGrd+LvV5DjszKak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715090116; c=relaxed/simple;
	bh=yjV4VMQ8MHrkKXPl2rB06uprr0idwt085wgGuusTX8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t+pIBWm06LwFfpBSMCnk/d0XdlgKRQ33X8Qk/Dx1xnRFscpBKAIlGVbjBjkjPap+bbT7F6J1qEux54IhzgXkx2rulWZF72QAIfT4NtVMZ/aQ9gh7NU03tGPiFPATqHyAH3/ry4+trcEBTA2W4d+un/CdStLaRmlqL2EQXl9dsXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C7C3420AE5;
	Tue,  7 May 2024 13:55:08 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B82B313A2D;
	Tue,  7 May 2024 13:55:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iJxtLLwyOmagMgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 13:55:08 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 5/9] ALSA: usb: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 15:55:05 +0200
Message-ID: <20240507135513.14919-6-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507135513.14919-1-tiwai@suse.de>
References: <20240507135513.14919-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: C7C3420AE5
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action

*-objs suffix is reserved rather for (user-space) host programs while
usually *-y suffix is used for kernel drivers (although *-objs works
for that purpose for now).

Let's correct the old usages of *-objs in Makefiles.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/6fire/Makefile  | 2 +-
 sound/usb/Makefile        | 4 ++--
 sound/usb/hiface/Makefile | 2 +-
 sound/usb/misc/Makefile   | 2 +-
 sound/usb/usx2y/Makefile  | 4 ++--
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/usb/6fire/Makefile b/sound/usb/6fire/Makefile
index 7d353bbf7493..587f25c64e56 100644
--- a/sound/usb/6fire/Makefile
+++ b/sound/usb/6fire/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-usb-6fire-objs += chip.o comm.o midi.o control.o firmware.o pcm.o
+snd-usb-6fire-y += chip.o comm.o midi.o control.o firmware.o pcm.o
 obj-$(CONFIG_SND_USB_6FIRE) += snd-usb-6fire.o
 
diff --git a/sound/usb/Makefile b/sound/usb/Makefile
index 8c657c2753c8..0532499dbc6d 100644
--- a/sound/usb/Makefile
+++ b/sound/usb/Makefile
@@ -3,7 +3,7 @@
 # Makefile for ALSA
 #
 
-snd-usb-audio-objs := 	card.o \
+snd-usb-audio-y := 	card.o \
 			clock.o \
 			endpoint.o \
 			format.o \
@@ -25,7 +25,7 @@ snd-usb-audio-objs := 	card.o \
 snd-usb-audio-$(CONFIG_SND_USB_AUDIO_MIDI_V2) += midi2.o
 snd-usb-audio-$(CONFIG_SND_USB_AUDIO_USE_MEDIA_CONTROLLER) += media.o
 
-snd-usbmidi-lib-objs := midi.o
+snd-usbmidi-lib-y := midi.o
 
 # Toplevel Module Dependency
 obj-$(CONFIG_SND_USB_AUDIO) += snd-usb-audio.o snd-usbmidi-lib.o
diff --git a/sound/usb/hiface/Makefile b/sound/usb/hiface/Makefile
index 8f3b24e7d6c2..997c1558d0cb 100644
--- a/sound/usb/hiface/Makefile
+++ b/sound/usb/hiface/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-usb-hiface-objs := chip.o pcm.o
+snd-usb-hiface-y := chip.o pcm.o
 obj-$(CONFIG_SND_USB_HIFACE) += snd-usb-hiface.o
diff --git a/sound/usb/misc/Makefile b/sound/usb/misc/Makefile
index 068ecd7bc043..3e9f4adc28de 100644
--- a/sound/usb/misc/Makefile
+++ b/sound/usb/misc/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-ua101-objs := ua101.o
+snd-ua101-y := ua101.o
 obj-$(CONFIG_SND_USB_UA101) += snd-ua101.o
diff --git a/sound/usb/usx2y/Makefile b/sound/usb/usx2y/Makefile
index cc4c2f1efab2..fc033aba03a4 100644
--- a/sound/usb/usx2y/Makefile
+++ b/sound/usb/usx2y/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
-snd-usb-usx2y-objs := usbusx2y.o usX2Yhwdep.o usx2yhwdeppcm.o
-snd-usb-us122l-objs := us122l.o
+snd-usb-usx2y-y := usbusx2y.o usX2Yhwdep.o usx2yhwdeppcm.o
+snd-usb-us122l-y := us122l.o
 
 obj-$(CONFIG_SND_USB_USX2Y) += snd-usb-usx2y.o
 obj-$(CONFIG_SND_USB_US122L) += snd-usb-us122l.o
-- 
2.43.0

